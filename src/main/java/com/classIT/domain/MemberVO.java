package com.classIT.domain;

public class MemberVO {
	private String user_name;
	private String user_id;
	private String user_pw;
	private String user_birth;
	private String user_number;
	private String user_addr;
	private String user_role = "È¸¿ø";
	

	public String getUsername() {
		return user_name;
	}

	public void setUsername(String user_name) {
		this.user_name = user_name;
	}

	public String getUserid() {
		return user_id;
	}

	public void setUserid(String user_id) {
		this.user_id = user_id;
	}

	public String getPwd() {
		return user_pw;
	}

	public void setPwd(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getbirth() {
		return user_birth;
	}

	public void setbirth(String user_birth) {
		this.user_birth = user_birth;
	}

	public String getnumber() {
		return user_number;
	}

	public void setnumber(String user_number) {
		this.user_number = user_number;
	}
	
	public String getaddr() {
		return user_addr;
	}

	public void setaddr(String user_addr) {
		this.user_addr = user_addr;
	}
	
	public String getrole() {
		return user_role;
	}

	public void setrole(String user_role) {
		this.user_role = user_role;
	}

	@Override
	public String toString() {
		return "MemberVO [user_name=" + user_name + ", user_id=" + user_id + ", user_pw=" + user_pw + ", user_birth=" + user_birth
				+ ", user_number=" + user_number + ", user_addr=" + user_addr + ", user_role=" + user_role + "]";
	}
}
