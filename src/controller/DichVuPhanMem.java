package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DichVuPhanMem
 */
@WebServlet("/dich-vu/phat-trien-phan-mem")
public class DichVuPhanMem extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
	String sql = "Select * From services";
	List<models.DichVuPhanMem> dv = new ArrayList<models.DichVuPhanMem>(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DichVuPhanMem() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException
    {
    	super.init(config);
    	conn = dataAccess.DBConnector.getConnection();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			dv.clear();
			while(rs.next()) {
				models.DichVuPhanMem d = new models.DichVuPhanMem(rs.getInt(1), rs.getString(2), rs.getString(3));			
				dv.add(d);
			}
			request.setAttribute("dichVuPhanMem", dv);
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/WEB-INF/Pages/DV/DV-phat-trien-phan-mem.jsp");
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
