package deal;

import jakarta.mail.Authenticator;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Servlet implementation class Recovery
 */
public class Recovery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context = request.getServletContext();
		
		String email = request.getParameter("email");
		String Code = request.getParameter("code");
		
		
		
		Database connect  = new Database();
		
		
		try {
		long sentCode = (long) context.getAttribute("code");
		if(sentCode != 0) {
			
			User user  = (User) context.getAttribute("recoverUser");
			context.setAttribute("loggedinUser", user);
			
			long check = Long.parseLong(Code);
			
			if(check == sentCode) {
				context.removeAttribute("code");
				context.removeAttribute("recoverUser");
				context.setAttribute("loggedinUser", user);
				request.getRequestDispatcher("profile.jsp").forward(request, response);
				
			}
			
		}
		}catch(NullPointerException e) {
			
		}
		try {
			if(!email.isEmpty()) {
			for(User user : connect.getAllUsers()) {
				
				if(user.getEmail().equals(email)) {
					
					Random random =  new Random();
					long setCode = random.nextInt(1000000,99999999);
					
					sendEmail(user,setCode);
					
					context.setAttribute("code", setCode);
					context.setAttribute("recoverUser",user);
					request.getRequestDispatcher("recover.jsp").forward(request, response);
				}
				
			
			
			}
			}
		
			}catch(NullPointerException e) {
				
			}
	}
	
	public void sendEmail(User user, long code) throws UnsupportedEncodingException {
		String subject = "Recovery Code Request";
		String content = "Hello " + user.getFirstName() + " your recovery code is: " + code;
		
		 String host = "smtp.gmail.com";
	        int port = 587;
	        Properties props = new Properties();
	        props.put("mail.smtp.host", host);
	        props.put("mail.smtp.port", port);
	        props.put("mail.smtp.auth", "true");
	        props.put("mail.smtp.starttls.enable", "true");

	        // Authentication information
	        String username = "turbotowing505@gmail.com"; // Use your Gmail address
	        String password = "pwnd mleh nfgf tkxt"; // Use the app-specific password

	        // Create a session with the properties and the authenticator
	        Session session = Session.getInstance(props, new Authenticator() {
	            @Override
	            protected PasswordAuthentication getPasswordAuthentication() {
	                return new PasswordAuthentication(username, password);
	            }
	        });

	        try {
	            // Create a message
	            Message message = new MimeMessage(session);
	            message.setFrom(new InternetAddress("TruboMotors_Team@gmail.com", "Turbo Motors"));
	            message.setReplyTo(InternetAddress.parse("TruboMotors_Team@gmail.com"));
	            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail()));
	            message.setSubject(subject);
	            message.setText(content);

	            // Send the message
	            Transport.send(message);

	            System.out.println("Email sent successfully!");
	        } catch (MessagingException e) {
	            e.printStackTrace(); // Print the exception details (you can customize this)
	        }
		
	}

}
