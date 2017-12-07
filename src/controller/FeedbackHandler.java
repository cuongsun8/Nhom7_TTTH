package controller;

import dataAccess.DataProvider;
import dataAccess.DataRow;
import dataAccess.DataTable;
import models.Feedback;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Vector;

@SuppressWarnings("serial")
@WebServlet("/feedback")
public class FeedbackHandler extends HttpServlet {

    DataProvider dataProvider = new DataProvider("jdbc:mysql://localhost/trungtamtinhoc?autoReconnect=true&useSSL=false", "root", "123456789");

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        if (isEmpty(name) || isEmpty(email) || isEmpty(message)) {
            return;
        }
        addFeedback(name, email, message);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("delete");
        if (isEmpty(id)) {
            List<Feedback> feedbacks = getFeedbacks();
            request.setAttribute("feedbacks", feedbacks);
            request.getRequestDispatcher("/WEB-INF/Pages/Admin/Feedback.jsp").forward(request, response);
            return;
        }
        removeFeedback(id);
        response.sendRedirect("feedback");
    }

    private boolean isEmpty(String str) {
        if (str == null) {
        	return true;
        }
        if (str.isEmpty()) {
        	return true;
        }
        return false;
    }

    private boolean addFeedback(String name, String email, String message) {
        return dataProvider.executeUpdate("INSERT INTO messages(name, email, message) VALUES(?, ?, ?)", name, email, message) != 0;
    }

    private boolean removeFeedback(String id) {
        return dataProvider.executeUpdate("DELETE FROM messages WHERE id = ?", id) != 0;
    }

    private List<Feedback> getFeedbacks() {
        DataTable table = dataProvider.executeQuery("SELECT * FROM messages");
        List<Feedback> feedbacks = new Vector<>();
        for (DataRow row : table) {
            feedbacks.add(new Feedback(
                    row.column("id", Integer.class),
                    row.column("name", String.class),
                    row.column("email", String.class),
                    row.column("message", String.class)
            ));
        }
        return feedbacks;
    }
}
