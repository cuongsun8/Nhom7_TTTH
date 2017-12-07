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

/**
 * Servlet implementation class TrangChu
 */
@WebServlet("/trang-chu")
public class TrangChu extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	ResultSet rs;
	List<models.CTDT> ctdt = new ArrayList<models.CTDT>();
	String[] colorArray = {"#706D3C","#E65527","#37A5B3","#363948","#716F84","#D5BC3A","#5EA07F","#1D6285","#86B3BB","#CA58D2"};
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TrangChu() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setAttribute("color", colorArray);
		conn = dataAccess.DBConnector.getConnection();
		String sql = "select * from educate_programs";
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			ctdt.clear();
			while(rs.next()) {
				models.CTDT d = new models.CTDT(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4));			
				ctdt.add(d);
			}
			request.setAttribute("ctdt", ctdt);
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/WEB-INF/Pages/NavBarPage/TrangChu.jsp");
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
