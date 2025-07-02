<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.*" %><%@ page import="java.util.*" %>
<%
ServletContext context = request.getServletContext();

User user = null;
Database connect = new Database();
String firstName = "placeholder=\"Enter First Name\"";
String lastName = "placeholder=\"Enter Last Name\"";
String email = "placeholder=\"Enter Full Email\"";
String phoneNum = "placeholder=\"Enter Phone Number\"";

try {
    user = (User) context.getAttribute("loggedinUser");
    if (user != null) {
        firstName = "value=\"" + user.getFirstName() + "\"";
        lastName = "value=\"" + user.getLastName() + "\"";
        email = "value=\"" + user.getEmail() + "\"";
        phoneNum = "value=\"" + user.getPhone() + "\"";
    }
} catch (Exception e) {
    // Optional: log or handle error
}

List<Vehicle> allVehicles = null;

try{

 allVehicles = connect.getAllVehicles();
	
}catch(NullPointerException e){
	
}catch(IndexOutOfBoundsException w){
	
}


%>

<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>Applying For Finacing</title>
      <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
      <link rel="stylesheet" type="text/css" href="css/style.css">
      <link rel="stylesheet" href="css/responsive.css">
      <link rel="icon" href="images/fevicon.png" type="image/gif" />
      <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700&family=Raleway:wght@400;500;600;700;800&display=swap" rel="stylesheet">
      <link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css">
      <link rel="stylesheet" href="css/buttons.css">
      <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
	  <script src="js/jquery.min.js"></script>
	

	  
<style>
  * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
  }

  body {
    background-color: #f5f5f5;
  }

  .login-box {
    background: #ffffff;
    padding: 50px 60px;
    border-radius: 15px;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
    max-width: 800px;
    margin: 60px auto;
  }

  .login-title {
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 30px;
    text-align: center;
    color: #fe5b29;
  }

  .form-group {
    margin-bottom: 20px;
  }

  .form-group label {
    font-weight: 600;
    color: #333;
  }

  .form-control {
    height: 50px;
    padding: 10px 15px;
    font-size: 16px;
    border-radius: 8px;
    border: 1px solid #ccc;
    transition: border-color 0.2s ease-in-out;
  }

  .form-control:focus {
    border-color: #fe5b29;
    outline: none;
    box-shadow: 0 0 5px rgba(254, 91, 41, 0.3);
  }

  .btn {
    background-color: #fe5b29;
    border: none;
    height: 45px;
    font-size: 18px;
    font-weight: 600;
    border-radius: 8px;
    transition: background-color 0.3s;
  }

  .btn:hover {
    background-color: #e14a1c;
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
         <h1 class="login-title">See You if Apply</h1>
            <h2 style="color:black;" class="login-title">Vehicle Credit Application </h2>
            <form action="handleApplications" method="post">
              <div class="form-group">
              <div class="row">
			    <div class="col-md-6">
                  <label for="vehicle">Select A Vehicle</label>
                  <select class="form-control"id="brandDrop" name="brand" required>
			         <option value="" disabled selected>Any Brand</option>
         <% 
         if(!allVehicles.isEmpty()){   HashSet<String> uniqueBrands = new HashSet<>();
            for (Vehicle v : allVehicles) { %>
             <%   String brand = v.getBrand();
               if (uniqueBrands.add(brand)) {
         %>
               <option value="<%= brand %>"><%= brand %></option>
         <% 
               }
            }
            }
         %>
			         </select>
               </div>
			    <div class="col-md-6">
                  <label for="model">Select A Vehicle</label>
                  <select class="form-control" id="modelDrop" name="model" required>
			         <option value="" disabled selected>Any Model</option>
			         </select>
			         </div>
			         <div class="col-md-6">
                  <label for="vin">VIN (Optional)</label>
                  <input type="text" class="form-control" id="vin" name="vin" placeholder="Enter full vehicle VIN Number">
                  </div>
                    <div class="col-md-6">
                  <label for="years">Vehicle Year Model</label>
                  <input type="number" min="1950" max="2030" step="0" class="form-control" id="years" required name="vehicleYears" placeholder="Enter vehicle Model year">
                  </div>
               </div>
               </div>
               
         
                  <div class="form-group">
              <div class="row">
			    <div class="col-md-6">
                  <label for="fname">First Name</label>
                  <input type="text" class="form-control" id="fname" name="fname" required <%= firstName %>>
               </div>
               <div class="col-md-6">
                  <label for="lname">Last Name</label>
                  <input type="text" class="form-control" id="lname" name="lname" required <%= lastName %>>
               </div>
               </div>
               </div>
           <div class="form-group">
              <div class="row">
			    <div class="col-md-6">
                  <label for="email">Email address</label>
                  <input type="email" class="form-control" id="email" name="email" required <%= email %>>
               </div>
             <div class="col-md-6">
                  <label for="phone">Phone Number</label>
                  <input type="text" class="form-control" id="phone" name="phone" required <%= phoneNum %>>
               </div>
               </div>
               </div>
               
                      <div class="form-group">
                  <label for="fname">Address</label>
                  <input type="text" class="form-control" id="address" name="address" required >
               </div>
         <div class="form-group">
              <div class="row">
			    <div class="col-md-4">
                  <label for="state">State</label>
                  <select class="form-control" id="states" name="state" required>
			         <option value="" disabled selected>Select State</option>
			         </select>
               </div>
                  <div class="col-md-4">
                  <label for="City">City</label>
                  <select class="form-control" id="cities" name="city" required>
			         <option value="" disabled selected>Select City</option>
			         </select>
               </div>
              
               <div class="col-md-4">
                  <label for="zip">Zip Code</label>
                  <input type="number" min="00000"  class="form-control" id="zip" name="zip" required>
               </div>
                </div>
               </div>
	      <div class="form-group">
              <div class="row">
			    <div class="col-md-6">
                  <label for="employer">Employer</label>
                  <input type="text" class="form-control" id="employer" name="employer" required>
               </div>
               <div class="col-md-6">
                  <label for="income">Annual Income</label>
                  <input type="number" step="0.00" min="1000.00" class="form-control" id="income" name="income" required>
               </div>
               </div>
               </div>
	           <div class="form-group">
				  <div class="row">
				    <div class="col-md-6">
				      <label for="years">Time at Job (Years)</label>
				      <input type="number" step="0" min="1" class="form-control" id="years" name="years" required>
				    </div>
				    <div class="col-md-6">
				      <label for="downPayment">Down Payment ($)</label>
				      <input type="number" step="0.00" min="0.00" class="form-control" id="downPayment" name="downPayment" required>
				    </div>
				  </div>
				</div>

          <div class="form-group">
			  <div class="row">
			    <div class="col-md-6">
			      <label for="tradeValue">Trade in Value ($)</label>
			      <input type="number" step="0.00" min="0.00" class="form-control" id="tradeValue" name="tradeValue" required>
			    </div>
			    <div class="col-md-6">
			      <label for="months">Preferred Term (Months)</label>
			      <select class="form-control" id="months" name="months" required>
			        <option value="36">36</option>
			        <option value="48">48</option>
			        <option value="60">60</option>
			        <option value="72">72</option>
			      </select>
			    </div>
			  </div>
			</div>

             <div class="form-group">
  <div class="row">
    <div class="col-md-6">
      <label for="SSN">Full Social Security Number</label>
      <input  type="password" class="form-control" maxlength="9" pattern="\d{9}" id="SSN" name="SSN" placeholder="000-00-0000" required>
    </div>
    <div class="col-md-6 d-flex align-items-start">
      <div class="form-check mt-4">
        <input onclick="checkSSN(event)" class="form-check-input" type="checkbox" id="confirm" name="confirm" required>
        <label class="form-check-label" for="confirm">
          By checking this box, I agree to let Turbo Motors use and run a full credit check on the information provided.
        </label>
      </div>
    </div>
  </div>
</div>

             
               <button  type="submit" class="btn btn-login btn-block text-white">Submit</button>
            </form>
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
      <!-- Put these below the form, at the bottom of the JSP body -->
<div id="vehicle-data" style="display: none;">
<% for (Vehicle v : allVehicles) { %>
  <div class="vehicle-item" data-brand="<%= v.getBrand()%>" data-model="<%= v.getModel()%>"></div>
<% } %>
</div>
      
<script>
document.querySelector('form').addEventListener('submit', function(e) {
  const ssn = document.getElementById('SSN').value.trim();
  const checkbox = document.getElementById('confirm');

  // Check that SSN is exactly 9 digits
  const ssnPattern = /^\d{9}$/;

  if (!ssnPattern.test(ssn)) {
    alert("Please enter a valid 9-digit SSN without dashes.");
    e.preventDefault();
    return;
  }

  if (!checkbox.checked) {
    alert("You must agree to the credit check before submitting.");
    e.preventDefault();
    return;
  }
});
</script>


      <!-- copyright section end -->
      <!-- Javascript files-->
      <script src="js/applying.js"></script>
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <script src="js/plugin.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
   </body>
</html>
