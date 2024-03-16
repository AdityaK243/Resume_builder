package ral.DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	public static Connection getConn() {
		Connection con=null;
		//String loadDriver="com.mysql.cj.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/empcred";
		String username="root";
		String password = "12345";
		
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection(url, username, password);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println(e);
			}
			
		
		
		return con;
		

	}

}
