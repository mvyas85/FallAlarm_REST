package com.capstone.data;

public class Staff {

	private String sid,name,phone,email,password;

	public String getSid() {
		return sid;
	}

	public String getName() {
		return name;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getPassword() {
		return password;
	}

	public void setSid(String sid) {
		this.sid = sid;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "Staff [sid=" + sid + ", name=" + name + ", phone=" + phone
				+ ", email=" + email + ", password=" + password + "]";
	}
	
}
