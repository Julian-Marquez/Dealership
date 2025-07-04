package deal;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeBodyPart;
import jakarta.mail.internet.MimeMessage;
import jakarta.mail.internet.MimeMultipart;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.lowagie.text.pdf.PdfPCell;
import com.lowagie.text.pdf.draw.LineSeparator;

import java.awt.Color;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

@MultipartConfig
public class handleApplications extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Part idPart;
	private Part residencePart;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handleApplications() {
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
	    // Collect user data
	    String firstName = request.getParameter("fname");
	    String lastName = request.getParameter("lname");
	    String email = request.getParameter("email");
	    String phone = request.getParameter("phone");
	    String address = request.getParameter("address");
	    String city = request.getParameter("city");
	    String state = request.getParameter("state");
	    String zip = request.getParameter("zip");
	    String tempSSN = request.getParameter("SSN");
	    String DOB = request.getParameter("DOB");
	    String contact = request.getParameter("selectedContactMethod");

	    String brand = request.getParameter("brand");
	    String model = request.getParameter("model");
	    String vin = request.getParameter("vin");

	    String employer = request.getParameter("employer");
	    String income = request.getParameter("income");
	    String years = request.getParameter("years");
	    String down = request.getParameter("downPayment");
	    String trade = request.getParameter("tradeValue");
	    String months = request.getParameter("months");
	    String vehicleYears = request.getParameter("vehicleYears");
	    
	    String SSN = tempSSN.substring(0,3) + "-" + tempSSN.substring(3,5) + "-" + tempSSN.substring(5,9);
	    
	    
	    residencePart = request.getPart("residenceType");
	     idPart = request.getPart("idType");

	    
	    File residenceFile = null;
	    File idFile = null;

	    try {
	        residenceFile = File.createTempFile("residence_", "_" + System.currentTimeMillis());
	        try (InputStream input = residencePart.getInputStream(); FileOutputStream fos = new FileOutputStream(residenceFile)) {
	            input.transferTo(fos);
	        }

	        idFile = File.createTempFile("id_", "_" + System.currentTimeMillis());
	        try (InputStream input = idPart.getInputStream(); FileOutputStream fos = new FileOutputStream(idFile)) {
	            input.transferTo(fos);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	 
	    
	    File tempFile = new File(System.getProperty("java.io.tmpdir"), "application_" + System.currentTimeMillis() + ".pdf");
	    Document doc = new Document();
	    
	    PdfWriter.getInstance(doc, new FileOutputStream(tempFile)); // SECOND stream

	    doc.open();

	    // Fonts
	    Font titleFont = new Font(Font.HELVETICA, 20, Font.BOLD, new Color(0, 102, 204));
	    Font sectionFont = new Font(Font.HELVETICA, 14, Font.BOLD, new Color(60, 60, 60));
	    Font labelFont = new Font(Font.HELVETICA, 12, Font.BOLD, Color.BLACK);
	    Font valueFont = new Font(Font.HELVETICA, 12, Font.NORMAL, Color.DARK_GRAY);

	    // Logo
	    String logoPath = request.getServletContext().getRealPath("/images/logo.png");
	    Image logo = Image.getInstance(logoPath);
	    logo.scaleToFit(120, 60);
	    logo.setAlignment(Image.ALIGN_LEFT);
	    doc.add(logo);

	    // Title
	    Paragraph title = new Paragraph("Vehicle Financing Application", titleFont);
	    title.setAlignment(Element.ALIGN_CENTER);
	    title.setSpacingAfter(20f);
	    doc.add(title);

	    // Separator
	    doc.add(new LineSeparator(1f, 100, new Color(0, 102, 204), Element.ALIGN_CENTER, -2));

	    // Personal Info Section
	    doc.add(new Paragraph("Applicant Information", sectionFont));
	    doc.add(Chunk.NEWLINE);
	    PdfPTable personalTable = new PdfPTable(2);
	    personalTable.setWidthPercentage(100);
	    personalTable.setSpacingAfter(15f);
	    addRow(personalTable, "Full Name", firstName + " " + lastName, labelFont, valueFont);
	    addRow(personalTable, "DOB", DOB, labelFont, valueFont);
	    addRow(personalTable, "Prefered Contact", contact, labelFont, valueFont);
	    addRow(personalTable, "Email", email, labelFont, valueFont);
	    addRow(personalTable, "Phone", phone, labelFont, valueFont);
	    addRow(personalTable, "Address", address + ", " + city + ", " + state + " " + zip, labelFont, valueFont);
	    addRow(personalTable, "SSN", SSN, labelFont, valueFont);
	    doc.add(personalTable);

	    // Divider
	    doc.add(new LineSeparator(0.5f, 100, Color.LIGHT_GRAY, Element.ALIGN_CENTER, -2));
	    doc.add(Chunk.NEWLINE);

	    // Vehicle Info
	    doc.add(new Paragraph("Vehicle and Financial Information", sectionFont));
	    doc.add(Chunk.NEWLINE);
	    PdfPTable vehicleTable = new PdfPTable(2);
	    vehicleTable.setWidthPercentage(100);
	    vehicleTable.setSpacingAfter(20f);
	    addRow(vehicleTable, "Brand / Model", brand + " " + model, labelFont, valueFont);
	    addRow(vehicleTable, "VIN", (vin != null ? vin : "N/A"), labelFont, valueFont);
	    addRow(vehicleTable, "Vehicle Model year", vehicleYears , labelFont, valueFont);
	    addRow(vehicleTable, "Employer", employer, labelFont, valueFont);
	    addRow(vehicleTable, "Annual Income", "$" + income, labelFont, valueFont);
	    addRow(vehicleTable, "Time at Job", years + " years", labelFont, valueFont);
	    addRow(vehicleTable, "Down Payment", "$" + down, labelFont, valueFont);
	    addRow(vehicleTable, "Trade-In Value", "$" + trade, labelFont, valueFont);
	    addRow(vehicleTable, "Preferred Term", months + " months", labelFont, valueFont);
	    doc.add(vehicleTable);

	    // Final note
	    Paragraph footer = new Paragraph("Turbo Motors", new Font(Font.HELVETICA, 12, Font.ITALIC, Color.GRAY));
	    footer.setAlignment(Element.ALIGN_CENTER);
	    doc.add(footer);
	    
	    

	    doc.close();

	 // ✅ Send via email
	    if (sendDocument(tempFile, firstName + " " + lastName, residenceFile, idFile)) {
	    	request.getRequestDispatcher("success.jsp").forward(request, response); // ✅ Safe because no output stream used
		   
	    } else {
	    	request.getRequestDispatcher("error.jsp").forward(request, response);
	    }
	}

	// Helper method
	private void addRow(PdfPTable table, String label, String value, Font labelFont, Font valueFont) {
	    PdfPCell cell1 = new PdfPCell(new Phrase(label + ":", labelFont));
	    PdfPCell cell2 = new PdfPCell(new Phrase(value, valueFont));
	    cell1.setBorder(Rectangle.NO_BORDER);
	    cell2.setBorder(Rectangle.NO_BORDER);
	    table.addCell(cell1);
	    table.addCell(cell2);
	}

	
	private boolean sendDocument(File pdfFile, String fullName, File residenceFile, File idFile) {
	    String subject = "Pre Approval Application from " + fullName;
	    String content = fullName + " has submitted an application for vehicle financing. Please find the attached PDF and additional documents.";

	    String host = "smtp.gmail.com";
	    int port = 587;

	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", port);

	    String username = "turbotowing505@gmail.com";
	    String password = "pwnd mleh nfgf tkxt"; // Use Gmail app password

	    Session session = Session.getInstance(props, new Authenticator() {
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	        }
	    });

	    try {
	        MimeMessage message = new MimeMessage(session);
	        message.setFrom(new InternetAddress("TruboMotors_Team@gmail.com", "Turbo Motors"));
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse("Turbomotorsllc@yahoo.com"));
	        message.setSubject(subject);

	        // Body text
	        MimeBodyPart textPart = new MimeBodyPart();
	        textPart.setText(content);

	        // PDF Attachment
	        MimeBodyPart attachmentPart = new MimeBodyPart();
	        attachmentPart.attachFile(pdfFile);
	        
	        MimeBodyPart idAttachment = new MimeBodyPart();
	        idAttachment.attachFile(idFile);
	        idAttachment.setFileName("ID_Document" + getExtension(idPart)); // Optional helper

	        MimeBodyPart residenceAttachment = new MimeBodyPart();
	        residenceAttachment.attachFile(residenceFile);
	        residenceAttachment.setFileName("Proof_of_Residence" + getExtension(residencePart));

	        // Combine parts
	        MimeMultipart multipart = new MimeMultipart("mixed");
	        multipart.addBodyPart(textPart);
	        multipart.addBodyPart(attachmentPart);
	        multipart.addBodyPart(residenceAttachment);
	        multipart.addBodyPart(idAttachment);

	        message.setContent(multipart);

	        // Send
	        Transport.send(message);
	        System.out.println("Email with PDF and additional documents sent successfully!");
	        return true;

	    } catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    } finally {
	        // Optionally delete temp files
	        if (pdfFile.exists()) pdfFile.delete();
	        if (residenceFile != null && residenceFile.exists()) residenceFile.delete();
	        if (idFile != null && idFile.exists()) idFile.delete();
	    }
	}

	
	private File saveUploadedFile(Part part, String prefix) throws IOException {
	    if (part == null || part.getSize() == 0) return null;

	    if (prefix == null || prefix.length() < 3) {
	        prefix = "file_"; // Ensure it's valid
	    }

	    File tempFile = File.createTempFile(prefix, "_" + System.currentTimeMillis());
	    try (InputStream input = part.getInputStream(); FileOutputStream fos = new FileOutputStream(tempFile)) {
	        byte[] buffer = new byte[4096];
	        int bytesRead;
	        while ((bytesRead = input.read(buffer)) != -1) {
	            fos.write(buffer, 0, bytesRead);
	        }
	    }
	    return tempFile;
	}
	private String getExtension(Part part) {
	    String submittedFileName = part.getSubmittedFileName();
	    return submittedFileName != null && submittedFileName.contains(".") ?
	           submittedFileName.substring(submittedFileName.lastIndexOf(".")) : "";
	}

}
