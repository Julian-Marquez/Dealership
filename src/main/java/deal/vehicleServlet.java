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
import java.time.LocalDate;
import java.util.Random;

/**
 * Servlet implementation class vehicleServlet
 */
@MultipartConfig
public class vehicleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public vehicleServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context = request.getServletContext();
		
		Vehicle vehicle = (Vehicle) context.getAttribute("vehicle");
		
		String action = request.getParameter("action");
		String id = request.getParameter("vehicleId");
		
		try {
			Database connect = new Database();
		if(action.equals("delete") && vehicle != null){
			
			
			connect.removeVehicle(vehicle.getVehicleId());
			context.removeAttribute("vehicle");
			request.getRequestDispatcher("allVehicles.jsp").forward(request, response);
		}
		
		for(Vehicle _vehicle : connect.getAllVehicles()) {
			
			long vehicleId = Long.parseLong(id);
			
			if(_vehicle.getVehicleId() == vehicleId) {
				vehicle = _vehicle;
				
				if(action.equals("delete")) {
				connect.removeVehicle(vehicleId);
				context.removeAttribute("vehicle");
				request.getRequestDispatcher("allVehicles.jsp").forward(request, response);
			}
				if(action.equals("edit")) {
					context.setAttribute("vehicle",_vehicle);
					request.getRequestDispatcher("editVehicle.jsp").forward(request, response);
				}
			}
		}
		
		
		}catch(NullPointerException e){
			request.getRequestDispatcher("allVehicles.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	ServletContext context = request.getServletContext();
	
		User user = (User) context.getAttribute("loggedinUser");
		
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String year = request.getParameter("year");
		String mileage = request.getParameter("mileage");
		String price = request.getParameter("price");
		String engine = request.getParameter("engine");
		String description = request.getParameter("description");
		String location =  request.getParameter("location");
		
		Accounts fileHandle = new Accounts();	  
		
		Vehicle vehicle = new Vehicle(brand,model,Integer.parseInt(year),Long.parseLong(mileage),Double.parseDouble(price),engine,description,location);
		
		vehicle.setOwner(user);
		
		LocalDate today = LocalDate.now();
		
		vehicle.setDatePosted(today);
		
	    try {
	    Part filePart = request.getPart("file");

	    String fileName = fileHandle.getFileName(filePart);
	    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdir(); // Create the directory if it doesn't exist
	    }

	    byte[] imgData = null;

	    try (InputStream inputStream = filePart.getInputStream()) {
	        imgData = inputStream.readAllBytes();
	        
	        vehicle.getImages().add(imgData);
	        System.out.println("image Data added: " + vehicle.getImages().get(0).length);
	       
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    }catch(NullPointerException e) {
	
	    	}
	    
	   
	    Database connect = new Database();
	    
	    connect.insertVehicle(vehicle);
	    request.getRequestDispatcher("allVehicles.jsp").forward(request, response);
	}

}
