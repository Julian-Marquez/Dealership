<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="java.util.stream.*" %>
<%@ page import="deal.*" %>
<%@ page import="java.util.Base64" %>

<%

ServletContext context = request.getServletContext();

User user = (User) context.getAttribute("loggedinUser");

context.removeAttribute("vehicle");

Database connect = new Database();

List<Vehicle> allVehicles = new ArrayList<>();

try{
	
	allVehicles = connect.getAllVehicles();

}catch(NullPointerException e){
	
}


%>

<!DOCTYPE html>
<html>
   <head>
      <!-- basic -->
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!-- mobile metas -->
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <!-- site metas -->
      <title>Trator</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/buttons.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- font css -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
            <script src="js/script.js"></script>
   </head>
   <body>
    <div class="header_section">
         <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <a class="navbar-brand"href="index.jsp"><img src="images/logo2.png"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="gallery.jsp">Vehicles</a>
                     </li>
                    <% if(user != null){ %>
                          <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">Profile</a>
                     </li>
                  <%  } else{ %>
                   

                     <li class="nav-item">
                        <a class="nav-link" href="login.jsp">login</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="register.jsp">Sign Up</a>
                     </li>
                     <%  } %>
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
                  </form>
               </div>
            </nav>
         </div>
      </div>
      
<style>
/* Smaller, more compact select box with modern look */
.custom-select select {
  background-color: #fff;
  border: 2px solid #fe5b29;
  border-radius: 8px;
  padding: 8px 12px;
  padding-right: 80px;
  font-family: 'Poppins', sans-serif;
  font-size: 14px;
  color: #333;
  box-shadow: 0px 2px 5px rgba(0,0,0,0.1);
  transition: border 0.3s ease, box-shadow 0.3s ease;
  width: auto;
  max-width: 250px;
}

.custom-select select:focus {
  border-color: #fe5b29;
  outline: none;
  box-shadow: 0 0 0 3px rgba(254, 91, 41, 0.3);
}

.custom-select {
  margin-bottom: 15px;
}

@import 'nib'

.search-btn {
  margin: 0;
  background: transparent;
  display: flex;
  align-items: stretch;
  width: 100%;
}

.search-btn button {
  background-color: white;
  border: 0;
  outline: none;
  padding: 8px 12px;
  font-size: 1rem;
  font-family: monospace;
  box-shadow: 0px 5px 10px rgba(0, 67, 134, 0.5);
  transition: all 0.3s;
  cursor: pointer;
  border-radius: 5px;
  border-bottom: 4px solid #b3b3b3;
  width: 100%;
  height: 100%; /* Important to match the column height */
}
.search-btn button:hover {
  box-shadow: 0px 15px 25px -5px rgba(30, 144, 255, 0.5);
  transform: scale(1.03);
}
.search-btn button:active {
  box-shadow: 0px 4px 8px rgba(0, 80, 170, 0.5);
  transform: scale(0.98);
}

</style>

      <!-- about section end -->
      <div class="search_section">
         <div class="container">
            <div class="row">
   <div class="col-md-3 mb-2">
      <select class="custom-select" id="brandDrop" name="brand">
         <option value="" disabled selected>Any Brand</option>
         <% 
         if(!allVehicles.isEmpty()){
            HashSet<String> uniqueBrands = new HashSet<>();
            for (Vehicle v : allVehicles) {
               String brand = v.getBrand();
               if (uniqueBrands.add(brand)) {
         %>
               <option value="<%= brand %>"><%= brand %></option>
         <% 
               }
            }
            }
         %>
      </select>
   </div>
   <div class="col-md-3 mb-2">
      <select class="custom-select" id="modelDrop">
         <option value="">Any type</option>
      </select>
   </div>
   <div class="col-md-3 mb-2">
      <select class="custom-select" id="priceFilter">
         <option value="" disabled selected>Price</option>
      </select>
   </div>
   <div class="col-md-3 mb-2 d-flex align-items-center">
      <div class="search-btn">
         <button id="searchBtn" class="w-100">Search Now</button>
      </div>
   </div>
</div>

         </div>
      </div>
      
      
      <!-- gallery section start -->
      <div class="gallery_section layout_padding">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h1 class="gallery_taital">Our best offers</h1>
      </div>
    </div>

    <div id="" class="gallery_section_2">
      <%

        int count = 0;

        if (!allVehicles.isEmpty()) {
          for (Vehicle car : allVehicles) {
            String vehicleImage = Base64.getEncoder().encodeToString(car.getImages().get(0));

            if (count % 3 == 0) {
      %>
              <div class="row my-4">
      <%
            }

      %>
                <div  class="col-md-4" data-mileage="<%= car.getMileage() %>" data-brand="<%= car.getBrand()%>" data-model="<%= car.getModel()%>" data-image="<%= vehicleImage %>" data-price="<%= car.getPrice() %>" data-id="<%= car.getVehicleId() %>">
                  <div style="color: black; background-color: #fe5b29;"  class="gallery_box vehicle-card" >
                    <div class="gallery_img">
                      <img src="data:image/jpeg;base64,<%= vehicleImage %>">
                    </div>
                    <h3  class="types_text"><%= car.getBrand() %> <%= car.getModel() %></h3>
                    <p  id="mileage" style="color: gray;"class="looking_text">Mileage: <%= car.getMileage() %></p>
                    <h4 id="price" class="types_text">Price $<%= car.getPrice() %></h4>
                   <div class="row">
                   
 <form action="handleVehicles" method="get" style="margin-bottom: 10px;">
  <input type="hidden" name="id" value="<%= car.getVehicleId() %>" />
  
  <button type="submit" name="action" value="view" class="cta">
    <div class="arrow"><div></div></div>
    <span class="label">View</span>
  </button>

  <%
    boolean isSaved = false;
    if (user != null && user.getSavedVehicles() != null) {
        for (Vehicle v : user.getSavedVehicles()) {
            if (v.getVehicleId() == car.getVehicleId()) {
                isSaved = true;
                break;
            }
        }
    }

    if (user != null) {
        if (isSaved) {
  %>
            <button name="action" value="remove" class="icon-btn add-btn">
              <div class="btn-txt">Remove</div>
            </button>
  <%
        } else {
  %>
            <button name="action" value="add" class="icon-btn add-btn">
              <div class="add-icon"></div>
              <div class="btn-txt">Add To List</div>
            </button>
  <%
        }
    }
  %>
</form>

</div>
  <% if (user != null && user.isAdmin()) { %>
  <div class="row">
  <form action="vehicleServlet" method="get" style="display: flex; gap: 8px; flex-wrap: wrap; justify-content: flex-start;">
    <input type="hidden" name="vehicleId" value="<%= car.getVehicleId() %>">
    <button type="submit" name="action" value="delete" class="cta">
      <div class="arrow"><div></div></div>
      <span class="label">Delete</span>
    </button>
    <button type="submit" name="action" value="edit" class="cta">
      <div class="arrow"><div></div></div>
      <span class="label">Edit</span>
    </button>
  </form>
  </div>
  <% } %>


                  </div>
                </div>
      <%
            count++;
            if (count % 3 == 0) {
      %>
              </div> <!-- end of row -->
      <%
            }
          } // end for

          if (count % 3 != 0) {
      %>
            </div> <!-- close the last open row if not closed -->
      <%
          }
        } else {
          if (user != null && user.isAdmin()) {
      %>
            <div class="row">
              <div class="col-md-4">
                <div class="gallery_box">
                  <h3 class="types_text">Add a Vehicle</h3>
                  <div class="read_bt"><a href="addVehicle.jsp">Add vehicle</a></div>
                </div>
              </div>
            </div>
      <%
          } else {
      %>
            <div class="row">
              <div class="col-md-4">
                <div class="gallery_box">
                  <h1 class="types_text">No Vehicles</h1>
                </div>
              </div>
            </div>
      <%
          }
        }
      %>
    </div>
  </div>
      <!-- footer section start -->
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="footeer_logo"><img src="images/logo.png"></div>
               </div>
            </div>
            <div class="footer_section_2">
            
            </div>
         </div>
      </div>
      <!-- footer section end -->
      <!-- copyright section start -->
      <div class="copyright_section">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <p class="copyright_text">2025 All Rights Reserved</p>
               </div>
            </div>
         </div>
      </div>
      <!-- copyright section end -->
      <!-- Javascript files-->

      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
   
   </body>
</html>