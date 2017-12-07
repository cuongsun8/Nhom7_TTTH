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
 * Servlet implementation class DangKyMonHoc
 */
@WebServlet("/dang-ky-mon-hoc")
public class DangKyMonHoc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKyMonHoc() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = getServletContext()
                .getRequestDispatcher("/WEB-INF/Pages/SupPage/DangKyMonHoc.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String hoten = request.getParameter("hoten");
		String email = request.getParameter("email");
		String dienthoai = request.getParameter("dienthoai");
		String doituong = request.getParameter("doituong");
		String ghichu = request.getParameter("ghichu");
		String maMH = request.getParameter("maMH");
		String maLichHoc = request.getParameter("maLichHoc");
		String sql_register = "Select Id from online_registered where TenHV = '" + hoten + "'" +
		" and email='" + email + "' and MaMH='" + maMH + "' and MaLichHoc='" + maLichHoc + "'";
		
		request.setAttribute("returnHoten", hoten);
		request.setAttribute("returnEmail", email);
		request.setAttribute("returnSdt", dienthoai);
		request.setAttribute("returnDoituong", doituong);
		request.setAttribute("returnGhichu", ghichu);
		request.setAttribute("returnMaMH", maMH);
		request.setAttribute("returnMaLichHoc", maLichHoc);
		
		request.setAttribute("isChecked", 1);
		
		
		try {
			conn = dataAccess.DBConnector.getConnection();
			stmt = conn.prepareStatement(sql_register);
			rs = stmt.executeQuery();
			
			request.setAttribute("registerCheck", 1);
			String flag = "";
			while(rs.next()) {
				request.setAttribute("registerCheck", 0);
				flag = rs.getString(1);
			}
			if(flag != "") {			
				RequestDispatcher rd = getServletContext()
	                    .getRequestDispatcher("/WEB-INF/Pages/SupPage/DangKyMonHoc.jsp");
				rd.forward(request, response);
			}
		else {
			cst = (CallableStatement) conn.prepareCall("{call sp_Insert_Online_resgister (?,?,?,?,?,?,?)}");
			cst.setString(1, hoten);
			cst.setString(2, email);
			cst.setString(3, dienthoai);
			cst.setString(4, doituong);
			cst.setString(5, ghichu);
			cst.setInt(6, Integer.parseInt(maMH));
			cst.setInt(7, Integer.parseInt(maLichHoc));
			cst.execute();
			request.setAttribute("message", "Bạn đã đăng ký thành công!");
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/WEB-INF/Pages/SupPage/DangKyMonHoc.jsp");
			rd.forward(request, response);
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
