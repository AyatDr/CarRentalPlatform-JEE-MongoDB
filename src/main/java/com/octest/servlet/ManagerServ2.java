package com.octest.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.octest.clas.Manager;
import com.octest.clas.ManagerCrud;


/**
 * Servlet implementation class ManagerCrud
 */
public class ManagerServ2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ManagerCrud managerCrud;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerServ2() {
    	super();
        try {
			this.managerCrud = new ManagerCrud();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String action = request.getServletPath();
		System.out.println(action);
		switch(action){
			
			
			case "/Manager2/insert":
				insertManager(request,response);
			break;
			case "/Manager2/delete":
				DeletManager(request,response);
				break;
			case "/Manager2/Update":
				updateManager(request,response);
				break;
			default :
				afficher(request,response);
			
		}
		
		
	
		
	}

	public void insertManager(HttpServletRequest request, HttpServletResponse response) {
		int nombreTotalClients = this.managerCrud.getNombreTotalManger();
		System.out.println("numero 1 : "+ nombreTotalClients);
		int num = nombreTotalClients + 1;
		System.out.println("numero 2 : "+ num);
		String Nom = request.getParameter("Nom");
		String Prenom = request.getParameter("Prenom");
		String CIN = request.getParameter("CIN");
		String Login = request.getParameter("Login");
		String Password = request.getParameter("Password");
		String adress = request.getParameter("adress");
		Manager manager = new Manager(num,Nom,Prenom,CIN,Login,Password,adress);
		this.managerCrud.insertManager(manager);
		System.out.println("hnna");
		String destination = "/DriveAway/Manager2"; // Chemin de la page de destination

	    // Effectuer la redirection
		
	try {
		response.sendRedirect(destination);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	
	public void afficher(HttpServletRequest request, HttpServletResponse response) {
		List<Document> listManager = this.managerCrud.afficher();
		request.setAttribute("listManager", listManager);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ManagerList2.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	public void updateManager(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("N_manager"));
		String Nom = request.getParameter("Nom");
		String Prenom = request.getParameter("Prenom");
		String CIN = request.getParameter("CIN");
		String Login = request.getParameter("Login");
		String Password = request.getParameter("Password");
		String adress = request.getParameter("adress");
		Manager Newmanager = new Manager(num,Nom,Prenom,CIN,Login,Password,adress);
		this.managerCrud.UpdateManager(Newmanager);
		
		String destination = "/DriveAway/Manager2"; // Chemin de la page de destination

	    // Effectuer la redirection
	try {
		response.sendRedirect(destination);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	}
	public void DeletManager(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		managerCrud.DeletManager(id);
		String destination = "/DriveAway/Manager2"; // Chemin de la page de destination

	    // Effectuer la redirection
	try {
		response.sendRedirect(destination);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
