package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.CallableStatement;

import models.ThongTinLopHoc;

/**
 * Servlet implementation class ThongKeDangKy
 */
@WebServlet("/admin/thong-ke-dang-ky")
public class ThongKeDangKy extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String sql_info = "SELECT classes.Id, schedules.ThoiGian, schedules.DiaDiem, classes.NgayKhaiGiang, TenMH, schedules.Id " +
    		"FROM trungtamtinhoc.classes, trungtamtinhoc.schedules , subjects " +
    		"where classes.LichHoc = schedules.Id and schedules.MaMH = subjects.MaMH and schedules.MaMH =";
    private String sql_MaMh = "Select MaMH from subjects";
    private List<ArrayList<ThongTinLopHoc>> classes = new ArrayList<ArrayList<ThongTinLopHoc>>();
    private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs_info;
	private ResultSet rs_MaMh;
	CallableStatement cst;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThongKeDangKy() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		conn = dataAccess.DBConnector.getConnection();
		try {
			
			stmt = conn.prepareStatement(sql_MaMh);
			rs_MaMh = stmt.executeQuery();
			classes.clear();
			while(rs_MaMh.next()) {
				List<ThongTinLopHoc> c = new ArrayList<ThongTinLopHoc>();
				
				stmt = conn.prepareStatement(sql_info + rs_MaMh.getInt(1));
				rs_info = stmt.executeQuery();
				while(rs_info.next()) {
					ThongTinLopHoc t = new ThongTinLopHoc(rs_info.getString(1), 
							rs_info.getString(2), 
							rs_info.getString(3), 
							rs_info.getString(4),
							rs_info.getString(5), 
							rs_info.getString(6));
					c.add(t);
				}
				classes.add((ArrayList<ThongTinLopHoc>) c);
			}
			request.setAttribute("classes", classes);
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/WEB-INF/Pages/Admin/ThongKeDangKy.jsp");
			rd.forward(request, response);
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
		doGet(request, response);
	}

}
