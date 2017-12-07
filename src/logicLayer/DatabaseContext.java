package logicLayer;

import dataAccess.DataProvider;

public class DatabaseContext {
	
	private static DatabaseContext instance = new DatabaseContext();
	
	private final DataProvider dataProvider = new DataProvider("jdbc:mysql://localhost/trungtamtinhoc?autoReconnect=true&useSSL=false", "root", "1234");
	
	private final FeedbackDAO feedback = new FeedbackDAO(dataProvider);
	
	private DatabaseContext() {}
	
	public static DatabaseContext getInstance() {
		return instance;
	}
	
	public FeedbackDAO getFeedback() {
		return feedback;
	}
}
