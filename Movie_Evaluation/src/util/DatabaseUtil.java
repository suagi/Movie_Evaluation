package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseUtil {
	
	public static Connection getConnection() {
		try {
			String url = "jdbc:mysql://localhost:3306/Evaluation";
			String ID = "root";
			String Password = "mysql";
			Class.forName("com.mysql.jdbc.Driver");
			return DriverManager.getConnection(url, ID, Password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}