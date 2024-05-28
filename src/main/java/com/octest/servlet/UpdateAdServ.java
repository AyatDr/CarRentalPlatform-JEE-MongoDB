package com.octest.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.bson.Document;

import com.octest.clas.AdminCrud;

/**
 * Servlet implementation class UpdateAdServ
 */
public class UpdateAdServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 private AdminCrud adminCrud;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdServ() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int num = Integer.parseInt(request.getParameter("id"));
		adminCrud  = new AdminCrud();
		Document m = adminCrud.getAdmin(num);
		request.setAttribute("Admin", m);
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/UpdateAdminjsp.jsp");
		    dispatcher.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

