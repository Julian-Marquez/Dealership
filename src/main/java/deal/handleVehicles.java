package deal;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

/**
 * Servlet implementation class handleVehicles
 */
@MultipartConfig
public class handleVehicles extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handleVehicles() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String vehicleId = request.getParameter("id");
		String action = request.getParameter("action");
		
		ServletContext context = request.getServletContext();
		
		long id = Long.parseLong(vehicleId);
		
		User user = (User) context.getAttribute("loggedinUser");
		
		Database connect = new Database();
		
		for(Vehicle vehicle : connect.getAllVehicles()) {
			if(vehicle.getVehicleId() == id) {
				
				
				
				if(action.equals("view")) {
					context.setAttribute("vehicle",vehicle);
					request.getRequestDispatcher("vehicleInfo.jsp").forward(request, response);
					break;
				}
				else if(action.equals("remove")) {
						
						
					for(int i = 0; i < user.getSavedVehicles().size(); i++) {
						if( user.getSavedVehicles().get(i).getVehicleId() == id) {
							user.getSavedVehicles().remove(i);
							context.setAttribute("loggedinUser", user);
							connect.removeSavedVehicleForUser(user.getId(),vehicle.getVehicleId());
						}
					}
				
					}else if(action.equals("add")) {
						connect.insertVehicleForUser(user.getId(),vehicle.getVehicleId());
						user.getSavedVehicles().add(vehicle);
						context.setAttribute("loggedinUser", user);
					}
					context.setAttribute("loggedinUser", user);
					request.getRequestDispatcher("allVehicles.jsp").forward(request, response);
				
					
			}
		}
					
				}
		
		

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ServletContext context = request.getServletContext();
		
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String year = request.getParameter("year");
		String mileage = request.getParameter("mileage");
		String price = request.getParameter("price");
		String engine = request.getParameter("engine");
		String description = request.getParameter("description");
		String location =  request.getParameter("location");
		
		Vehicle vehicle = (Vehicle) context.getAttribute("vehicle");
		
		if(!brand.isEmpty()) {
			vehicle.setBrand(brand);
		}
		if(!model.isEmpty()) {
			vehicle.setModel(model);
		}
		if(!year.isEmpty()) {
			vehicle.setYear(Integer.parseInt(year));
		}
		if(!mileage.isEmpty()) {
			vehicle.setMileage(Long.parseLong(mileage));
		}
		if(!price.isEmpty()) {
			vehicle.setPrice(Double.parseDouble(price));
		}
		if(!engine.isEmpty()) {
			vehicle.setEngine(engine);
		}
		if(!description.isEmpty()) {
			vehicle.setDescription(description);
		}
		if(!location.isEmpty()) {
			vehicle.setLocation(location);
		}
		
		boolean imagesUpdated = false;
		
	    try {
	    Part filePart = request.getPart("replaceImage");

	    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
	    File uploadDir = new File(uploadPath);
	    if (!uploadDir.exists()) {
	        uploadDir.mkdir(); // Create the directory if it doesn't exist
	    }

	    byte[] imgData = null;

	    try (InputStream inputStream = filePart.getInputStream()) {
	        imgData = inputStream.readAllBytes();
	        
	        if(imgData.length != 0) {
	        
	        vehicle.getImages().set(0, imgData); //this replaces the first image if chosen so
	        imagesUpdated = true;
	        }
	        
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    }catch(NullPointerException e) {
	
	    	}
	    try {
		    Part filePart = request.getPart("newImage");

		    String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
		    File uploadDir = new File(uploadPath);
		    if (!uploadDir.exists()) {
		        uploadDir.mkdir(); // Create the directory if it doesn't exist
		    }

		    byte[] imgData = null;

		    try (InputStream inputStream = filePart.getInputStream()) {
		        imgData = inputStream.readAllBytes();
		        if(imgData.length != 0) {
		        vehicle.getImages().add(imgData); //this adds on to the existing images if chosen so
		        imagesUpdated = true;
		        }
		        
		    } catch (IOException e) {
		        e.printStackTrace();
		    }
		    }catch(NullPointerException e) {
		
		    	}
	    
	    Database connect = new Database();
	    
	    System.out.println(vehicle.getImages().size());
	    
	    connect.updateVehicle(vehicle,imagesUpdated);
	    request.getRequestDispatcher("allVehicles.jsp").forward(request, response);
		
	}

}
