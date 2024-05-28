package com.octest.servlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.net.UnknownHostException;

import javax.swing.text.Document;

import com.octest.clas.LoginService;

/**
 * Servlet implementation class Login
 */
public class LoginManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String username = request.getParameter("email");
	    String password = request.getParameter("password");

	    try {
	        LoginService log = new LoginService();
	        if (log.authenticate(username, password)) {
	            org.bson.Document Manager = log.GetManager(username);
	            
	            
	            request.setAttribute("Profile", Manager);
	            
	            // Récupérer la session depuis la requête
	            HttpSession session = request.getSession();

	            // Stocker les informations du manager dans la session
	            session.setAttribute("Profile", Manager);
	            request.getRequestDispatcher("Profile").forward(request, response);
	       
	        } else {
	            // Affichage d'un message d'erreur sur la page de connexion
	            request.setAttribute("errorMessage", "Identifiants incorrects");
	            request.getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);
	        }
	    
	    } catch (UnknownHostException e) {
	        // Gérer l'exception de connexion à la base de données
	        e.printStackTrace();
	        // Afficher un message d'erreur sur la page de connexion
	        request.setAttribute("errorMessage", "Erreur de connexion à la base de données");
	        request.getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);
	    }
	}


}