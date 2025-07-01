<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.*" %><%@ page import="java.util.Base64" %> 

<%
ServletContext context = request.getServletContext();

User user = (User) context.getAttribute("loggedinUser");

String profilePic = Base64.getEncoder().encodeToString(user.getProfilePic());

%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Editing <%= user.getFirstName() %> <%= user.getLastName() %></title>
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link rel="stylesheet" href="css/responsive.css">
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
      <style>
         .login-box {
            background: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 500px;
            margin: 80px auto;
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
         .btn-login {
            background-color: #fe5b29;
            border: none;
         }
      </style>
       <style>
        .profile-container {
            margin-top: 80px;
            display: flex;
            justify-content: center;
        }

        .profile-card {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 30px;
            max-width: 500px;
            width: 100%;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }

        .profile-header {
            text-align: center;
            margin-bottom: 25px;
        }

        .profile-header h2 {
            color: #fe5b29;
            font-weight: bold;
        }

        .profile-pic {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
            border: 3px solid #fe5b29;
        }

        .profile-info {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .profile-info-item {
            display: flex;
            justify-content: space-between;
            font-size: 16px;
        }

        .profile-info-item span.label {
            font-weight: 600;
            color: #333;
        }

        .profile-info-item span.value {
            color: #555;
        }

        .profile-actions {
            text-align: center;
            margin-top: 30px;
        }

        .profile-actions .btn {
            margin: 0 10px;
        }
    </style>
   </head>
   <body>
      <!-- Login Form -->
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
                        <a class="nav-link" href="gallery.html">Vehicles</a>
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
         <div class="login-box">
              <div class="container">
      <div class="profile-header">
            <img src="data:image/jpeg;base64,<%= profilePic %>" 
                 alt="Profile Picture" class="profile-pic">
            
        </div>
            <h2 class="login-title">Edit Profile</h2>
            <form action="handleAccount" method="post"  enctype="multipart/form-data">
            <div class="form-group">
                  <label for="usr">Username</label>
                  <input type="text" class="form-control" id="usr" name="username" placeholder="<%= user.getUsername() %>" >
               </div>
                <div class="form-group">
                  <label for="fname">First Name</label>
                  <input type="text" class="form-control" id="fname" name="fname" placeholder="<%= user.getFirstName() %>">
               </div>
                <div class="form-group">
                  <label for="lname">Last Name</label>
                  <input type="text" class="form-control" id="lname" name="lname" placeholder="<%= user.getLastName() %>">
               </div>
               <div class="form-group">
                  <label for="email">Email address</label>
                  <input type="email" class="form-control" id="email" name="email" placeholder="<%= user.getEmail() %>">
               </div>
               <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" id="password" name="password">
               </div>
                 <div class="form-group">
                  <label for="confirm">Confirm Password</label>
                  <input type="password" class="form-control" id="confirm" name="ConfirmPassword" >
               </div>
                  <div class="form-group">
                  <label for="phone">Phone Number</label>
                  <input type="text" class="form-control" id="phone" name="phone" placeholder="<%= user.getPhone() %>">
               </div>
                <div class="form-group">
                  <label for="image">Profile Picture (Optional)</label>
                  <input type="file" class="form-control" id="image" name="file" accept="image" >
               </div>
               <button onclick="validate(event)" type="submit" class="btn btn-login btn-block text-white">Confirm Edits</button>
            </form>
            <div class="text-center mt-3">
               <a href="profile.jsp">Cancel</a>
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
      <script src="js/script.js"></script>
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
   </body>
</html>
