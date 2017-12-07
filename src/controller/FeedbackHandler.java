package controller;

import dataAccess.DataProvider;
import dataAccess.DataRow;
import dataAccess.DataTable;
import logicLayer.DatabaseContext;
import logicLayer.FeedbackDAO;
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

    private FeedbackDAO feedback = DatabaseContext.getInstance().getFeedback();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        if (isEmpty(name) || isEmpty(email) || isEmpty(message)) {
            return;
        }
        feedback.insert(name, email, message);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("delete");
        if (isEmpty(id)) {
            showFeedbacks(request, response);
            return;
        }
        deleteFeedback(id, request, response);
    }
    
    private void showFeedbacks(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	List<Feedback> feedbacks = feedback.getAll();
        request.setAttribute("feedbacks", feedbacks);
        request.getRequestDispatcher("/WEB-INF/Pages/Admin/Feedback.jsp").forward(request, response);
    }
    
    private void deleteFeedback(String id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	feedback.delete(Integer.parseInt(id));
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
    
    

}
