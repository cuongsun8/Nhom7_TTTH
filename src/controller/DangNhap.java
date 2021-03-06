package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DangNhap
 */
@WebServlet("/dang-nhap")
public class DangNhap extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangNhap() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		if(request.getParameter("username") == null || request.getParameter("password") == null){
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/WEB-INF/Pages/NavBarPage/DangNhap.jsp");
			rd.forward(request, response);
		}
		else{
		String sql = "Select Password, Level from accounts where UserName = '" +
		request.getParameter("username") + "' or Email = '" + 
				request.getParameter("username") + "'";	
		try {
			request.setAttribute("returnUsername", request.getParameter("username"));
			request.setAttribute("returnPass", request.getParameter("password"));
			request.setAttribute("isChecked", 1);
			conn = dataAccess.DBConnector.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			String pass = "";
			@SuppressWarnings("unused")
			int capDo=1;
			request.setAttribute("usernameCheck", 0);
			request.setAttribute("passwordCheck", 0);
			while(rs.next()) {
				request.setAttribute("usernameCheck", 1);
				pass = rs.getString("Password");
				capDo = rs.getInt("Level");
			}
			if(pass != "") {			
				String inputPass = request.getParameter("password").toString();
				if(inputPass.equals(pass.toString())) {		
					request.setAttribute("passwordCheck", 1);
					
					
					session.setAttribute("user", request.getParameter("username"));
					session.setAttribute("capdo", capDo);
					
					response.sendRedirect("/TrungTamTinHoc/trang-chu");
				}
				else {
					RequestDispatcher rd = getServletContext()
		                    .getRequestDispatcher("/WEB-INF/Pages/NavBarPage/DangNhap.jsp");
					rd.forward(request, response);
				}
				
			}
			else {
				RequestDispatcher rd = getServletContext()
	                    .getRequestDispatcher("/WEB-INF/Pages/NavBarPage/DangNhap.jsp");
				rd.forward(request, response);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
	}

}
