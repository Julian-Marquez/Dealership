<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.User" %><%@ page import="java.util.Base64" %> 
<%

ServletContext context = request.getServletContext();
    User currentUser = (User) context.getAttribute("loggedinUser");
    if (currentUser == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    
    String profilePic = Base64.getEncoder().encodeToString(currentUser.getProfilePic());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Profile - Jorge's Dealership</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/profileButtons.css">
    <link rel="icon" href="images/fevicon.png" type="image/gif" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">

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
                    <% if(currentUser != null){ %>
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
<!-- Profile Body -->
<div  class="container profile-container">
<form action="handleAccount" method="get">
    <div  class="profile-card">
        <div class="profile-header">
            <img src="data:image/jpeg;base64,<%= profilePic %>" 
                 alt="Profile Picture" class="profile-pic">
            <h2 style="color: black;">Your Profile</h2>
        </div>

        <div class="profile-info">
            <div class="profile-info-item">
                <span class="label">Full Name:</span>
                <span class="value"><%= currentUser.getFirstName() %> <%= currentUser.getLastName() %></span>
            </div>
            <div class="profile-info-item">
                <span class="label">Email:</span>
                <span class="value"><%= currentUser.getEmail() %></span>
            </div>
            <div class="profile-info-item">
                <span class="label">Phone:</span>
                <span class="value"><%= currentUser.getPhone() %></span>
            </div>
        </div>

        <div class="profile-actions">
       <div class="buttons">
        	<a href="editProfile.jsp" class="btn btn-warning">Edit Account</a>
        	
            <button name="action" value="delete" class="fill">Delete</button>
            <button name="action" value="logout" class="slide">Logout</button>
            
            <div class="profile-actions">
            <a href="userVehicles.jsp" class="raise">Saved Vehicles</a>
            <% if(currentUser.isAdmin()){ %>
            	<a href="addVehicle.jsp" class="up">+ Add Vehicle</a>
            	
           <% 	}
            	
            	%>
            	</div>
            </div>
        </div>
    </div>
    </form>
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
<!-- Scripts -->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
