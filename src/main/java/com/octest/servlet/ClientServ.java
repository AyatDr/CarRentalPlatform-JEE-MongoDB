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

import com.octest.clas.Client;
import com.octest.clas.ClientCrud;


/**
 * Servlet implementation class ClientServ
 */
public class ClientServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClientCrud clientCrud;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientServ() {
        super();
        try {
			this.clientCrud = new ClientCrud();
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
			
			
			case "/Client/insert":
				insertClient(request,response);
			break;
			case "/Client/delete":
				DeletClient(request,response);
				break;
			case "/Client/Update":
				updateClient(request,response);
				break;
			default :
				afficher(request,response);
			
		}
		
		
	
		
	}
    
    public void insertClient(HttpServletRequest request, HttpServletResponse response) {
    	int nombreTotalClients = this.clientCrud.getNombreTotalClients();
    	 // Incrémenter de 1 pour obtenir le nouvel identifiant
        int num = nombreTotalClients + 1;
        
		String Nom = request.getParameter("Nom");
		String Prenom = request.getParameter("Prenom");
		String CIN = request.getParameter("CIN");
		String Email = request.getParameter("Email");
		String Adress = request.getParameter("Adress");
		Client client = new Client(num,Nom,Prenom,CIN,Email,Adress);
		this.clientCrud.insertClient(client);
		afficher(request , response);
	}

    
    public void afficher(HttpServletRequest request, HttpServletResponse response) {
    	System.out.println("afficher Clients");
		List<Document> listClient = this.clientCrud.afficher();
		request.setAttribute("listClient", listClient);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/ClientList.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
    
    public void updateClient(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("N_client"));
		String Nom = request.getParameter("Nom");
		String Prenom = request.getParameter("Prenom");
		String CIN = request.getParameter("CIN");
		String Email = request.getParameter("Email");
		String Adress = request.getParameter("Adress");
		Client Newclient = new Client(num,Nom,Prenom,CIN,Email,Adress);
		this.clientCrud.UpdateClient(Newclient);
		afficher(request,response);
	}
    
    
	public void DeletClient(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		clientCrud.DeletClient(id);
		afficher(request,response);
		
	}
    
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

