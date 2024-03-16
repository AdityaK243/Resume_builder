package ral.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ral.DB.DBconnection;
import ral.model.RegisterBean;
import register.web.LoginServlet;

public class LoginDAO {
	

	

	public static boolean validate(String un, String pass){
		boolean result=false;
		Connection con= DBconnection.getConn();
		String sql="select First_Name from user_registration where User_name=? and Password=? ";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1,un);
			ps.setString(2,pass);
		
			ResultSet rs=ps.executeQuery();
			result=rs.next();
			LoginServlet.setfN(rs.getString(1));
//			if(result) {
//				ps=con.prepareStatement("select * from resume;");
//				rs=ps.executeQuery();
//				if(rs.next()) return result;
//			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}

	private static void setfN(String string) {
		// TODO Auto-generated method stub
		
	}

}
