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



public class ClientCrud {
	private MongoDBConnection mongoDBConnection;
	public ClientCrud() throws UnknownHostException {
     	mongoDBConnection = new MongoDBConnection();
	 }
	
	public void insertClient(Client client) {
		
        try  {
   		 MongoDatabase database = mongoDBConnection.getDatabase();
            MongoCollection<Document> collection = database.getCollection("Client");
            try {
                  collection.insertOne(new Document()
	                    .append("_id", new ObjectId())
	                    .append("N_client", client.getN_client())
                        .append("Nom", client.getNom())
                        .append("Prenom", client.getPrenom())
                        .append("CIN", client.getCIN())
                        .append("Login", client.getEmail())
                        .append("Adress", client.getAdress()));
                System.out.println("Success! Inserted client document id: " );
            } catch (MongoException me) {
                System.err.println("Unable to insert due to an error: " + me);
            }
        }
        catch(MongoException e) {
            System.err.println("Unable to insert due to an error: " + e);

        }
        
	}
	
	public void DeletClient(int  num) {
	    
  		 MongoDatabase database = mongoDBConnection.getDatabase();
           MongoCollection<Document> collection = database.getCollection("Client");
         
           	Bson query = Filters.eq("N_client", num);
               try {
                   DeleteResult result = collection.deleteOne(query);
                   System.out.println("Deleted client document count: " + result.getDeletedCount());
               } catch (MongoException me) {
                   System.err.println("Unable to delete client due to an error: " + me);
               }
           
    }
	
	public Document getClient(int num) {
	   MongoDatabase database = mongoDBConnection.getDatabase();
	   MongoCollection<Document> collection = database.getCollection("Client");
	
	   Bson query = Filters.eq("N_client", num);
	   FindIterable<Document> documents = collection.find(query);
	
	   // Retrieve the first matching document, if any
	   Document client = documents.first();
	
	   return client;
	}

	public void UpdateClient(Client client) {
  
  		 MongoDatabase database = mongoDBConnection.getDatabase();
           MongoCollection<Document> collection = database.getCollection("Client");
       	Bson query = Filters.eq("N_client", client.getN_client());
       	System.out.println(client.getN_client());

         Bson updates = Updates.combine(
                 Updates.set("Nom", client.getNom()),
                 Updates.set("Prenom", client.getPrenom()),
                 Updates.set("CIN", client.getCIN()),
                 Updates.set("Login", client.getEmail()),
                 Updates.set("Adress", client.getAdress()));
         
         UpdateOptions options = new UpdateOptions().upsert(false);
         try {
             UpdateResult result = collection.updateOne(query, updates, options);
             System.out.println("Modified client document count: " + result.getModifiedCount());
             System.out.println("Upserted id: " + result.getUpsertedId()); // only contains a value when an upsert is performed
         } catch (MongoException me) {
             System.err.println("Unable to update client due to an error: " + me);
         }
         
	}
	
	public List<Document> afficher() {
		
       
        MongoDatabase database = mongoDBConnection.getDatabase();
        MongoCollection<Document> collection = database.getCollection("Client");
            
     
      	FindIterable<Document> documents = collection.find();
   	      List<Document> clients = new ArrayList<>();

      	    
           
		            try (MongoCursor<Document> ClientIterator = documents.iterator()) {
		                while (ClientIterator.hasNext()) {
		                    Document client = ClientIterator.next();
		                    System.out.println(client);
		                    clients.add(client);
		                }
		            }
      return clients;
	}
	
	

	
	
	
	public long nombreClient() {
 		 MongoDatabase database = mongoDBConnection.getDatabase();
        MongoCollection<Document> collection = database.getCollection("Client");
        long count = collection.countDocuments();


		return count;
		
	}
	
	
	public int getNombreTotalClients() {
	    int nombreTotalClients = 0;
	    MongoDatabase database = null;

	    try {
	        // Récupérer la connexion à la base de données MongoDB
	        MongoDatabase databaseget = mongoDBConnection.getDatabase();

	        // Récupérer la collection client
	        MongoCollection<Document> collection = databaseget.getCollection("Client");

	        // Compter le nombre de documents dans la collection
	        nombreTotalClients = (int) collection.countDocuments();
	    } catch (MongoException e) {
	        e.printStackTrace(); // Gérer les exceptions liées à MongoDB
	    } 

	    return nombreTotalClients;
	}


	
	
}


