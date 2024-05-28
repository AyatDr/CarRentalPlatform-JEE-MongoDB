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



public class ManagerCrud {
	 private MongoDBConnection mongoDBConnection;
	public ManagerCrud() throws UnknownHostException {
		        mongoDBConnection = new MongoDBConnection();
		    }
	
	public void insertManager(Manager manager) {
		
	        try  {
	   		 MongoDatabase database = mongoDBConnection.getDatabase();
	            MongoCollection<Document> collection = database.getCollection("Manager");
	            try {
	                  collection.insertOne(new Document()
		                    .append("_id", new ObjectId())
		                    .append("N_manager", manager.getN_manager())
	                        .append("Nom", manager.getNom())
	                        .append("Prenom", manager.getPrenom())
	                        .append("CIN", manager.getCIN())
	                        .append("Login", manager.getLogin())
	                        .append("Password", manager.getPassword())
	                        .append("adress", manager.getAdress()));
	                System.out.println("Success! Inserted document id: " );
	            } catch (MongoException me) {
	                System.err.println("Unable to insert due to an error: " + me);
	            }
	        }
	        catch(MongoException e) {
                System.err.println("Unable to insert due to an error: " + e);

	        }
	
	        
	}
	
	public void DeletManager(int  num) {
		
	    
	   		 MongoDatabase database = mongoDBConnection.getDatabase();
	            MongoCollection<Document> collection = database.getCollection("Manager");
	          
	            	Bson query = Filters.eq("N_manager", num);
	                try {
	                    DeleteResult result = collection.deleteOne(query);
	                    System.out.println("Deleted document count: " + result.getDeletedCount());
	                } catch (MongoException me) {
	                    System.err.println("Unable to delete due to an error: " + me);
	                }
	            
	        }
	public Document getManager(int num) {
	    MongoDatabase database = mongoDBConnection.getDatabase();
	    MongoCollection<Document> collection = database.getCollection("Manager");

	    Bson query = Filters.eq("N_manager", num);
	    FindIterable<Document> documents = collection.find(query);

	    // Retrieve the first matching document, if any
	    Document manager = documents.first();

	    return manager;
	}

	
	
	public void UpdateManager(Manager manager) {

		   
   		 MongoDatabase database = mongoDBConnection.getDatabase();
            MongoCollection<Document> collection = database.getCollection("Manager");
        	Bson query = Filters.eq("N_manager", manager.getN_manager());
        	System.out.println(manager.getN_manager());

          Bson updates = Updates.combine(
                  Updates.set("Nom", manager.getNom()),
                  Updates.set("Prenom", manager.getPrenom()),
                  Updates.set("CIN", manager.getCIN()),
                  Updates.set("Login", manager.getLogin()),
                  Updates.set("Password", manager.getPassword()),
                  Updates.set("adress", manager.getAdress()));
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
		
          //List<Manager> managers = new ArrayList<>();
          MongoDatabase database = mongoDBConnection.getDatabase();
          MongoCollection<Document> collection = database.getCollection("Manager");
              
       
        	FindIterable<Document> documents = collection.find();
     	   List<Document> managers = new ArrayList<>();

        	    
             
		            try (MongoCursor<Document> reservationIterator = documents.iterator()) {
		                while (reservationIterator.hasNext()) {
		                    Document manager = reservationIterator.next();
		                    managers.add(manager);
		                }
		            }
        return managers;
	}
	
	private Manager parseManagerFromDocument(Document doc) {
	    String Nom = doc.getString("Nom");
	    String Prenom = doc.getString("Prenom");
	    String CIN = doc.getString("CIN");
	    String adress = doc.getString("adress");
	    String login = doc.getString("Login");
	    String pass = doc.getString("Password");
	   // int nbr = doc.getInteger("N_manager");

	    Manager manager = new Manager(2, Nom, Prenom,CIN,adress,login,pass);
	    return manager;
	}
	public long nombreManager() {
  		 MongoDatabase database = mongoDBConnection.getDatabase();
         MongoCollection<Document> collection = database.getCollection("Manager");
         long count = collection.countDocuments();


		return count;
		
	}

   
	public int getNombreTotalManger() {
	    int nombreTotalClients = 0;
	    MongoDatabase database = null;

	    try {
	        // Récupérer la connexion à la base de données MongoDB
	        MongoDatabase databaseget = mongoDBConnection.getDatabase();

	        // Récupérer la collection client
	        MongoCollection<Document> collection = databaseget.getCollection("Manager");

	        // Compter le nombre de documents dans la collection
	        nombreTotalClients = (int) collection.countDocuments();
	    } catch (MongoException e) {
	        e.printStackTrace(); // Gérer les exceptions liées à MongoDB
	    } 

	    return nombreTotalClients;
	}
		
	
  
	
	
	
	}
	


