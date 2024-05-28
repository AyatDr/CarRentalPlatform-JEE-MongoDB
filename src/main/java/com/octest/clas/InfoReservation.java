package com.octest.clas;

import org.bson.Document;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoDatabase;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.bson.Document;
import com.mongodb.client.AggregateIterable;
import com.mongodb.client.FindIterable;

import java.io.IOException;
import java.util.*;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoCursor;

public class InfoReservation {
	private MongoDBConnection mongoDBConnection;

	public Map ResMois() {
     	mongoDBConnection = new MongoDBConnection();

		MongoDatabase database = mongoDBConnection.getDatabase();
        MongoCollection<Document> collection = database.getCollection("Resevation");
        AggregateIterable<Document> result = database.getCollection("Reservation").aggregate(Arrays.asList(
                new Document("$match", new Document("status", "Confirmée")),
                new Document("$group", new Document("_id", new Document("$month", "$DateDebut"))
                        .append("count", new Document("$sum", 1))),
                new Document("$project", new Document("_id", 0)
                        .append("month", "$_id")
                        .append("count", 1)),
                new Document("$sort", new Document("month", 1))
        ));
        
        
        
    
        Map<Integer, Integer> monthCounts = new HashMap<>();
        for (Document doc : result) {
            int month = doc.getInteger("month");
            int count = doc.getInteger("count");
            monthCounts.put(month, count);
        }

        // Ajouter les mois manquants avec un nombre de réservations de 0
        for (int month = 1; month <= 12; month++) {
            monthCounts.putIfAbsent(month, 0);
        }

       

		return monthCounts;
		
	}
	public void afficher(HttpServletRequest request, HttpServletResponse response) {
		 
	}
	
	public long nombreReservation() {
		 MongoDatabase database = mongoDBConnection.getDatabase();
       MongoCollection<Document> collection = database.getCollection("Reservation");
       long count = collection.countDocuments();


		return count;
		
	}

}
