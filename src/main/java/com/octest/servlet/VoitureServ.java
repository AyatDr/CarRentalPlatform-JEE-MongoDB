package com.octest.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.net.UnknownHostException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.octest.clas.Voiture;
import com.octest.clas.ManagerCrud;
import com.octest.clas.VoitureCrud;




@MultipartConfig(
	    fileSizeThreshold   = 1024 * 1024 * 10,  // 10 MB
	    maxFileSize         = 1024 * 1024 * 50,  // 50 MB
	    maxRequestSize      = 1024 * 1024 * 100  // 100 MB
	)

public class VoitureServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private VoitureCrud voitureCrud;
   
    
    public VoitureServ() {
    	super();
        try {
			this.voitureCrud = new VoitureCrud();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getServletPath();
		System.out.println(action);
		switch(action){
			
			
			case "/Voiture/insert":
				insertVoiture(request,response);
			break;
			case "/Voiture/delete":
				  DeletVoiture(request,response);
				break;
			case "/Voiture/Update":
				updateVoiture(request,response);
				break;
			default :
				afficher(request,response);
			
		}
	
	}
	
	

	public void insertVoiture(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String Matricule = request.getParameter("Matricule");
		String Marque = request.getParameter("Marque");
		int Kilometrage = Integer.parseInt(request.getParameter("Kilométrage"));
		int Annee = Integer.parseInt(request.getParameter("Annee"));
		String Couleur = request.getParameter("Couleur");
		int prix = Integer.parseInt(request.getParameter("Prix"));
		
		Part filePart = request.getPart("Photo");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

		String uploadDirectory = "C:/Users/mahfo/OneDrive/Desktop/Voiture/src/main/webapp/images/cars";
		
		Path uploadPath = Paths.get(uploadDirectory, fileName);
		try (InputStream inputStream = filePart.getInputStream()) {
		    Files.copy(inputStream, uploadPath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		String relativePath = uploadPath.subpath(uploadPath.getNameCount() - 3, uploadPath.getNameCount()).toString();
		
		relativePath = relativePath.replaceAll("\\\\", "/");


		Voiture voiture = new Voiture(Matricule,Marque,Kilometrage,Annee,Couleur,prix,relativePath);
		this.voitureCrud.insertVoiture(voiture);
		
		
		response.sendRedirect(request.getContextPath() + "/VoitureServ");
	}
	
	public void afficher(HttpServletRequest request, HttpServletResponse response) {
		List<Document> listVoiture = this.voitureCrud.afficher();
		request.setAttribute("listVoiture", listVoiture);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/VoitureList.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	public void updateVoiture(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String Matricule = request.getParameter("Matricule");
		String Marque = request.getParameter("Marque");
		int Kilometrage = Integer.parseInt(request.getParameter("Kilometrage"));
		int Annee = Integer.parseInt(request.getParameter("Annee"));
		String Couleur = request.getParameter("Couleur");
		
		int prix = Integer.parseInt(request.getParameter("prix"));
        
		Part filePart = request.getPart("Photo");
		String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

		String uploadDirectory = "C:/Users/mahfo/OneDrive/Desktop/Voiture/src/main/webapp/images/cars";
		
		Path uploadPath = Paths.get(uploadDirectory, fileName);
		try (InputStream inputStream = filePart.getInputStream()) {
		    Files.copy(inputStream, uploadPath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
		    e.printStackTrace();
		}
		
		String relativePath = uploadPath.subpath(uploadPath.getNameCount() - 3, uploadPath.getNameCount()).toString();
		
		relativePath = relativePath.replaceAll("\\\\", "/");
		
		Voiture voiture = new Voiture(Matricule,Marque,Kilometrage,Annee,Couleur,prix,relativePath);
		this.voitureCrud.UpdateVoiture(voiture);
		
		// Redirection vers une autre page
	    response.sendRedirect(request.getContextPath() + "/VoitureServ");
	}
	
	
	
	public void DeletVoiture(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id =request.getParameter("id");
		voitureCrud.DeletVoiture(id);
		response.sendRedirect(request.getContextPath() + "/VoitureServ");
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
