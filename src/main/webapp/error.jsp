<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <title>Error - Turbo Motors</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">
   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/responsive.css">
   <link rel="stylesheet" href="css/buttons.css">
   <link rel="icon" href="images/fevicon.png" type="image/gif" />
   <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
   <style>
      .error-container {
         text-align: center;
         margin-top: 100px;
      }
      .error-title {
         font-size: 42px;
         color: #fe5b29;
         font-weight: bold;
      }
      .error-message {
         font-size: 20px;
         color: #333;
         margin-top: 20px;
         margin-bottom: 30px;
      }
      .btn-orange {
         background-color: #fe5b29;
         color: white;
         border: none;
         padding: 10px 20px;
         font-size: 16px;
         border-radius: 5px;
         text-decoration: none;
         transition: background-color 0.3s ease;
      }
      .btn-orange:hover {
         background-color: #e34c1b;
      }
   </style>
</head>
<body>

<!-- Header -->
<div style="width: 100%; background-color: #0e0c06;">
   <div class="container">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
         <a class="navbar-brand" href="index.jsp"><img src="images/logo2.png"></a>
         <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
         </button>
         <div class="collapse navbar-collapse" id="navbarNav">
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

<!-- Error Message -->
<div class="container error-container">
   <div class="error-title">Oops! Something went wrong.</div>
   <div class="error-message">We couldn't process your request. Please try again later or contact support.</div>
   <a href="index.jsp" class="btn-orange">Return Home</a>
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
