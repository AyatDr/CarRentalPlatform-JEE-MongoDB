package com.octest.servlet;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.Color;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;

import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.pdmodel.PDPage;
import org.apache.pdfbox.pdmodel.PDPageContentStream;
import org.apache.pdfbox.pdmodel.font.PDFont;
import org.apache.pdfbox.pdmodel.font.PDType0Font;

import org.apache.pdfbox.pdmodel.font.PDType1Font;
import org.apache.pdfbox.pdmodel.graphics.image.PDImageXObject;
import org.bson.Document;
import org.bson.types.ObjectId;

import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.octest.clas.MongoDBConnection;





/**
 * Servlet implementation class ChangerStatutServlet
 */
public class ChangerStatutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangerStatutServlet() {
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
	    ObjectId reservationIdF = new ObjectId(reservationId);
	    
	 
	    
	    MongoDBConnection connection = new MongoDBConnection();
	    MongoDatabase database = connection.getDatabase();
	   
	    MongoCollection<Document> reservationCollection = database.getCollection("Reservation");
	    ObjectId objectId = new ObjectId(reservationId);
	    Document query = new Document("_id", objectId);

	    // Mettre à jour le statut de la réservation
	    Document update = new Document("$set", new Document("status", "Confirmée"));
	    reservationCollection.updateOne(query, update);
	    System.out.println("La réservation a été modifiée avec succès.");
	    
	
        MongoCollection<Document> collection = database.getCollection("Facture");
        
        // Création du document à insérer
        Document document = new Document();
        document.append("idReservation", reservationIdF);
        document.append("date", LocalDateTime.now().toString()); // Date système
        
        // Insertion du document dans la collection
        collection.insertOne(document);
	    

	    // Générer le contenu du PDF
	    ByteArrayOutputStream pdfContent = generatePDFContent(reservationId, getServletContext());

	    // Envoyer le PDF au navigateur
	    response.setContentType("application/pdf");
	    response.setHeader("Content-disposition", "attachment; filename=reservations.pdf");
	    response.setContentLength(pdfContent.size());
	    OutputStream outputStream = response.getOutputStream();
	    pdfContent.writeTo(outputStream);
	    outputStream.flush();

	    // Rediriger vers la page de réservations
	    request.getRequestDispatcher("Reservations").forward(request, response);
	}

	public ByteArrayOutputStream generatePDFContent(String reservationId, ServletContext servletContext) throws IOException {
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    try (PDDocument document = new PDDocument()) {
	        PDPage page = new PDPage();
	        document.addPage(page);

	        try (PDPageContentStream contentStream = new PDPageContentStream(document, page)) {
	            // Définir la police par défaut et sa taille
	            contentStream.setFont(PDType1Font.HELVETICA, 12);

	            // Titre du document
	            float y = page.getMediaBox().getHeight() - 70; // Descendre un peu plus bas
	         // Définir la couleur du texte en rouge
	            
	            // Ajouter l'image en haut de la page
	            InputStream imageStream = servletContext.getResourceAsStream("/images/logocircle.png");
	            if (imageStream != null) {
	                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
	                int nRead;
	                byte[] data = new byte[1024];
	                while ((nRead = imageStream.read(data, 0, data.length)) != -1) {
	                    buffer.write(data, 0, nRead);
	                }
	                buffer.flush();

	                // Créer l'objet image
	                PDImageXObject image = PDImageXObject.createFromByteArray(document, buffer.toByteArray(), "logocar");
	                // Dessiner l'image sur la page PDF
	                contentStream.drawImage(image, 350, page.getMediaBox().getHeight() - 100, 200, 100);
	            } else {
	                System.out.println("Impossible de charger l'image depuis le répertoire de ressources.");
	            }
	            float marginLeft = 200;
	            drawCenteredText(contentStream, "Tetouan Le ",marginLeft, y);
	            java.util.Date date = new java.util.Date();

	            // Formater la date selon le format souhaité
	            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	            String dateString = sdf.format(date);
	            float marginLeft2 = 320;
	            // Afficher la date dans le premier champ
	            
	            drawCenteredText(contentStream, dateString,marginLeft2, y);

	            contentStream.setNonStrokingColor(Color.RED);
	            // Dessiner le texte centré en rouge
	            drawCenteredText(contentStream, "Facture de réservation", page.getMediaBox().getWidth(), y-100);

	            // Réinitialiser la couleur du texte à la valeur par défaut (noir) si nécessaire
	            contentStream.setNonStrokingColor(Color.BLACK); // Remplacez Color.BLACK par la couleur par défaut souhaitée si nécessaire
	            
	        

	            y -= 20;

	            // Récupérer les informations de la réservation à partir de la base de données
	            MongoDBConnection connection = new MongoDBConnection();
	            MongoDatabase database = connection.getDatabase();
	            MongoCollection<Document> reservationCollection = database.getCollection("Reservation");
	            ObjectId objectId = new ObjectId(reservationId);
	            Document query = new Document("_id", objectId);
	            Document reservation = reservationCollection.find(query).first();
	            
	            
	         // Récupérer l'ID du véhicule depuis le document de réservation
	         // Récupérer l'ObjectId du véhicule depuis le document de réservation
	            ObjectId voitureId = reservation.getObjectId("voitureId");


	            // Utiliser cet ID pour rechercher les informations du véhicule dans la collection des véhicules
	            MongoCollection<Document> voitureCollection = database.getCollection("Voiture");
	            Document queryVoiture = new Document("_id", voitureId);
	            Document voiture = voitureCollection.find(queryVoiture).first();

	            if (reservation != null) {
	                // Entête du tableau
	                float margin = 100;
	                float tableStartY = y - 110; // Descendre le tableau un peu plus bas
	                float rowHeight = 20;
	                float tableWidth = 400;

	                // Dessiner les lignes horizontales du tableau
	                for (int i = 0; i <= 6; i++) {
	                    contentStream.moveTo(margin, tableStartY - i * rowHeight);
	                    contentStream.lineTo(margin + tableWidth, tableStartY - i * rowHeight);
	                    contentStream.stroke();
	                }

	                // Dessiner les lignes verticales du tableau
	                contentStream.moveTo(margin, tableStartY);
	                contentStream.lineTo(margin, tableStartY - 6 * rowHeight);
	                contentStream.moveTo(margin + tableWidth, tableStartY);
	                contentStream.lineTo(margin + tableWidth, tableStartY - 6 * rowHeight);
	                contentStream.stroke();
	                float separatorX = margin + 150;
	                float tableEndY = 20; // Vous devez définir la valeur correcte ici en fonction de votre disposition de page

	             // Déterminer la position X des colonnes
	                float titleColumnX = margin + 6;
	                float dataColumnX = separatorX + 6; // Ajouter un décalage à partir de la ligne de séparation

	                // Données de la réservation
	                String[][] data = {
	                    
	                    {"Date de début", reservation.getDate("DateDebut").toString()},
	                    {"Date de fin", reservation.getDate("DateFin").toString()},
	                    {"Total (DH)", String.valueOf(reservation.getInteger("Total"))},
	                    {"Matricule", voiture.getString("Matricule")},
	                    {"Mode Paiement", reservation.getString("modePaiement")},
	                    {"TVA","20"}
	                };

	          
	                // Dessiner la ligne verticale de séparation
	                contentStream.moveTo(separatorX, tableStartY);
	                contentStream.lineTo(separatorX, tableStartY - 6 * rowHeight);
	                contentStream.stroke();

	                
	                for (int i = 0; i < data.length; i++) {
	                    // Dessiner le titre dans la colonne de gauche
	                    drawText(contentStream, data[i][0], titleColumnX, tableStartY - i * rowHeight - rowHeight / 2); // Centrer verticalement le texte
	                    
	                    // Dessiner la donnée dans la colonne de droite
	                    drawText(contentStream, data[i][1], dataColumnX, tableStartY - i * rowHeight - rowHeight / 2); // Centrer verticalement le texte
	                }
	                
	                
	             // Ajouter l'image en bas à droite de la page
		            InputStream imageStream1 = servletContext.getResourceAsStream("/images/cachee.png");
		            if (imageStream1 != null) {
		                ByteArrayOutputStream buffer = new ByteArrayOutputStream();
		                int nRead;
		                byte[] data2 = new byte[1024];
		                while ((nRead = imageStream1.read(data2, 0, data.length)) != -1) {
		                    buffer.write(data2, 0, nRead);
		                }
		                buffer.flush();

		                // Créer l'objet image
		                PDImageXObject image = PDImageXObject.createFromByteArray(document, buffer.toByteArray(), "logocar");

		                // Obtenir les dimensions de l'image
		                float imageWidth = image.getWidth();
		                float imageHeight = image.getHeight();

		                // Positionner l'image en bas à droite
		                float x1 = page.getMediaBox().getWidth() - imageWidth - 50; // 50 pixels de marge à droite
		                float y1= 150; // 50 pixels de marge en bas

		                // Dessiner l'image sur la page PDF
		                contentStream.drawImage(image, x1, y1, imageWidth, imageHeight);
		            } else {
		                System.out.println("Impossible de charger l'image depuis le répertoire de ressources.");
		            }

	            } else {
	                // Gérer le cas où aucune réservation n'est trouvée avec l'ID spécifié
	                drawCenteredText(contentStream, "Aucune réservation trouvée avec l'ID : " + reservationId, page.getMediaBox().getWidth() / 2, y);
	            }
	        }

	        
	        
	        // Enregistrer le document dans le flux de sortie
	        document.save(baos);
	    }
	    return baos;
	}



	// Méthode pour formatter une date en chaîne de caractères
	private String formatDate(Date date) {
	    SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");
	    return formatter.format(date);
	}

	// Méthode pour afficher du texte sur la page PDF
	private void drawText(PDPageContentStream contentStream, String text, float x, float y) throws IOException {
	    if (text != null) {
	        contentStream.beginText();
	        contentStream.newLineAtOffset(x, y);
	        contentStream.showText(text);
	        contentStream.endText();
	    } else {
	        // Gérer le cas où text est null
	        System.out.println("Attention : La chaîne de texte est nulle.");
	    }
	}

	// Méthode pour afficher du texte centré sur la page PDF
	private void drawCenteredText(PDPageContentStream contentStream, String text, float pageWidth, float y) throws IOException {
	    float textWidth = PDType1Font.HELVETICA.getStringWidth(text) / 1000 * 12;
	    float x = (pageWidth - textWidth) / 2;
	    drawText(contentStream, text, x, y);
	}

	
	
	
	
	

           
}