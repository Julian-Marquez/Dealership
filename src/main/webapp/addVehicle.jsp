<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.*" %>
<!DOCTYPE html>
<html>
<head>
    <!-- Include existing head content (CSS, meta, fonts) -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Add Vehicle - Jorge's Dealership</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body>
<div class="header_section">
         <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <a class="navbar-brand"href="index.html"><img src="images/logo.png"></a>
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
                     <li class="nav-item">
                        <a class="nav-link" href="contact.html">Contact</a>
                     </li>
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
                  </form>
               </div>
            </nav>
         </div>
      </div>
<!-- Page Banner -->
<div class="banner_section layout_padding">
    <div class="container">
        <div class="row">
            <div class="col-md-12 text-center">
                <h1 class="banner_taital">Add a <span >New Vehicle</span></h1>
                <p class="banner_text">Fill out the form below to list a new vehicle in the system.</p>
            </div>
        </div>
    </div>
</div>

<!-- Add Vehicle Form -->
<div class="about_section layout_padding">
    <div class="container">
        <div class="about_section_2">
            <div class="row">
                <div class="col-md-12">
                    <form action="vehicleServlet" method="post" enctype="multipart/form-data">
                        <div class="form-group">
                            <label>Brand</label>
                            <input type="text" class="form-control" name="brand" required>
                        </div>
                        <div class="form-group">
                            <label>Model</label>
                            <input type="text" class="form-control" name="model" required>
                        </div>
                          <div class="form-group">
                            <label>Mileage</label>
                            <input type="number" min="0" step="0." class="form-control" name="mileage" required>
                        </div>
                        <div class="form-group">
                            <label>Price $</label>
                            <input type="number" min="100" step="0.00" class="form-control" name="price" required>
                        </div>
                        <div class="form-group">
                            <label>Engine</label>
                            <select class="form-control" name="engine" required>
                                <option value="">-- Select Engine Type --</option>
                                <option value="4 cylinder">4 cylinder</option>
                                <option value="V6">V6</option>
                                <option value="V8">V8</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Vehicle Model Year</label>
                            <input type="number" class="form-control" name="year" min="0" required>
                        </div>
                        <div class="form-group">
                            <label>Location</label>
                            <input type="text" class="form-control" name="location"  required>
                        </div>
                        <div class="form-group">
                            <label>Description</label>
                            <textarea class="form-control" name="description" rows="4" placeholder="Vehicle description (Include Damage if any)..." required></textarea>
                        </div>
                        <div class="form-group">
                            <label>Upload Vehicle Image</label>
                            <input type="file" class="form-control-file" name="file" accept="image/*" required>
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-warning">Add Vehicle</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
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
      <script src="js/custom.js"></script>
</body>
</html>
