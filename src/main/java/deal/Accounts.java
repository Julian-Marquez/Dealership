package deal;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.Random;

@MultipartConfig
public class Accounts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Accounts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		ServletContext context = request.getServletContext();
		
		
		System.out.println("Dubugging and recieved: " + email + " " + password);
		
		
		Database connect = new Database();
		
		boolean found = false;
		
		for(User user : connect.getAllUsers()) {
			if(email.equals(user.getEmail()) && password.equals(user.getPassword())){
				found = true;
				context.setAttribute("loggedinUser",user);
				request.getRequestDispatcher("profile.jsp").forward(request, response);
				break;
			}
		}
		
		if(!found) {
		request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context = request.getServletContext();
		
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("ConfirmPassword");
		String email = request.getParameter("email");
		
		//optional feilds
		String phone = request.getParameter("phone");
		
		Database connect = new Database();
		
		for(User check : connect.getAllUsers()) {
			if(check.getEmail().equals(email)){
				context.setAttribute("message", true); // tells the user user the email is already taken 
				request.getRequestDispatcher("register.jsp").forward(request, response);
				break;
			}
		}
		
		
		
		boolean validPassword = false;
		
		validPassword = validate(password,confirmPassword);
		
		User user = null;
		
		if(validPassword) {
			
			 user = new User( fname,  lname, email, username,  phone, password);
			 
			 if(email.equals("marquezjulian09@gmail.com") || email.equals("Turbomotorsllc@yahoo.com")) {
				 user.setAdmin(true);
			 }
			
		}else {
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}
	    
	    try {
	    Part filePart = request.getPart("file");

	    String fileName = getFileName(filePart);
	    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdir(); // Create the directory if it doesn't exist
	    }

	    String filePath = uploadPath + File.separator + fileName;
	    byte[] imgData = null;

	    try (InputStream inputStream = filePart.getInputStream()) {
	        imgData = inputStream.readAllBytes();
	        
	        user.setProfilePic(imgData); //image provided by the user
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    }catch(NullPointerException e) {
	
	    //	newUser.setPrpfilePic(staticImgPath); //image generated and set for the user
	    	}
	    
	    if(user.getProfilePic().length == 0) {
	      	Random random = new Random();
	    	int num = random.nextInt(4); // generate a random index for a static profile pic
	    	String profilePicPath = "images/staticUser.png";
	    	byte[] staticImgPath = fileToByteArray(getServletContext(),profilePicPath);
	    	

	    	user.setProfilePic(staticImgPath); //image generated and set for the user
	    }
	    
	    
	    context.setAttribute("loggedinUser", user);
	    
	    connect.insertUser(user);
	    request.getRequestDispatcher("profile.jsp").forward(request, response);
	    
	}
	public static byte[] fileToByteArray(ServletContext context, String relativePath) throws IOException {
	    String absolutePath = context.getRealPath(relativePath);
	    File file = new File(absolutePath);

	    if (!file.exists()) {
	        throw new FileNotFoundException("File not found: " + absolutePath);
	    }

	    return Files.readAllBytes(file.toPath());
	}


	  public String getFileName(Part part) {
	        String contentDisposition = part.getHeader("content-disposition");
	        if (contentDisposition != null) {
	            for (String content : contentDisposition.split(";")) {
	                if (content.trim().startsWith("filename")) {
	                    return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
	                }
	            }
	        }
	        return null;
	    }
	  
	  public static String byteArrayToFile(byte[] byteArray) throws IOException {
	

		    // Create a temporary file with a generic extension (e.g., ".tmp")
		    File tempFile = Files.createTempFile("file_", ".tmp").toFile();

		    // Write the byte array to the temporary file
		    try (FileOutputStream fos = new FileOutputStream(tempFile)) {
		        fos.write(byteArray);
		    }

		    // Ensure the temporary file persists until explicitly deleted
		    tempFile.deleteOnExit();

		    // Return the absolute path of the created file
		    return tempFile.getAbsolutePath();
		}
	  
		public boolean validate(String password, String confirmPassword) {
			boolean valid = false;
			String[] specialChars = {"!","@","#","$","%","^","&","*"};// valid special chars
			
			boolean conatinSpecial = false;
			
			for(String Char: specialChars) {
				if(password.contains(Char)) {
					conatinSpecial = true;
				}
			}
			
			if(conatinSpecial && password.equals(confirmPassword) && password.length() > 7) {
				valid = true; // redirect them if all is wrong
			}
			return valid;
		}
}
