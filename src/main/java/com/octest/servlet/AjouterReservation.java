package com.octest.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.octest.clas.MongoDBConnection;

/**
 * Servlet implementation class AjouterReservation
 */
public class AjouterReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjouterReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
      
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userStartDate = request.getParameter("date_debut");
        String userEndDate = request.getParameter("date_fin");

        System.out.println("Date de début entrée par l'utilisateur : " + userStartDate);
        System.out.println("Date de fin entrée par l'utilisateur : " + userEndDate);

        MongoDBConnection connection = new MongoDBConnection();
        MongoDatabase database = connection.getDatabase();
        MongoCollection<Document> voitureCollection = database.getCollection("Voiture");
        MongoCollection<Document> reservationCollection = database.getCollection("Reservation");

        List<ObjectId> reservedVoitureIds = new ArrayList<>();

        // Récupération des réservations et conversion des dates
        List<Document> reservations = reservationCollection.find().into(new ArrayList<>());
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        
        for (Document reservation : reservations) {
            Date reservationStartDate = reservation.getDate("DateDebut");
            Date reservationEndDate = reservation.getDate("DateFin");

            LocalDate startDate = reservationStartDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate endDate = reservationEndDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
            LocalDate userStart = LocalDate.parse(userStartDate);
            LocalDate userEnd = LocalDate.parse(userEndDate);

            
        
            if (
            		(userStart.isBefore(endDate)&& userEnd.isAfter(endDate)) ||
            		(userStart.equals(endDate) && userEnd.isAfter(endDate)) ||
            		(userStart.equals(endDate) && userEnd.equals(endDate))||
            		
            		(userStart.isBefore(startDate) && userEnd.isAfter(startDate)) ||
            		(userStart.equals(startDate) && userEnd.isAfter(startDate)) ||
            		(userStart.equals(startDate) && userEnd.equals(startDate)) ||
            		
            		(userStart.isAfter(startDate) && userStart.isBefore(endDate) && userEnd.isAfter(endDate)) ||
            		(userStart.isBefore(startDate) && userEnd.isAfter(startDate) && userEnd.isBefore(endDate)) ||
            		
            		(userStart.isAfter(startDate) && userEnd.isBefore(endDate)) ||
                    (userStart.isBefore(startDate) && userEnd.isAfter(endDate)) ||
                    (userStart.equals(startDate) && userEnd.equals(endDate)) ||
                    (userStart.isAfter(startDate) && userEnd.equals(endDate)) ||
                    (userStart.isBefore(startDate) && userEnd.equals(startDate))
                    )
            
            	
            {
            	
                reservedVoitureIds.add(reservation.getObjectId("voitureId"));
            }
        }

        System.out.println("Identifiants des voitures réservées : " + reservedVoitureIds);

        // Requête pour récupérer les voitures non réservées
        Document query = new Document("_id", new Document("$nin", reservedVoitureIds));
        FindIterable<Document> availableCars = voitureCollection.find(query);

        List<Document> availableCarsList = new ArrayList<>();
        try (MongoCursor<Document> iterator = availableCars.iterator()) {
            while (iterator.hasNext()) {
                Document car = iterator.next();
                availableCarsList.add(car);
            }
        }

        System.out.println("Identifiants des voitures non réservées : ");
        for (Document car : availableCarsList) {
            System.out.println(car.getObjectId("_id"));
        }

        request.setAttribute("availableCarsList", availableCarsList);
        request.setAttribute("dateDebut", userStartDate);
        request.setAttribute("dateFin", userEndDate);
        
        request.getRequestDispatcher("/WEB-INF/AfficherDispo.jsp").forward(request, response);
    }



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
