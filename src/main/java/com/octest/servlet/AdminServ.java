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

import com.octest.clas.Admin;
import com.octest.clas.AdminCrud;
import com.octest.clas.Admin;
import com.octest.clas.AdminCrud;

/**
 * Servlet implementation class AdminServ
 */
public class AdminServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private AdminCrud adminCrud;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServ() {
        super();
        try {
			this.adminCrud = new AdminCrud();
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
			
			
			case "/Admin/insert":
				insertAdmin(request,response);
			break;
			case "/Admin/delete":
				DeletAdmin(request,response);
				break;
			case "/Admin/Update":
				updateAdmin(request,response);
				break;
			default :
				afficher(request,response);
			
		}
		
	}
	
	
	public void insertAdmin(HttpServletRequest request, HttpServletResponse response) {
		int nombreTotalClients = this.adminCrud.getNombreTotalAdmin();
		int num = nombreTotalClients + 1;
		
		String Login = request.getParameter("Login");
		String Password = request.getParameter("Password");
		
		Admin admin = new Admin(num,Login,Password);
		this.adminCrud.insertAdmin(admin);
		String destination = "/DriveAway/Admin"; // Chemin de la page de destination

		try {
			response.sendRedirect(destination);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void afficher(HttpServletRequest request, HttpServletResponse response) {
		List<Document> listAdmin = this.adminCrud.afficher();
		request.setAttribute("listAdmin", listAdmin);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/AdminList.jsp");
		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
	
	public void updateAdmin(HttpServletRequest request, HttpServletResponse response) {
		int num = Integer.parseInt(request.getParameter("N_admin"));
		
		String Login = request.getParameter("Login");
		String Password = request.getParameter("Password");
		
		Admin Newadmin = new Admin(num,Login,Password);
		this.adminCrud.UpdateAdmin(Newadmin);
		String destination = "/DriveAway/Admin"; // Chemin de la page de destination

		try {
			response.sendRedirect(destination);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public void DeletAdmin(HttpServletRequest request, HttpServletResponse response) {
		int id = Integer.parseInt(request.getParameter("id"));
		adminCrud.DeletAdmin(id);
		String destination = "/DriveAway/Admin"; // Chemin de la page de destination

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
