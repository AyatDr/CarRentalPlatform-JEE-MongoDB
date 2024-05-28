package com.octest.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.MongoException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.octest.clas.MongoDBConnection;

/**
 * Servlet implementation class DeleteReservationServlet
 */
public class DeleteReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String reservationId = request.getParameter("reservationId");
		 MongoDBConnection connection = new MongoDBConnection();
		    MongoDatabase database = connection.getDatabase();
		    MongoCollection<Document> reservationCollection = database.getCollection("Reservation");
		    ObjectId objectId = new ObjectId(reservationId);
		    Document query = new Document("_id", objectId);
		
		 // Mettre à jour le statut de la réservation
		    Document update = new Document("$set", new Document("status", "Refusée"));
		    reservationCollection.updateOne(query, update);
          System.out.println("La réservation a été modifier avec succès.");
  		//response.sendRedirect("/WEB-INF/Reservations.jsp");
 		 request.getRequestDispatcher("Reservations").forward(request, response);


        }
	}


