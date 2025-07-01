<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.*" %>
<%@ page import="java.time.*" %>
<%@ page import="deal.*" %>
<%@ page import="java.util.Base64" %>

<%

ServletContext context = request.getServletContext();

User user = (User) context.getAttribute("loggedinUser");

context.removeAttribute("vehicle");

List<Vehicle> allVehicles = new ArrayList<Vehicle>();

try{
	
	allVehicles = user.getSavedVehicles();
	
}catch(NullPointerException e){
	
	request.getRequestDispatcher("profile.jsp").forward(request, response); 
	
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
   </head>
   <body>
    <div class="header_section">
         <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <a class="navbar-brand"href="index.html"><img src="images/logo2.png"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item">
                        <a class="nav-link" href="index.html">Home</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="about.html">About</a>
                     </li>
                     <li class="nav-item">
                        <a class="nav-link" href="services.html">Services</a>
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
                  <form class="form-inline my-2 my-lg-0">
                  </form>
               </div>
            </nav>
         </div>
      </div>
      <!-- about section end -->
      <div class="search_section">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="search_taital"><%= user.getFirstName() %>'s List</h1>
                  <p class="search_text">All Saved Cars will Be displayed here.</p>
                  <!-- select box section start -->
                  <div class="container">
                     <div class="select_box_section">
                        <div class="select_box_main">
                           <div class="row">
                              <div class="col-md-3 select-outline">
                                 <select class="mdb-select md-form md-outline colorful-select dropdown-primary">
                                    <option value="" disabled selected>Any Brand</option>
                                    <option value="1">Option 1</option>
                                    <option value="2">Option 2</option>
                                    <option value="3">Option 3</option>
                                 </select>
                              </div>
                              <div class="col-md-3 select-outline">
                                 <select class="mdb-select md-form md-outline colorful-select dropdown-primary">
                                    <option value="" disabled selected>Any type</option>
                                    <option value="1">Option 1</option>
                                    <option value="2">Option 2</option>
                                    <option value="3">Option 3</option>
                                 </select>
                              </div>
                              <div class="col-md-3 select-outline">
                                 <select class="mdb-select md-form md-outline colorful-select dropdown-primary">
                                    <option value="" disabled selected>Price</option>
                                    <option value="1">Option 1</option>
                                    <option value="2">Option 2</option>
                                    <option value="3">Option 3</option>
                                 </select>
                              </div>
                              <div class="col-md-3">
                                 <div class="search_btn"><a href="#">Search Now</a></div>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- select box section end -->
               </div>
            </div>
         </div>
      </div>
      <!-- gallery section start -->
      <div class="gallery_section layout_padding">
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <h1 class="gallery_taital">Saved Vehicles</h1>
      </div>
    </div>

    <div  class="gallery_section_2">
      <%
        Database connect = new Database();
     
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
                <div  class="col-md-4">
                  <div style="color: black; background-color: #fe5b29;" class="gallery_box">
                    <div class="gallery_img">
                      <img src="data:image/jpeg;base64,<%= vehicleImage %>">
                    </div>
                    <h3 class="types_text"><%= car.getBrand() %> <%= car.getModel() %></h3>
                    <p style="color: gray;"class="looking_text">Mileage: <%= car.getMileage() %></p>
                    <h4 class="types_text">Price $<%= car.getPrice() %></h4>
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

      
      <!-- gallery section end -->
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
      <script src="js/custom.js"></script>
   </body>
</html>