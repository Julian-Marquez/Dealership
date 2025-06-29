<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.*" %>
<%
ServletContext context = request.getServletContext();
%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Application Submitted - Turbo Motors</title>
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link rel="stylesheet" href="css/responsive.css">
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <style>
         .success-box {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 80px auto;
            text-align: center;
         }

         .success-box h2 {
            color: #fe5b29;
            margin-bottom: 20px;
         }

         .success-box p {
            margin-bottom: 30px;
            font-size: 16px;
         }

         .btn-option {
            background-color: #fe5b29;
            color: white;
            padding: 10px 25px;
            border: none;
            border-radius: 5px;
            margin: 10px;
            font-size: 16px;
            text-decoration: none;
            display: inline-block;
         }

         .btn-option:hover {
            background-color: #e04d1f;
            color: #fff;
         }
      </style>
   </head>
   <body>
      <!-- Header Start -->
      <div style="width: 100%; float: top; background-color: #0e0c06;">
         <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <a class="navbar-brand" href="index.jsp"><img src="images/logo2.png"></a>
               <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                  aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
               <span class="navbar-toggler-icon"></span>
               </button>
               <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav ml-auto">
                     <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                     <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
                     <li class="nav-item"><a class="nav-link" href="allVehicles.jsp">Vehicles</a></li>
                     <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                  </ul>
               </div>
            </nav>
         </div>
      </div>
      <!-- Header End -->

      <div class="container">
         <div class="success-box">
            <h2>Application Submitted Successfully!</h2>
            <p>Your financing application has been received and emailed successfully.</p>
            <a href="applying.jsp" class="btn-option">Write Another Application</a>
            <a href="index.jsp" class="btn-option">Return Home</a>
         </div>
      </div>

      <!-- Footer -->
      <div class="copyright_section">
         <div class="container">
            <div class="row">
               <div class="col-sm-12">
                  <p class="copyright_text">2025 All Rights Reserved</p>
               </div>
            </div>
         </div>
      </div>
      <!-- Scripts -->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/script.js"></script>
   </body>
</html>
