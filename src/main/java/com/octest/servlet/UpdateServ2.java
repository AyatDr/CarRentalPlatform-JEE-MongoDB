package com.octest.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.bson.Document;

import com.octest.clas.ManagerCrud;

/**
 * Servlet implementation class UpdateServ
 */
public class UpdateServ2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ManagerCrud managerCrud;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateServ2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("id"));
		managerCrud  = new ManagerCrud();
		Document m = managerCrud.getManager(num);
		request.setAttribute("Manager", m);
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/UpdateManagerjsp2.jsp");
		    dispatcher.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

