package ral.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import ral.DB.DBconnection;
import ral.model.RegisterBean;

public class RegisterDAO {
	public String Registerindb(RegisterBean bean) {
		Connection con = DBconnection.getConn();
		LocalDateTime dateTime = LocalDateTime.now();
		DateTimeFormatter dtF = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
		String formateDT = dateTime.format(dtF);
		String sql = "insert into user_registration(Email,Password,First_Name,Last_Name,Phone_Number,Address,Gender,DOB,Country,User_name,Date,Time) values(?,?,?,?,?,?,?,?,?,?,?,?);";
		int i = 0;
		try {
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, bean.getEmail());
			preparedStatement.setString(2, bean.getPassword());
			preparedStatement.setString(3, bean.getFirst_name());
			preparedStatement.setString(4, bean.getLast_name());

			preparedStatement.setString(5, bean.getPhone_number());
			preparedStatement.setString(6, bean.getAddress());
			preparedStatement.setString(7, bean.getGender());
			preparedStatement.setString(8, bean.getDob());
			preparedStatement.setString(9, bean.getCountry());
			preparedStatement.setString(10, bean.getUser_name());
			preparedStatement.setString(11, formateDT.substring(0, 10));
			preparedStatement.setString(12, formateDT.substring(11));
			i = preparedStatement.executeUpdate();

		} catch (Exception e) {
			System.out.println(e);
		}
		if (i != 0) {
			return "User is registered";
		} else {
			return " ERROR......!";
		}

	}

}
