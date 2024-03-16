package ral.model;

public class RegisterBean {

	String Email;
	String User_name;
	String password;
	String first_name;
	String last_name;
	String phone_number;
	String address;
	String gender;
	String dob;
	String country;

	public RegisterBean(String eMail, String user_name, String password, String first_name, String last_name,
			String phone_number, String address, String gender, String dob, String country) {

		super();
		Email = eMail;
		User_name = user_name;
		this.password = password;
		this.first_name = first_name;
		this.last_name = last_name;
		this.phone_number = phone_number;
		this.address = address;
		this.gender = gender;
		this.dob = dob;
		this.country = country;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getUser_name() {
		return User_name;
	}

	public void setUser_name(String user_name) {
		User_name = user_name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirst_name() {
		return first_name;
	}

	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}

	public String getLast_name() {
		return last_name;
	}

	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}

	public String getPhone_number() {
		return phone_number;
	}

	public void setPhone_number(String phone_number) {
		this.phone_number = phone_number;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

}
