package ral.dao;


	


	import java.sql.Connection;
	import java.sql.PreparedStatement;
	import java.sql.SQLException;


	import ral.DB.DBconnection;

import ral.model.ResumeBean;

	public class ResumeDAO {
		public static String user;
	  

		public boolean Resumeindb(ResumeBean bean) {
			Connection con = DBconnection.getConn();
			String sql = "insert into resume(user_name,first_name,last_name,email,phone_number,website,linked_in,"
					+ "college,college_joining_date,college_completion_date,college_qualification,college_description,"
					+ "school,school_joining_date,school_completion_date,school_qualification,school_description,"
					+ "project_title,project_link,project_description,"
					+ "organisation,position,duration,experiance_description,"
					+ "organisation1,position1,duration1,experiance_description1,"
					+ "Skill1,Skill2,Skill3,Skill4,Skill5,Skill6,"
					+ "Interest1,Interest2,Interest3,Interest4) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
			int i = 0;
		
			try {
				System.out.println(user);
				PreparedStatement preparedStatement = con.prepareStatement(sql);
				preparedStatement.setString(1,user);
				preparedStatement.setString(2, bean.getFirst_name());
				preparedStatement.setString(3, bean.getLast_name());
				preparedStatement.setString(4, bean.getEmail());

				preparedStatement.setString(5, bean.getPhone_number());
				preparedStatement.setString(6, bean.getWebsite());
				preparedStatement.setString(7, bean.getLinked_in());
				preparedStatement.setString(8, bean.getcollege());
				preparedStatement.setString(9, bean.getCollege_joining_date());
				preparedStatement.setString(10, bean.getCollege_completion_date());
				preparedStatement.setString(11,bean.getCollege_qualification());
				preparedStatement.setString(12, bean.getCollege_description() );
				preparedStatement.setString(13, bean.getSchool());
				preparedStatement.setString(14, bean.getSchool_joining_date());
				preparedStatement.setString(15, bean.getSchool_completion_date());
				preparedStatement.setString(16, bean.getSchool_qualification());
				preparedStatement.setString(17, bean.getSchool_description());
				preparedStatement.setString(18, bean.getProject_title());
				preparedStatement.setString(19, bean.getProject_link());
				preparedStatement.setString(20, bean.getProject_description());
				preparedStatement.setString(21, bean.getOrganisation());
				preparedStatement.setString(22, bean.getPosition());
				preparedStatement.setString(23, bean.getDuration());
				preparedStatement.setString(24, bean.getExperiance_description());
				preparedStatement.setString(25, bean.getOrganisation1());
				preparedStatement.setString(26, bean.getPosition1());
				preparedStatement.setString(27, bean.getDuration1());
				preparedStatement.setString(28, bean.getExperiance_description1());
				preparedStatement.setString(29, bean.getSkill1());
				preparedStatement.setString(30, bean.getSkill2());
				preparedStatement.setString(31, bean.getSkill3());
				preparedStatement.setString(32, bean.getSkill4());
				preparedStatement.setString(33, bean.getSkill5());
				preparedStatement.setString(34, bean.getSkill6());
				preparedStatement.setString(35, bean.getInterest1());
				preparedStatement.setString(36, bean.getInterest2());
				preparedStatement.setString(37, bean.getInterest3());
				preparedStatement.setString(38, bean.getInterest4());
				
				i = preparedStatement.executeUpdate();

			} catch (Exception e) {
				System.out.println(e);
			}
			if (i != 0) {
				return true;
			} else {
				return false;
			}

		}

	}

	


