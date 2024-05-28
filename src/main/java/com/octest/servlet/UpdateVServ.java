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
import com.octest.clas.VoitureCrud;

/**
 * Servlet implementation class UpdateServ
 */
public class UpdateVServ extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private VoitureCrud voitureCrud;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateVServ() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String num = request.getParameter("id");
		voitureCrud  = new VoitureCrud();
		Document m = voitureCrud.getVoiture(num);
		request.setAttribute("Voiture", m);
		
		 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/UpdateVoiturejsp.jsp");
		    dispatcher.forward(request, response);	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

