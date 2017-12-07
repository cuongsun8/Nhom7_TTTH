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

import models.HocVien;

/**
 * Servlet implementation class DanhSachLopHoc
 */
@WebServlet("/admin/thong-ke-dang-ky/danh-sach-hoc-vien")
public class DanhSachHocVien extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String sql_DSHV = "SELECT online_registered.Id, TenHV, Email, SDT, NgayDangKy, NgayKhaiGiang FROM online_registered, classes where  MaLichHoc = LichHoc and MaLichHoc = ";
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs_DSHV;
	List<HocVien> classes = new ArrayList<HocVien>();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhSachHocVien() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("UTF-8");
		conn = dataAccess.DBConnector.getConnection();
		try {
			stmt = conn.prepareStatement(sql_DSHV + request.getParameter("ID"));
			request.setAttribute("returnID", request.getParameter("ID"));
			rs_DSHV = stmt.executeQuery();
			classes.clear();
			while(rs_DSHV.next()) {			
				HocVien hv = new HocVien(rs_DSHV.getString(1),
						rs_DSHV.getString(2),
						rs_DSHV.getString(3),
						rs_DSHV.getString(4),
						rs_DSHV.getString(5),
						rs_DSHV.getString(6));
				classes.add(hv);
			}
			request.setAttribute("classes", classes);
			RequestDispatcher rd = getServletContext()
	                .getRequestDispatcher("/WEB-INF/Pages/Admin/DanhSachHocVien.jsp");
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
