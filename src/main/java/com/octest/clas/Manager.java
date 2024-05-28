package com.octest.clas;

public class Manager {
	
	private int N_manager;
	private String Nom;
	private String Prenom;
	private String CIN;
	private String Login;
	private String Password;
	private String Adress;
	public Manager(int n_manager, String nom, String prenom, String cIN, String login, String password, String adress) {
		N_manager = n_manager;
		Nom = nom;
		Prenom = prenom;
		CIN = cIN;
		Login = login;
		Password = password;
		Adress = adress;
	}
	public int getN_manager() {
		return N_manager;
	}
	public void setN_manager(int n_manager) {
		N_manager = n_manager;
	}
	public String getNom() {
		return Nom;
	}
	public void setNom(String nom) {
		Nom = nom;
	}
	public String getPrenom() {
		return Prenom;
	}
	public void setPrenom(String prenom) {
		Prenom = prenom;
	}
	public String getCIN() {
		return CIN;
	}
	public void setCIN(String cIN) {
		CIN = cIN;
	}
	public String getLogin() {
		return Login;
	}
	public void setLogin(String login) {
		Login = login;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getAdress() {
		return Adress;
	}
	public void setAdress(String adress) {
		Adress = adress;
	}

	

}
