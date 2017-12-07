package logicLayer;

import java.util.List;
import java.util.Vector;

import dataAccess.DataProvider;
import dataAccess.DataRow;
import dataAccess.DataTable;
import models.Feedback;

public class FeedbackDAO {
	
	private DataProvider dataProvider;
	
	protected FeedbackDAO(DataProvider dataProvider) {
		this.dataProvider = dataProvider;
	}
	
	public List<Feedback> getAll() {
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
	
	public boolean insert(String name, String email, String message) {
        return dataProvider.executeUpdate("INSERT INTO messages(name, email, message) VALUES(?, ?, ?)", name, email, message) != 0;
    }

    public boolean delete(int id) {
        return dataProvider.executeUpdate("DELETE FROM messages WHERE id = ?", id) != 0;
    }

    
}
