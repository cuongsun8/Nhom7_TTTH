package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.CallableStatement;

import models.ThemLop;

/**
 * Servlet implementation class ThemLich
 */
@WebServlet("/admin/them-lop")
public class ThemLich extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	private CallableStatement cst;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemLich() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public static List<ThemLop> tl;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 tl = new ArrayList<ThemLop>();

		String sql = "SELECT * FROM subjects;";	
		try {
			conn = dataAccess.DBConnector.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();

			while(rs.next()) {			
				ThemLop themlop = new ThemLop(rs.getInt(1),rs.getString(2));
				tl.add(themlop);

			}
			request.setAttribute("monhoc", tl);	
			request.getRequestDispatcher("/WEB-INF/Pages/Admin/ThemLop.jsp").forward(request, response);



		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String thoigian =  request.getParameter("thoigian");
		String ngayKG = request.getParameter("ngaykhaigiang");
		ngayKG = ngayKG.replaceAll("-", "/");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd");
		Date date = new Date();
		try {
			date = formatter.parse(ngayKG);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		String diadiem = request.getParameter("diadiem");
		int monhoc = Integer.valueOf(request.getParameter("mamonhoc"));
		try {
			conn = dataAccess.DBConnector.getConnection();
			cst = (CallableStatement) conn.prepareCall("{call sp_insert_Classes(?,?,?,?)}");
			cst.setString(1,  thoigian);
			cst.setString(2,  diadiem);
			cst.setInt(3,  monhoc);
			cst.setString(4, formatter.format(date));
			cst.executeUpdate();
			response.sendRedirect("/TrungTamTinHoc/admin/thong-ke-dang-ky");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
