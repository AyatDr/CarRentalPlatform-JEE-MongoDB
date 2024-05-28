package com.octest.clas;

import com.mongodb.DB;
import com.mongodb.MongoClient;
import com.mongodb.MongoClientURI;
import com.mongodb.client.MongoDatabase;

public class MongoDBConnection {
    private MongoClient mongoClient;
    private MongoDatabase database;

    public MongoDBConnection() {
        try {
            String connectionString = "mongodb://localhost:27017";
            MongoClientURI uri = new MongoClientURI(connectionString);
            mongoClient = new MongoClient(uri);
            database = mongoClient.getDatabase("LocationVoitures");
            System.out.println("Connexion établie!");
        } catch (Exception e) {
            System.out.println("Erreur lors de la connexion à la base de données MongoDB:");
            e.printStackTrace();
        }
    }

    public MongoDatabase getDatabase() {
        return database;
    }
}
