package com.octest.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.octest.clas.ManagerCrud;
import com.octest.clas.VoitureCrud;
import com.octest.clas.ClientCrud;
import com.octest.clas.InfoReservation;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



/**
 * Servlet implementation class FormServ
 */
public class Dashboard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dashboard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			ClientCrud client = new ClientCrud();
			ManagerCrud manager = new ManagerCrud();
			VoitureCrud voiture = new VoitureCrud();
			InfoReservation info = new InfoReservation();
			
			Map monthCounts =info.ResMois();
			List<Integer> months = new ArrayList<>(monthCounts.keySet());
		    List<Integer> counts = new ArrayList<>(monthCounts.values());
			request.setAttribute("months", months);
	        request.setAttribute("counts", counts);
			request.setAttribute("nbrClient", client.nombreClient());
			request.setAttribute("nbrVoiture", voiture.nombreVoiture());
			request.setAttribute("nbrManager", manager.nombreManager());
			request.setAttribute("nbrReservation", info.nombreReservation());

		    RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/DashboradAdmin.jsp");
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
