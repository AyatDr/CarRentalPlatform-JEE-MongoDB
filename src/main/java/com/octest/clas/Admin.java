package com.octest.clas;

public class Admin {
	private int N_admin;
	
	private String Login;
	private String Password;
	
	public Admin(int n_admin, String login, String password) {
		N_admin = n_admin;
		Login = login;
		Password = password;
	}
	
	public int getN_admin() {
		return N_admin;
	}
	public void setN_admin(int n_admin) {
		N_admin = n_admin;
	}
	
	public String getLogin() {
		return Login;
	}
	public void setNom(String login) {
		Login = login;
	}
	
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
	

}
