package com.octest.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.bson.Document;

import com.octest.clas.ClientCrud;

/**
 * Servlet implementation class UpdateClServ
 */
public class UpdateClServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private ClientCrud clientCrud;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateClServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("id"));
		clientCrud  = new ClientCrud();
		Document m = clientCrud.getClient(num);
		request.setAttribute("Client", m);
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/UpdateClientjsp.jsp");
		    dispatcher.forward(request, response);	
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
