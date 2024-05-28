package com.octest.clas;

import java.net.UnknownHostException;

import org.bson.Document;

import com.mongodb.BasicDBObject;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class LogineAdmin {

	  private MongoDBConnection mongoDBConnection;

	    public LogineAdmin() throws UnknownHostException {
	        mongoDBConnection = new MongoDBConnection();
	    }

	    public boolean authenticateAdmin(String email, String password) {
	        System.out.print("MMMMMMMMMMMMMMMM");
	        MongoDatabase database = mongoDBConnection.getDatabase();
	                    
	        MongoCollection<Document> collection = database.getCollection("Admin");
	            
	        BasicDBObject query = new BasicDBObject();
	        query.put("Login", email);
	        query.put("Password", password);
	        
	        FindIterable<Document> result = collection.find(query);
	        
	        Document manager = result.first();
	        
	        if (manager != null) {
	            String storedUsername = manager.getString("Login");
	            String storedPassword = manager.getString("Password");
	            
	            if (email.equals(storedUsername) && password.equals(storedPassword)) {
	                return true;
	            }
	        }

	        return false;
	    }

}
