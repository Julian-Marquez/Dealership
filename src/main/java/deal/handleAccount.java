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
import java.io.IOException;
import java.io.InputStream;

/**
 * Servlet implementation class handleAccount
 */
@MultipartConfig
public class handleAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handleAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//simple logging the user out
		ServletContext context = getServletContext(); 
		
		String action = request.getParameter("action");
		
		if(action.equals("delete")) {
			Database connect = new Database();
			User user  = (User) context.getAttribute("loggedinUser");
			connect.deleteUser(user);
		}
		
		context.removeAttribute("loggedinUser");
		
		request.getRequestDispatcher("login.jsp").forward(request, response); //back to the home page and logged out
		
		
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
		
		User user = (User) context.getAttribute("loggedinUser"); //load the current User
		
		String ogEmail = user.getEmail();
		try {
		if(!fname.isEmpty()) {
			user.setFirstName(fname);
		}
		if(!lname.isEmpty()) {
			user.setLastName(lname);
		}
		if(!email.isEmpty()) {
			user.setEmail(email);
		}
		if(!username.isEmpty()) {
			user.setUsername(username);
		}
		if(!password.isEmpty() && password.equals(confirmPassword)) {
			boolean isValid = validate(password,confirmPassword);
			if(isValid) {
				user.setPassword(password);
			}
		}
		if(!phone.isEmpty()) {
			user.setPhone(phone);
		}
		Accounts edit = new Accounts();
		try {
		    Part filePart = request.getPart("file");

		    if (filePart != null && filePart.getSize() > 0) {
		        try (InputStream inputStream = filePart.getInputStream()) {
		            byte[] imgData = inputStream.readAllBytes();
		            if (imgData.length > 0) {
		                user.setProfilePic(imgData);
		            }
		        } catch (IOException e) {
		            e.printStackTrace();
		        }
		    }
		} catch (Exception e) {
		    e.printStackTrace(); // Optional: handle/log error
		}
			
		}catch(NullPointerException e) {
			
		}
	    Database connect = new Database();
	    
		   connect.updateUser(user);
		    
		    context.setAttribute("loggedinUser", user);
		    
		    request.getRequestDispatcher("profile.jsp").forward(request, response); 
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
