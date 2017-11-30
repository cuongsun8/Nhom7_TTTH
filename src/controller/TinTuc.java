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

/**
 * Servlet implementation class TinTuc
 */
@WebServlet("/tin-tuc/*")
public class TinTuc extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection conn;
	private PreparedStatement stmt;
	private ResultSet rs;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TinTuc() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pathInfo = request.getPathInfo();
		
		String[] pathParts = pathInfo.split("/");
		String url = pathParts[pathParts.length-1];
		String sql = "select * from news where url = '" + url + "'";	
		try {
			conn = dataAccess.DBConnector.getConnection();
			stmt = conn.prepareStatement(sql);
			rs = stmt.executeQuery();
			String content = "";
			models.TinTuc news = new models.TinTuc();
			while(rs.next()) {			
				content = rs.getString(6);
				content = content.replaceAll("'", "&quot");
				news = new models.TinTuc(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), content);
			}
			
			request.setAttribute("content", news.getContent());
			request.setAttribute("subject", news.getTieude());
			RequestDispatcher rd = getServletContext()
                    .getRequestDispatcher("/WEB-INF/Pages/NavBarPage/NoiDungTinTuc.jsp");
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
