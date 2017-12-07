package controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileUploadException;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext;

import com.mysql.jdbc.CallableStatement;

/**
 * Servlet implementation class ThemTinTuc
 */
@WebServlet("/admin/add-news")
@MultipartConfig(location="", fileSizeThreshold=1024*1024, 
maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class ThemTinTuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private CallableStatement cst;
	private PreparedStatement stmt;
	private ResultSet rs_url;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemTinTuc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = getServletContext()
                .getRequestDispatcher("/WEB-INF/Pages/Admin/ThemTinTuc.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// Create a factory for disk-based file items
			
			DiskFileItemFactory factory = new DiskFileItemFactory();

			// Configure a repository (to ensure a secure temp location is used)
			ServletContext servletContext = this.getServletConfig().getServletContext();
			File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
			factory.setRepository(repository);

			// Create a new file upload handler
			ServletFileUpload upload = new ServletFileUpload(factory);

			// Parse the request
			
			String[] formInfo = new String[4]; 
			InputStream image = null;
			try {
				List<FileItem> items = upload.parseRequest(new ServletRequestContext(request));
				Iterator<FileItem> iter = items.iterator();
				int i=0;
				while (iter.hasNext()) {
				    FileItem item = iter.next();

				    if (item.isFormField()) {
				    	formInfo[i++] = item.getString("UTF-8");
				    }
				    else {
				    	image = item.getInputStream();
				    }
				}
				
			} catch (FileUploadException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			response.setCharacterEncoding("UTF-8");
			response.setContentType("text/html; charset=UTF-8");
			
			request.setCharacterEncoding("UTF-8");						
			
			request.setAttribute("returnSubject", formInfo[0]);
			request.setAttribute("returnTitle",  formInfo[1]);
			request.setAttribute("returnUrl",  formInfo[2]);
			request.setAttribute("returnContent",  formInfo[3].replaceAll("\'", "\\\"").replaceAll("\"", "&quot;"));


        	String imagePath = "";//lấy 1 đường dẫn tới project
        	String s = getClass().getName();
        	int i = s.lastIndexOf(".");
        	if(i > -1) s = s.substring(i + 1);
        	s = s + ".class";

        	String testPath = this.getClass().getResource(s).toString();
        	int index = testPath.lastIndexOf("/.metadata/.plugins/");
        	imagePath = testPath.substring(5, index);
        	//tạo đường dẫn lưu ảnh
        	imagePath = imagePath + "/TrungTamTinHoc/WebContent/Assets/Images/TinTuc/" + formInfo[2] + ".jpg";
        	
			BufferedImage b = ImageIO.read(image);
			
			ImageIO.write(b, "jpg", new File(imagePath));	        
	       try {
	        	String sql_url = "Select Id from news where url = '" + formInfo[2] + "'";
	        	
	        	conn = dataAccess.DBConnector.getConnection();
				stmt = conn.prepareStatement(sql_url);
				rs_url = stmt.executeQuery();
				
				request.setAttribute("isChecked", 1);
				request.setAttribute("urlCheck", 1);
				String pass = "";
				while(rs_url.next()) {
					request.setAttribute("urlCheck", 0);
					pass = rs_url.getString(1);
				}
				if(pass != "") {			
					RequestDispatcher rd = getServletContext()
		                    .getRequestDispatcher("/WEB-INF/Pages/Admin/ThemTinTuc.jsp");
					rd.forward(request, response);
				}
				else {
					
					cst = (CallableStatement) conn.prepareCall("{call sp_insert_News (?,?,?,?,?)}");
					cst.setString(1,  formInfo[0].toString());
					cst.setString(2,  formInfo[1].toString());
					cst.setString(3,  formInfo[2].toString());
					cst.setString(4,  "/TrungTamTinHoc/Assets/Images/TinTuc/" + formInfo[2] + ".jpg");
					
					cst.setString(5,  formInfo[3].toString());
					cst.executeUpdate();
				            
					request.setAttribute("message", "Thêm mới tin tức thành công!");
					response.sendRedirect("/TrungTamTinHoc/tin-tuc/" + formInfo[2].toString());
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}



















