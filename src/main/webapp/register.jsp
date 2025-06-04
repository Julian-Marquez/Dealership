<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.*" %>
<%

ServletContext context = request.getServletContext();

boolean showMeassage = false;

try{
	if(((boolean) context.getAttribute("message"))){
		%>
		<script>
		alert("That email is alredy in use");
		
		
		</script>
		
<% 		
context.removeAttribute("message");
	}
	
}catch(NullPointerException e){
	
}

%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Login - Jorge's DealerShip</title>
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link rel="stylesheet" href="css/responsive.css">
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <link rel="stylesheet" href="css/buttons.css">
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
   .login-box {
   background: #fff;
   padding: 40px;
   border-radius: 10px;
   box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
   max-width: 500px;
   margin: 80px auto; /* ⛔ this is pushing the box DOWN */
}

         .login-title {
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 20px;
            text-align: center;
            color: #fe5b29;
         }
         .form-group label {
            font-weight: 600;
         }
         .btn{
            background-color: #fe5b29;
            border: none;
         }
     
  
      </style>
   </head>
   <body>
           <div   style="width: 100%;
    float: top;
    background-color: #0e0c06;
 
    ">
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
                     <li class="nav-item">
                        <a class="nav-link" href="login.jsp">login</a>
                     </li>
                  </ul>
               </div>
            </nav>
         </div>
         </div>
      <!-- Login Form -->
      <div class="container">
         <div class="login-box">
            <h2 class="login-title">Register</h2>
            <form action="Accounts" method="post"  enctype="multipart/form-data">
            <div class="form-group">
                  <label for="usr">Username</label>
                  <input type="text" class="form-control" id="usr" name="username" required>
               </div>
                <div class="form-group">
                  <label for="fname">First Name</label>
                  <input type="text" class="form-control" id="fname" name="fname" required>
               </div>
                <div class="form-group">
                  <label for="lname">Last Name</label>
                  <input type="text" class="form-control" id="lname" name="lname" required>
               </div>
               <div class="form-group">
                  <label for="email">Email address</label>
                  <input type="email" class="form-control" id="email" name="email" required>
               </div>
               <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" id="password" name="password" required>
               </div>
                 <div class="form-group">
                  <label for="confirm">Confirm Password</label>
                  <input type="password" class="form-control" id="confirm" name="ConfirmPassword" required>
               </div>
                  <div class="form-group">
                  <label for="phone">Phone Number (Optional)</label>
                  <input type="text" class="form-control" id="phone" name="phone" required>
               </div>
                <div class="form-group">
                  <label for="image">Profile Picture </label>
                  <input type="file" class="form-control" id="image" name="file" accept="image" >
               </div>
               <button onclick="validate(event)" type="submit" class="btn btn-login btn-block text-white">Submit</button>
            </form>
            <div class="text-center mt-3">
               <a href="login.jsp">Login</a>
            </div>
         </div>
      </div>
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
      <script src="js/script.js"></script>
   </body>
</html>
