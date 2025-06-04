<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.*" %>
<%

ServletContext context = request.getServletContext();

User user = (User) context.getAttribute("loggedinUser");


long code = 0;
try{
	
	code = (long) (context.getAttribute("code"));
	
}catch(NumberFormatException e){
			
	
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
               <a class="navbar-brand"href="index.html"><img src="images/logo2.png"></a>
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
      
         <div style="width: 70%; justify-content: center;"class="login-box" >
            <h2 class="login-title">Recover Profile</h2>
            <form action="Recovery" method="post">
            <%
            if(code == 0){
            %>
            
               <div class="form-group">
                  <label for="email">Email address</label>
                  <input type="email" class="form-control" id="email" name="email" required>
               </div>
               <%
            }else{
               %>
               <div class="form-group">
                  <label for="code">Recovery Code</label>
                  <input type="number" class="form-control" step="0" id="code" name="code"  required>
               </div>
               <% } %>
            <div style="text-align: center; width:100%;">
			<button class="cta">
			  <div class="arrow">
			    <div></div>
			  </div>
			  <span class="label">
			  <%  if(code == 0){
			  %>
			   Send Code
			   <%  }else{
			  %>
			  Submit Code
			  
			  <%} %>
			  </span>
			</button>
			</div>
            </form>
            <div class="text-center mt-3">
               <a href="register.jsp">Don't have an account? Sign up</a>
            </div>
              <div class="text-center mt-3">
               <a href="login.jsp">Login</a>
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
