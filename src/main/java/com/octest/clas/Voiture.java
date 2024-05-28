package com.octest.clas;

public class Voiture {
	
	
	private String Matricule;
	private String Marque;
	private String imageUrl;
	private int Kilométrage;
	private int Année;
	private int Prix;
	private String Couleur;
	public Voiture(String matricule, String marque , int kilométrage, int année,String couleur,int prix , String imgUrl) {
		Matricule= matricule;
		Marque= marque;
		imageUrl=imgUrl; 
		Kilométrage= kilométrage;
		Année = année;
		Couleur = couleur;
		Prix =prix;
	}
	
	public Voiture( String marque , int kilométrage, int année,String couleur,int prix , String imgUrl) {
		
		Marque= marque;
		imageUrl=imgUrl; 
		Kilométrage= kilométrage;
		Année = année;
		Couleur = couleur;
		Prix =prix;
	}
	public String getMatricule() {
		return Matricule;
	}
	public void setMatricule(String matricule) {
		Matricule = matricule;
	}
	public int getPrix() {
		return Prix;
	}

	public void setPrix(int prix) {
		Prix = prix;
	}

	public String getMarque() {
		return Marque;
	}
	public void setMarque(String marque) {
		Marque = marque;
	}
	
	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public int getKilométrage() {
		return Kilométrage;
	}
	public void setKilométrage(int kilométrage) {
		Kilométrage = kilométrage;
	}
	public int getAnnée() {
		return Année;
	}
	public void setAnnée(int année) {
		Année = année;
	}
	public String getCouleur() {
		return Couleur;
	}
	public void setCouleur(String couleur) {
		Couleur = couleur;
	}
	

	






}
