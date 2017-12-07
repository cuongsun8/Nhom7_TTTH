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

import dataAccess.DataProvider;
import dataAccess.DataRow;
import dataAccess.DataTable;
import models.TinTuc;

/**
 * Servlet implementation class ThemTinTuc
 */
@WebServlet("/admin/update-news")
@MultipartConfig(location="", fileSizeThreshold=1024*1024, 
maxFileSize=1024*1024*5, maxRequestSize=1024*1024*5*5)
public class CapNhatTinTuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private CallableStatement cst;
	private PreparedStatement stmt;
	private ResultSet rs_url;
	@SuppressWarnings("unused")
	private String updateID;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CapNhatTinTuc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action") == null ? "error" : request.getParameter("action");
		String var1 = "sua";
		String var2 = "xoa";
		if(action.contains(var1)){
		request.setAttribute("requestID", request.getParameter("ID"));
		DataProvider dataProvider = new DataProvider("jdbc:mysql://localhost/trungtamtinhoc?autoReconnect=true&useSSL=false", "root", "123456789");
		DataTable table = dataProvider.executeQuery("SELECT * FROM news where Id=" + request.getParameter("ID"));
		models.TinTuc news = new models.TinTuc();
		for (DataRow row : table) {
			news = new TinTuc(row.column("ChuDe", String.class),
					row.column("TuaDe", String.class),
					row.column("Url", String.class), 
					row.column("Image", String.class), 
					row.column("Content", String.class), 
					row.column("Discription", String.class));
			
            request.setAttribute("updateContent", news);
            updateID = request.getParameter("ID");
        }
		RequestDispatcher rd = getServletContext()
                .getRequestDispatcher("/WEB-INF/Pages/Admin/ThemTinTuc.jsp");
		rd.forward(request, response);
		}
		else 
		if(action.contains(var2)){
			doPost(request, response);
		}
		else {
			RequestDispatcher rd = getServletContext()
	                .getRequestDispatcher("/WEB-INF/Pages/Admin/ThemTinTuc.jsp");
			rd.forward(request, response);
		}
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
			
			String var2 = "xoa";
			String action = "check";
			action = request.getParameter("action") == null ? "error" : request.getParameter("action");
			if(action.contains(var2)){
				DataProvider dataProvider = new DataProvider("jdbc:mysql://localhost/trungtamtinhoc?useUnicode=true&characterEncoding=utf-8", "root", "123456789");
				
				dataProvider.executeUpdate("DELETE FROM news WHERE Id = ?", request.getParameter("ID"));
				
				response.sendRedirect("/TrungTamTinHoc/admin/cap-nhat-tin-tuc");
				return;
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
	        	String sql_url = "Select Id from news where url = '" + formInfo[2] + "' and Id <> " + updateID ;
	        	System.out.println(sql_url);
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
					
					cst = (CallableStatement) conn.prepareCall("{call sp_update_News (?,?,?,?,?,?)}");
					cst.setString(1,  updateID);
					cst.setString(2,  formInfo[0].toString());
					cst.setString(3,  formInfo[1].toString());
					cst.setString(4,  formInfo[2].toString());
					cst.setString(5,  "/TrungTamTinHoc/Assets/Images/TinTuc/" + formInfo[2] + ".jpg");
					cst.setString(6,  formInfo[3].toString());
					cst.executeUpdate();
		            
					request.setAttribute("message", "Cập nhật tin tức thành công!");
					RequestDispatcher rd = getServletContext()
		                    .getRequestDispatcher("/WEB-INF/Pages/Admin/CapNhatTinTuc.jsp");
					rd.forward(request, response);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}

}



















