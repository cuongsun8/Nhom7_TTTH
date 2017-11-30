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

import com.mysql.jdbc.CallableStatement;

/**
 * Servlet implementation class DangKy
 */
@WebServlet("/dang-ky")
public class DangKyTaiKhoan extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs_username;
	private ResultSet rs_email;
	CallableStatement cst;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKyTaiKhoan() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("username") == null || request.getParameter("password") == null ||
				request.getParameter("email") == null){
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/WEB-INF/Pages/NavBarPage/DangKy.jsp");
			rd.forward(request, response);
		}
		else{
		String sql_username = "Select Password from accounts where UserName = '" + request.getParameter("username") + "'";	
		String sql_email = "Select Password from accounts where Email ='"+ request.getParameter("email") + "'";
		try {
			request.setAttribute("returnUsername", request.getParameter("username"));
			request.setAttribute("returnEmail", request.getParameter("email"));
			request.setAttribute("returnPass", request.getParameter("password"));
			request.setAttribute("returnConfirm", request.getParameter("confirm"));
			
			request.setAttribute("isChecked", 1);
			
			conn = dataAccess.DBConnector.getConnection();
			stmt = conn.prepareStatement(sql_username);
			rs_username = stmt.executeQuery();
			stmt = conn.prepareStatement(sql_email);
			rs_email = stmt.executeQuery();
			
			request.setAttribute("usernameCheck", 1);
			request.setAttribute("emailCheck", 1);
			String pass = "";
			while(rs_username.next()) {
				request.setAttribute("usernameCheck", 0);
				pass = rs_username.getString(1);
			}
			while(rs_email.next()) {
				request.setAttribute("emailCheck", 0);
				pass = rs_email.getString(1);
			}
			
			if(pass != "") {			
					RequestDispatcher rd = getServletContext()
		                    .getRequestDispatcher("/WEB-INF/Pages/NavBarPage/DangKy.jsp");
					rd.forward(request, response);
				}
			else {
				cst = (CallableStatement) conn.prepareCall("{call sp_insert_account (?,?,?)}");
				cst.setString(1, request.getParameter("username"));
				cst.setString(2, request.getParameter("email"));
				cst.setString(3, request.getParameter("password"));
				cst.execute();
				request.setAttribute("passwordCheck", 1);
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
