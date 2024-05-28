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

public class AdminCrud {
	 private MongoDBConnection mongoDBConnection;
		public AdminCrud() throws UnknownHostException {
			        mongoDBConnection = new MongoDBConnection();
			    }
		
		public void insertAdmin(Admin admin) {
			
		        try  {
		   		 MongoDatabase database = mongoDBConnection.getDatabase();
		            MongoCollection<Document> collection = database.getCollection("Admin");
		            try {
		                  collection.insertOne(new Document()
			                    .append("_id", new ObjectId())
			                    .append("N_admin", admin.getN_admin())
		                  
		                        .append("Login", admin.getLogin())
		                        .append("Password", admin.getPassword()) );
		                  
		                System.out.println("Success! Inserted Admin document id: " );
		            } catch (MongoException me) {
		                System.err.println("Unable to insert admin due to an error: " + me);
		            }
		        }
		        catch(MongoException e) {
	                System.err.println("Unable to insert admin due to an error: " + e);

		        }
		
		        
		}
		
		public void DeletAdmin(int  num) {
			
		    
		   		 MongoDatabase database = mongoDBConnection.getDatabase();
		            MongoCollection<Document> collection = database.getCollection("Admin");
		          
		            	Bson query = Filters.eq("N_admin", num);
		                try {
		                    DeleteResult result = collection.deleteOne(query);
		                    System.out.println("Deleted admin document count: " + result.getDeletedCount());
		                } catch (MongoException me) {
		                    System.err.println("Unable to delete admin due to an error: " + me);
		                }
		            
		        }
		public Document getAdmin(int num) {
		    MongoDatabase database = mongoDBConnection.getDatabase();
		    MongoCollection<Document> collection = database.getCollection("Admin");

		    Bson query = Filters.eq("N_admin", num);
		    FindIterable<Document> documents = collection.find(query);

		    // Retrieve the first matching document, if any
		    Document admin = documents.first();

		    return admin;
		}

		
		
		public void UpdateAdmin(Admin admin) {

			   
	   		 MongoDatabase database = mongoDBConnection.getDatabase();
	            MongoCollection<Document> collection = database.getCollection("Admin");
	        	Bson query = Filters.eq("N_admin", admin.getN_admin());
	        	System.out.println(admin.getN_admin());

	          Bson updates = Updates.combine(
	                 
	                  Updates.set("Login", admin.getLogin()),
	                  Updates.set("Password", admin.getPassword()) );
	          UpdateOptions options = new UpdateOptions().upsert(false);
	          try {
	              UpdateResult result = collection.updateOne(query, updates, options);
	              System.out.println("Modified admin document count: " + result.getModifiedCount());
	              System.out.println("Upserted admin id: " + result.getUpsertedId()); // only contains a value when an upsert is performed
	          } catch (MongoException me) {
	              System.err.println("Unable admin to update due to an error: " + me);
	          }
	          
	 
	}
		
		public List<Document> afficher() {
			
	          //List<Manager> managers = new ArrayList<>();
	          MongoDatabase database = mongoDBConnection.getDatabase();
	          MongoCollection<Document> collection = database.getCollection("Admin");
	              
	       
	        	FindIterable<Document> documents = collection.find();
	     	   List<Document> admins = new ArrayList<>();

	        	    
	             
			            try (MongoCursor<Document> reservationIterator = documents.iterator()) {
			                while (reservationIterator.hasNext()) {
			                    Document admin = reservationIterator.next();
			                    admins.add(admin);
			                }
			            }
	        return admins;
		}
		
		private Admin parseAdminFromDocument(Document doc) {
		   
		    String login = doc.getString("Login");
		    String pass = doc.getString("Password");
		   // int nbr = doc.getInteger("N_manager");

		    Admin admin = new Admin(2, login,pass);
		    return admin;
		}

	   
       
		public int getNombreTotalAdmin() {
		    int nombreTotalClients = 0;
		    MongoDatabase database = null;

		    try {
		        // Récupérer la connexion à la base de données MongoDB
		        MongoDatabase databaseget = mongoDBConnection.getDatabase();

		        // Récupérer la collection client
		        MongoCollection<Document> collection = databaseget.getCollection("Admin");

		        // Compter le nombre de documents dans la collection
		        nombreTotalClients = (int) collection.countDocuments();
		    } catch (MongoException e) {
		        e.printStackTrace(); // Gérer les exceptions liées à MongoDB
		    } 

		    return nombreTotalClients;
		}
			
}
