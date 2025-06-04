<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="deal.*" %> <%@ page import="java.util.Base64" %>
    <%
    ServletContext context = request.getServletContext();
    
    User user = (User) context.getAttribute("loggedinUser");
    
    
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
      <title>Jorge's DealerShip</title>
      <meta name="keywords" content="">
      <meta name="description" content="">
      <meta name="author" content="">
      <!-- bootstrap css -->
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <!-- style css -->
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <!-- Responsive-->
      <link rel="stylesheet" href="css/responsive.css">
      <!-- fevicon -->
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <!-- font css -->
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
      <!-- Scrollbar Custom CSS -->
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      
      <link rel="stylesheet" href="css/buttons.css">
      <!-- Tweaks for older IEs-->
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   </head>
   <body>
      <!-- header section start -->
      <div class="header_section">
         <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <a class="navbar-brand"href="index.jsp"><img src="images/logo.png"></a>
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
                  <form class="form-inline my-2 my-lg-0">
                  </form>
               </div>
            </nav>
         </div>
      </div>
      <!-- header section end -->
      <div class="call_text_main">
         <div class="container">
         </div>
      </div>
      <!-- banner section start --> 
      <div class="banner_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-md-6">
                  <div id="banner_slider" class="carousel slide" data-ride="carousel">
                     <div class="carousel-inner">
                        <div class="carousel-item active">
                           <div class="banner_taital_main">
                              <h1 class="banner_taital">Car Rent <br><span style="color: #fe5b29;">For You</span></h1>
                              <p class="banner_text">Affordable, reliable, and ready when you are — rent the perfect car for your journey today.</p>

                            
                           </div>
                        </div>
                        <%if(user == null){ %>
                        <div class="carousel-item">
                           <div class="banner_taital_main">
                              <h1 class="banner_taital">Start<br><span style="color: #fe5b29;">By Signing In</span></h1>
                              <div class="btn_main">
                                 <div class="contact_bt"><a href="register.jsp">Sign Up</a></div>
                                 <div class="contact_bt active"><a href="login.jsp">Login</a></div>
                              </div>
                           </div>
                        </div>
                        <%} %>
                        <div class="carousel-item">
                           <div class="banner_taital_main">
                              <h1 class="banner_taital">Get<br><span style="color: #fe5b29;">Pre Approved</span></h1>
                            <p class="banner_text">Fast and easy financing — get pre-approved today and drive away with confidence!</p>

                             
                           </div>
                        </div>
                     </div>
                     <a class="carousel-control-prev" href="#banner_slider" role="button" data-slide="prev">
                        <i class="fa fa-angle-left"></i>
                     </a>
                     <a class="carousel-control-next" href="#banner_slider" role="button" data-slide="next">
                        <i class="fa fa-angle-right"></i>
                     </a>
                  </div>
               </div>
               <div class="col-md-6">
                  <div class="banner_img"><img src="images/banner-img.png"></div>
               </div>
            </div>
         </div>
      </div>
      <!-- banner section end -->
      <!-- about section start -->
      <div class="about_section layout_padding">
         <div class="container">
            <div class="about_section_2">
               <div class="row">
                  <div class="col-md-6"> 
                     <div class="image_iman"><img src="images/about-img.png" class="about_img"></div>
                  </div>
                  <div class="col-md-6"> 
                     <div class="about_taital_box">
                        <h1 class="about_taital">About <span style="color: #fe5b29;">Us</span></h1>
                        <p class="about_text">At Jorge's Dealership, we believe in more than just buying and selling vehicles — we believe in building trust and community. Our platform is designed to offer a seamless and secure way for users to browse, save, and manage their favorite vehicles, while giving sellers and admins the tools they need to keep listings fresh and accurate. Whether you're looking to upgrade your ride, manage your profile, or explore unique vehicles, Jorge's Dealership is your go-to destination. With user-focused features like personalized profiles, secure account management, and integrated image support, we’re here to make your vehicle experience smooth, reliable, and enjoyable.</p>
                      
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- about section end -->
      <div class="search_section">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="search_taital">Search Your Best Cars</h1>
                  <div class="container">
                     <div class="select_box_section">
                        <div class="select_box_main">
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
                  <h1 class="gallery_taital">Vehicles to Get You Started</h1>
               </div>
            </div>
            <%
            Database connect = new Database();
            
            Vehicle vehicle1 = null;
            Vehicle vehicle2 = null;
            Vehicle vehicle3 = null;
            String vehicleImage1 = "";
            String vehicleImage2 = "";
            String vehicleImage3 = "";
            try{
            	if(connect.getAllVehicles().size() > 3){
            		vehicle1 = connect.getAllVehicles().get(0);
            		vehicle2 = connect.getAllVehicles().get(1);
            		vehicle3 = connect.getAllVehicles().get(2);
            		vehicleImage1 = Base64.getEncoder().encodeToString(vehicle1.getImages().get(0));
            		vehicleImage2 = Base64.getEncoder().encodeToString(vehicle2.getImages().get(0));
            		vehicleImage3 = Base64.getEncoder().encodeToString(vehicle3.getImages().get(0));
            		
            	}
            	
            }catch(NullPointerException e){
            	
            }catch(IndexOutOfBoundsException e){
            	
            }
            if(vehicle1 != null){
            %>
            <div class="gallery_section_2">
              <form action="handleVehicles" method="get">
              <input name="action" value="view" type="hidden">
               <div class="row">
                  <div   class="col-md-4">
                     <div style="background-color:gray;" class="gallery_box">
                        <div  class="gallery_img"><img src="data:image/jpeg;base64,<%= vehicleImage1 %>"></div>
                        <h3 class="types_text"><%= vehicle1.getBrand() %> <%= vehicle1.getModel() %></h3>
                          <p class="looking_text"><%= vehicle1.getMileage() %></p>
                           <button name="id" value="<%= vehicle1.getVehicleId() %>" class="cta">
			  <div class="arrow">
			    <div></div>
			  </div>
			  <span class="label">
			   View
			  </span>
                     </div>
                  </div>
                  <div   class="col-md-4">
                      <div style="background-color:gray;" class="gallery_box">
                        <div class="gallery_img"><img src="data:image/jpeg;base64,<%= vehicleImage2 %>"></div>
                        <h3 class="types_text"><%= vehicle2.getBrand() %> <%= vehicle2.getModel() %></h3>
                          <p class="looking_text"><%= vehicle2.getMileage() %></p>
                           <button name="id" value="<%= vehicle2.getVehicleId() %>" class="cta">
			  <div class="arrow">
			    <div></div>
			  </div>
			  <span class="label">
			   View
			  </span>
                     </div>
                  </div>
                  <div class="col-md-4">
                      <div style="background-color:gray;" class="gallery_box">
                        <div class="gallery_img"><img src="data:image/jpeg;base64,<%= vehicleImage3 %>"></div>
                        <h3 class="types_text"><%= vehicle3.getBrand() %> <%= vehicle3.getModel() %></h3>
                          <p class="looking_text"><%= vehicle3.getMileage() %></p>
                          <button name="id" value="<%= vehicle3.getVehicleId() %>" class="cta">
			  <div class="arrow">
			    <div></div>
			  </div>
			  <span class="label">
			   View
			  </span>
			</button>
                     </div>
                  </div>
               </div>
               </form>
            </div>
         </div>
      </div>
      <%} %>
      <!-- gallery section end -->
      <!-- choose section start -->
      <div class="choose_section layout_padding">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <h1 class="choose_taital">WHY CHOOSE US</h1>
               </div>
            </div>
            <div class="choose_section_2">
               <div class="row">
                  <div class="col-sm-4">
                     <div class="icon_1"><img src="images/icon-1.png"></div>
                     <h4 class="safety_text">Great Quality</h4>
                     <p class="ipsum_text">variations of vehicles with great quality and pricing suited for anyone</p>
                  </div>
                  <div class="col-sm-4">
                     <div class="icon_1"><img src="images/icon-2.png"></div>
                     <h4 class="safety_text">Local </h4>
                     <p class="ipsum_text">Local and convenient for everyone in the Albuquerque Area</p>
                  </div>
                  <div class="col-sm-4">
                     <div class="icon_1"><img src="images/icon-3.png"></div>
                     <h4 class="safety_text">Best Drivers</h4>
                     <p class="ipsum_text">variations of passages of Lorem Ipsum available, but the majority have </p>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- choose section end -->
      <!-- client section start -->
      
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