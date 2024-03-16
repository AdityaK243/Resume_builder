package ral.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import ral.DB.DBconnection;

public class ForgetDAO {
	public static boolean forgetpassword(String email, String pass) {
		String sql = "select  Email from user_registration where Email=?;";
		ResultSet rs = null;
		Connection con = DBconnection.getConn();

		try {

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			rs = ps.executeQuery();
			if (!(rs.next()))
				return false;
			else {

				sql = "update user_registration set Password=? where Email=?;";
				ps = con.prepareStatement(sql);
				ps.setString(1, pass);
				ps.setString(2, email);
				ps.executeUpdate();
				return true;
			}
		} catch (SQLException e) {
			System.out.println(e);

		}
		return false;

	}

}
