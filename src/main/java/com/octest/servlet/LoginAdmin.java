package com.octest.servlet;
import com.octest.clas.LogineAdmin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.UnknownHostException;


/**
 * Servlet implementation class LoginAdmin
 */
public class LoginAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/WEB-INF/LoginAdmine.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 String username = request.getParameter("email");
		    String password = request.getParameter("password");

		    try {
		    	LogineAdmin login = new LogineAdmin();
		    	
		        if (login.authenticateAdmin(username, password)) {
		            request.getRequestDispatcher("Dashboard").forward(request, response);
		        } else {
		            // Afficher un message d'erreur sur la page de connexion
		            request.setAttribute("errorMessage", "Identifiants incorrects");
		            request.getRequestDispatcher("/WEB-INF/LoginAdmine.jsp").forward(request, response);
		        }
		    } catch (UnknownHostException e) {
		        // Gérer l'exception de connexion à la base de données
		        e.printStackTrace();
		        // Afficher un message d'erreur sur la page de connexion
		        request.setAttribute("errorMessage", "Erreur de connexion à la base de données");
		        request.getRequestDispatcher("/WEB-INF/LoginAdmine.jsp").forward(request, response);
		    }
	}

}

