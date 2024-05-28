package com.octest.servlet;
import jakarta.servlet.ServletException;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import com.octest.clas.Client;
import com.octest.clas.MongoDBConnection;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.MongoException;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.result.DeleteResult;
import com.mongodb.client.result.UpdateResult;
import  com.mongodb.client.model.Filters;
import com.mongodb.client.model.UpdateOptions;
import com.mongodb.client.model.Updates;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.MongoException;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class InsererReservation
 */
public class InsererReservation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsererReservation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		   MongoDBConnection connection = new MongoDBConnection();
	        MongoDatabase database = connection.getDatabase();
	        
		String dateStringDebut = request.getParameter("DateDebut");
		String dateStringFin = request.getParameter("DateFin");
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date dateDebut = null;
		Date dateFin = null;
		
		
		    try {
				dateDebut = (Date) dateFormat.parse(dateStringDebut);
				 dateFin = (Date) dateFormat.parse(dateStringFin);
				 
			} catch (ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
				 
			}
		   
		
		String Mode = request.getParameter("modePaiement");
		
		
		
		int Total = Integer.parseInt(request.getParameter("Total"));

        String id = request.getParameter("voitureId");
        int NumeroClient = Integer.parseInt(request.getParameter("client"));
    	ObjectId objectId = new ObjectId(id);

		 try  {
	   		
	            MongoCollection<Document> collection = database.getCollection("Reservation");
	            try {
	                  collection.insertOne(new Document()
		                    .append("_id", new ObjectId())
		                    .append("DateDebut",dateDebut )
	                        .append("DateFin", dateFin)
	                        .append("modePaiement", Mode)
	                        .append("Total", Total)
	                        .append("status", "En attente")
	                      
	                        .append("voitureId", objectId)
	                        .append("ClientId", NumeroClient));
	                System.out.println("Success! Inserted client document id: " );
	                request.getRequestDispatcher("Reservations").forward(request, response);
	            } catch (MongoException me) {
	                System.err.println("Unable to insert due to an error: " + me);
	            }
	        }
	        catch(MongoException e) {
	            System.err.println("Unable to insert due to an error: " + e);

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
