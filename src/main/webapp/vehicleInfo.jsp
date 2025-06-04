<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="deal.*" %> <%@ page import="java.util.Base64" %> <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" referrerpolicy="no-referrer" />

      <meta name="viewport" content="initial-scale=1, maximum-scale=1">
      <title>Vehicle Information - Jorge's DealerShip</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link rel="stylesheet" href="css/responsive.css">
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">

<!-- Leaflet CSS -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
    <style>
  #map {
    height: 300px;
    width: 100%;
    margin-top: 20px;
    border-radius: 10px;
}
    </style>
   </head>
   <style> @import url('https://fonts.googleapis.com/css2?family=Righteous&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Lato:wght@300&display=swap');

body {
  /* solid background */
  background-image: url(https://images.unsplash.com/photo-1619204715997-1367fe5812f1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1889&q=80);
  background-size: cover;
  background-position: center;

  align-items: center;
  justify-content: center;

  height: 100vh;
  margin: 0;
}

.container {
  backdrop-filter: blur(16px) saturate(180%);
  -webkit-backdrop-filter: blur(16px) saturate(180%);
  background-color: rgba(17, 25, 40, 0.25);
  border-radius: 12px;
  border: 1px solid rgba(255, 255, 255, 0.125);  
  padding: 38px;  
  filter: drop-shadow(0 30px 10px rgba(0,0,0,0.125));
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content:center;
  text-align: center;
  
}

.wrapper {
  width: 100%;
  height: 100%;
    flex-direction: column;
  align-items: center;
  
}


h1{
  font-family: 'Righteous', sans-serif;
  color: rgba(255,255,255,0.98);
  text-transform: uppercase;
  font-size: 2.4rem;
}

p {
  color: #fff;
  font-family: 'Lato', sans-serif;
  text-align: center;
  font-size: 0.8rem;
  line-height: 150%;
  letter-spacing: 2px;
  text-transform: uppercase;
}

.button-wrapper {
  display: flex;
  gap: 15px;
  justify-content: center;
  margin-top: 18px;
}
   .btn {
            background-color: #fe5b29;
            border: none;
         }

.btn.fill {
  background: rgba(0, 212, 255, 0.8);
  color: #fe5b29;
  border: #fe5b29;
}

.btn.fill:hover {
  background: rgba(0, 212, 255, 1);
  transform: translateY(-2px) scale(1.05);
  box-shadow: black;
}

.btn.outline {
  background: black;
  color: #fe5b29;
  border: #fe5b29;
}

.btn.outline:hover {
  background: #fe5b29;
  color: #fff;
  transform: translateY(-2px) scale(1.05);
  border-color: rgba(0, 212, 255, 0.9);
}


.outline {
  background: transparent;
  color: rgba(0, 212, 255, 0.9);
  border: 1px solid rgba(0, 212, 255, 0.6);
  transition: all .3s ease;
  
}

.outline:hover{
  transform: scale(1.125);
  color: rgba(255, 255, 255, 0.9);
  border-color: rgba(255, 255, 255, 0.9);
  transition: all .3s ease;  
}

.fill {
  background: rgba(0, 212, 255, 0.9);
  color: rgba(255,255,255,0.95);
  filter: drop-shadow(0);
  font-weight: bold;
  transition: all .3s ease; 
}

.fill:hover{
  transform: scale(1.125);  
  border-color: rgba(255, 255, 255, 0.9);
  filter: drop-shadow(0 10px 5px rgba(0,0,0,0.125));
  transition: all .3s ease;    
}

.about_taital_box {
  background: white;
  padding: 20px;
  border-radius: 15px;
  text-align: center;
  max-width: 500px;
  margin: 0 auto;
  box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
  
}

.about_img {
  max-width: 550px;
  height: auto;
  display: block;
  margin: 0 auto 20px auto;
  border-radius: 12px;
}


</style>
   <body>

      <%
          // Retrieve the vehicle object from the request scope
          
          ServletContext context = request.getServletContext();
          Vehicle vehicle = (Vehicle) context.getAttribute("vehicle");

          User user = (User) context.getAttribute("loggedinUser");
          
          if (vehicle == null) {
        	  request.getRequestDispatcher("allVehicles.jsp").forward(request, response); 
          }
          
          String firstImage = Base64.getEncoder().encodeToString(vehicle.getImages().get(0));
      %>
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
                        <a class="nav-link" href="allVehicles.jsp">Vehicles</a>
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
               </div>
            </nav>
         </div>
      </div>
      
      <div class="call_text_main">
         <div class="container">
            <div class="call_taital">
               <div class="call_text"><a href="#"><i class="fa fa-map-marker" aria-hidden="true"></i><span id="vehicle-address" class="padding_left_15"><%= vehicle.getLocation() %></span></a></div>
               <div class="call_text"><a href="#"><i class="fa fa-phone" aria-hidden="true"></i><span class="padding_left_15"><%= vehicle.getOwner().getPhone() %></span></a></div>
               <div class="call_text"><a href="#"><i class="fa fa-envelope" aria-hidden="true"></i><span class="padding_left_15"><%= vehicle.getOwner().getEmail() %></span></a></div>
            </div>
         </div>
      </div>

         <div class="container">
         
                        <div class="wrapper">
                        
                     <div class="about_taital_box">
                       <%
    List<byte[]> images = vehicle.getImages();
    if (images.size() > 1) {
%>
<!-- Bootstrap Carousel -->
<div id="vehicleCarousel" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <%
        for (int i = 0; i < images.size(); i++) {
            String imgBase64 = Base64.getEncoder().encodeToString(images.get(i));
    %>
    <div class="carousel-item <%= (i == 0) ? "active" : "" %>">
      <img class="d-block w-100 about_img" src="data:image/jpeg;base64,<%= imgBase64 %>" alt="Vehicle Image <%= i + 1 %>">
    </div>
    <% } %>
  </div>
  <a class="carousel-control-prev" href="#vehicleCarousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#vehicleCarousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

<%
    } else {
        String singleImg = Base64.getEncoder().encodeToString(images.get(0));
%>
    <img class="about_img" src="data:image/jpeg;base64,<%= singleImg %>" alt="<%= vehicle.getBrand() %> <%= vehicle.getModel() %>">
<%
    }
%>

                  
                        <h1 class="about_taital"><%= vehicle.getYear() %> <span style="color: #fe5b29;"><%= vehicle.getBrand() %></span> <%= vehicle.getModel() %></h1>
   
    <strong><i class="fas fa-dollar-sign"></i> Price:</strong> $<%= vehicle.getPrice() %><br>
    <strong><i class="fas fa-tachometer-alt"></i> Mileage:</strong> <%= vehicle.getMileage() %> miles<br>
    <strong><i class="fas fa-map-marker-alt"></i> Location:</strong> <%= vehicle.getLocation() %><br>
    <strong><i class="fas fa-cogs"></i> Engine:</strong> <%= vehicle.getEngine() %><br>
    <strong><i class="fas fa-user"></i> Owner:</strong> <%= vehicle.getOwner().getFirstName() %> <%= vehicle.getOwner().getLastName() %><br>
    <strong><i class="fas fa-calendar-check"></i> Date Posted:</strong> <%= vehicle.getDatePosted() %><br>
    <strong><i class="fas fa-phone-alt"></i> Contact:</strong> <%= vehicle.getOwner().getPhone() %><br>

 <div id="map" ></div>

                        <p style="color: gray;"><%=vehicle.getDescription()%></p>
                        <div class="row">
                        <form action="handleVehicles" method='get'>
                        <input type="hidden" name="id" value="<%= vehicle.getVehicleId() %>">
                          <% if (user != null && !user.getSavedVehicles().isEmpty()){
    		for(int i = 0; i < user.getSavedVehicles().size(); i++){
    			if(user.getSavedVehicles().get(i).getVehicleId() == vehicle.getVehicleId()){
    %>
 
    <button name="action" value="remove" class="btn outline">- Remove</button>
    <%
    break;
    			}else{	%>
                        <button name="action" value="add" class="btn outline" type="submit" >+ Watch List</button>
                        
                        <% 
                        break;
    			}
    		}
                          }	
                          else if (user != null){	%>
                        	  
                        	 <button name="action" value="add" class="btn outline" type="submit" >+ Watch List</button>  
                        	  
                    <%       }
                          %>
                          </form>
                          </div>
                          
                          <% 
                        if(user != null && user.isAdmin()){
                        	%>
                        	<form action="vehicleServlet" method='get'>
                        	<div style="color: #fe5b29;"  class="row">
                        <a class="btn outline" href="editVehicle.jsp" >Edit</a>
                        <button type="submit" class="btn outline" name="action" value="delete" >Delete</button>
                        </div>
                        </form>
                    <%    }
                        %>
                        </div>
                     </div>
                     </div>
                    
      
      <div class="footer_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="footeer_logo"><img src="images/logo.png"></div>
               </div>
            </div>
            <div class="footer_section_2">

               <div class="col-sm-12">
                  <p class="copyright_text">2025 All Rights Reserved</p>
               </div>
            </div>
         </div>
      </div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<script>
$(document).ready(function() {
    var address = $('#vehicle-address').text();

    let geocodeUrl = 'https://nominatim.openstreetmap.org/search?format=json&q=' + encodeURIComponent(address);

    $.getJSON(geocodeUrl, function(data) {
        if (data.length > 0) {
            var lat = data[0].lat;
            var lon = data[0].lon;

            var map = L.map('map').setView([lat, lon], 13);

            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
            }).addTo(map);

            L.marker([lat, lon]).addTo(map)
                .bindPopup('<b><%= vehicle.getBrand() %> <%= vehicle.getModel() %></b>')
                .openPopup();
        } else {
            alert('Geocoding failed');
        }
    });
});
</script>


      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
   </body>
</html>