package com.octest.clas;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

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

import org.bson.Document;

import com.octest.clas.Voiture;
import com.octest.clas.VoitureCrud;


public class VoitureCrud {
	 private MongoDBConnection mongoDBConnection;
	public VoitureCrud() throws UnknownHostException {
		        mongoDBConnection = new MongoDBConnection();
		    }
	
	public void insertVoiture(Voiture voiture) {
		
	        try  {
	   		 MongoDatabase database = mongoDBConnection.getDatabase();
	            MongoCollection<Document> collection = database.getCollection("Voiture");
	            try {
	            	
	                  collection.insertOne(new Document()
		                    .append("_id", new ObjectId())
		                    .append("Matricule", voiture.getMatricule())
	                        .append("Marque", voiture.getMarque())
	                        
	                        .append("Prix",  voiture.getPrix())
	                        .append("Kilométrage", voiture.getKilométrage())
	                        .append("Année", voiture.getAnnée())
	                      
	                        .append("Couleur", voiture.getCouleur())
	                        .append("Image", voiture.getImageUrl()));
	                  
                      
	                      
	                       
	                      
	                System.out.println("Success! Inserted document id: " );
	            } catch (MongoException me) {
	                System.err.println("Unable to insert due to an error: " + me);
	            }
	        }
	        catch(MongoException e) {
                System.err.println("Unable to insert due to an error: " + e);

	        }
	
	        
	}
	
	public void DeletVoiture(String  num) {
		
	    
	   		 MongoDatabase database = mongoDBConnection.getDatabase();
	            MongoCollection<Document> collection = database.getCollection("Voiture");
	          
	            	Bson query = Filters.eq("Matricule", num);
	                try {
	                    DeleteResult result = collection.deleteOne(query);
	                    System.out.println("Deleted document count: " + result.getDeletedCount());
	                } catch (MongoException me) {
	                    System.err.println("Unable to delete due to an error: " + me);
	                }
	            
	        }
	
	
	public Document getVoiture(int num) {
	    MongoDatabase database = mongoDBConnection.getDatabase();
	    MongoCollection<Document> collection = database.getCollection("Voiture");

	    Bson query = Filters.eq("Matricule", num);
	    FindIterable<Document> documents = collection.find(query);

	    // Retrieve the first matching document, if any
	    Document voiture = documents.first();

	    return voiture;
	}

	
	
	public void UpdateVoiture(Voiture voiture) {

		   
   		 MongoDatabase database = mongoDBConnection.getDatabase();
            MongoCollection<Document> collection = database.getCollection("Voiture");
        	Bson query = Filters.eq("Matricule", voiture.getMatricule());
        	System.out.println(voiture.getMatricule());
           Bson updates = Updates.combine(
                  Updates.set("Marque", voiture.getMarque()),
               
                  Updates.set("Kilométrage", voiture.getKilométrage()),
                  Updates.set("Année", voiture.getAnnée()),
                  Updates.set("Prix", voiture.getPrix()),
                  Updates.set("Couleur", voiture.getCouleur()),
                  Updates.set("Image", voiture.getImageUrl()));
          
          UpdateOptions options = new UpdateOptions().upsert(false);
          try {
              UpdateResult result = collection.updateOne(query, updates, options);
              System.out.println("Modified document count: " + result.getModifiedCount());
              System.out.println("Upserted id: " + result.getUpsertedId()); // only contains a value when an upsert is performed
          } catch (MongoException me) {
              System.err.println("Unable to update due to an error: " + me);
          }
          
 
}
	
	public List<Document> afficher() {
		
          
          MongoDatabase database = mongoDBConnection.getDatabase();
          MongoCollection<Document> collection = database.getCollection("Voiture");
              
       
        	FindIterable<Document> documents = collection.find();
     	    List<Document> voitures = new ArrayList<>();

        	    
             
		            try (MongoCursor<Document> reservationIterator = documents.iterator()) {
		                while (reservationIterator.hasNext()) {
		                    Document voiture = reservationIterator.next();
		                    voitures.add(voiture);
		                }
		            }
        return voitures;
	}
	
	
	
	public Document getVoiture(String num) {
	    MongoDatabase database = mongoDBConnection.getDatabase();
	    MongoCollection<Document> collection = database.getCollection("Voiture");

	    Bson query = Filters.eq("Matricule", num);
	    FindIterable<Document> documents = collection.find(query);

	    // Retrieve the first matching document, if any
	    Document voiture = documents.first();

	    return voiture;
	}


	public long nombreVoiture() {
		 MongoDatabase database = mongoDBConnection.getDatabase();
       MongoCollection<Document> collection = database.getCollection("Voiture");
       long count = collection.countDocuments();


		return count;
		
	}
		  
	
	
	}
	


