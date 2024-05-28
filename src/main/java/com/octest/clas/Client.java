package com.octest.clas;

public class Client {
	private int N_client;
	private String Nom;
	private String Prenom;
	private String CIN;
	private String Email;
	
	private String Adress;
	
	public Client(int n_client, String nom, String prenom, String cIN, String email, String adress) {
		N_client = n_client;
		Nom = nom;
		Prenom = prenom;
		CIN = cIN;
		Email = email;
		Adress = adress;
	}
	
	public int getN_client() {
		return N_client;
	}
	public void setN_client(int n_client) {
		N_client = n_client;
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
	
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	
	public String getAdress() {
		return Adress;
	}
	public void setAdress(String adress) {
		Adress = adress;
	}

}

