<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="deal.*" %>
<%
    ServletContext context = request.getServletContext();
    User user = (User) context.getAttribute("loggedinUser");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Need a Website?</title>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/buttons.css">
    <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
</head>
<body>
    <!-- Header section (optional reuse from index.jsp) -->
    <div style='background: url("images/logo-background.png");' class="header_section">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="index.jsp"><img src="images/logo3.png" alt="Logo"></a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                        <% if(user != null) { %>
                        <li class="nav-item"><a class="nav-link" href="profile.jsp">Profile</a></li>
                        <% } else { %>
                        <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link" href="register.jsp">Sign Up</a></li>
                        <% } %>
                    </ul>
                </div>
            </nav>
        </div>
    </div>

    <!-- Web development promotion section -->
    <div class="about_section layout_padding">
        <div class="container">
            <div class="about_section_2">
                <div class="row align-items-center">
                    <div class="col-md-6"> 
                        <div class="image_iman text-center">
                            <img src="images/webDev.png" class="about_img" alt="Web Development">
                        </div>
                    </div>
                    <div class="col-md-6"> 
                        <div class="about_taital_box">
                            <h1 class="about_taital">Need a <span style="color: #fe5b29;">Website?</span></h1>
                            <p class="about_text">
                                Launch your online presence with a modern, mobile-friendly website crafted to fit your vision. 
                                From portfolios to business pages — I design responsive, interactive, and elegant websites tailored just for you.
                            </p>
                             <div class="social_icon mt-3 text-center">
                                <h2 class="contact_text">Email me at</h2>
                                <a href="https://mail.google.com/mail/u/0/?ogbl#inbox?compose=CllgCJlKFmcTfZTHTFBqKlqTjQgFKKgbZCqdSxkkztsxdDDXDfWPgxrJqHPstPhTtJhPsvhWGBB" target="_blank" class="instagram_link">
                                    <img src="images/email-icon.png" alt="Email" class="social_img">
                                </a>
                            </div>
                            <div class="social_icon mt-3 text-center">
                                <h2 class="contact_text">Explore My Work</h2>
                                <a href="https://github.com/Julian-Marquez?tab=repositories" target="_blank" class="github_link">
                                    <img src="images/github.png" alt="GitHub" class="social_img">
                                </a>
                            </div>
                            <div class="social_icon mt-3 text-center">
							    <h2 class="contact_text">View My Resume</h2>
							    <a href="files/Job-Application.pdf" target="_blank" class="github_link">
							        <img src="https://upload.wikimedia.org/wikipedia/commons/8/87/PDF_file_icon.svg" alt="PDF" class="social_img">
							    </a>
							    <p style="margin-top: 10px;">
							        <a href="files/Job-Application.pdf" download class="btn btn-outline-primary">Download PDF</a>
							    </p>
							</div>                     
                               <div class="social_icon mt-3 text-center">
                                <h2 class="contact_text">Extra References</h2>
                                <a href="https://www.tiktok.com/@marquezjulian_09?is_from_webapp=1&sender_device=pc" target="_blank" class="github_link">
                                    <img src="images/tik-tok-icon.png" alt="Tik-tok" class="social_img">
                                </a>
                                 <a href="https://www.instagram.com/marquezjulian09" target="_blank" class="github_link">
                                    <img src="images/instagram-icon.webp" alt="Instagram" class="social_img">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
<div style='background: url("images/logo-background.png"); width: 100%;' class="services_section layout_padding">
   <div class="container">
      <h1 class="choose_taital">What I Can Build For You</h1>
      <div class="row">
         <div class="col-md-3 text-center">
            <img src="images/service-business.png" alt="Business Site" class="service-icon">
            <h4>Business Websites</h4>
            <p>Professional websites for startups, services, or local businesses.</p>
         </div>
         <div class="col-md-3 text-center">
            <img src="images/service-portfolio.webp" alt="Portfolio" class="service-icon">
            <h4>Portfolios</h4>
            <p>Showcase your work with a stunning online portfolio or resume site.</p>
         </div>
         <div class="col-md-3 text-center">
            <img src="images/service-ecommerce.png" alt="eCommerce" class="service-icon">
            <h4>eCommerce Stores</h4>
            <p>Launch a custom online store with secure checkout and product management.</p>
         </div>
         <div class="col-md-3 text-center">
            <img src="images/service-mobile.jpg" alt="Mobile App" class="service-icon">
            <h4>Mobile Applications</h4>
            <p>Modern Android applications built with performance, design, and scalability in mind.</p>
         </div>
      </div>
   </div>
</div>

    

<div style="background-color: grey; width: 100%;" class="testimonial_section layout_padding">
   <div class="container">
      <h1 class="choose_taital">Client Feedback</h1>
      <div class="testimonial_box">
         <p style="color: black;">“Julian built a beautiful and functional site for my small business in just a few days. He listened carefully and delivered more than I expected.”</p>
         <h5>Jorge Para., Local Business Owner</h5>
      </div>
   </div>
</div>

    
    <div style="padding-bottom: 90px;" class="tech_stack_section layout_padding">
   <div class="container text-center">
   <div class="container">
      <h1 class="about_taital">Technologies I Use</h1>
      <div style=" padding-top: 27px;" class="row justify-content-center">
         <div class="col-md-2 col-4"><img src="images/html5.png" alt="HTML5" class="social_img"></div>
         <div class="col-md-2 col-4"><img src="images/css3.webp" alt="CSS3" class="social_img"></div>
         <div class="col-md-2 col-4"><img src="images/js.png" alt="JavaScript" class="social_img"></div>
         <div class="col-md-2 col-4"><img src="images/java.png" alt="Java" class="social_img"></div>
         <div class="col-md-2 col-4"><img src="images/database.png" alt="MySQL" class="social_img"></div>
      </div>
      </div>
   </div>
</div>

    <!-- Styles for this page -->
    <style>
        .about_section { padding: 60px 0; }
        .about_img { max-width: 100%; height: auto; border-radius: 10px; }
        .about_taital { font-size: 2.5rem; font-weight: bold; }
        .contact_text { font-size: 1.5rem; margin-bottom: 10px; }
        .social_icon { margin-top: 20px; }
        .social_img { width: 60px; height: 60px; transition: transform 0.3s ease; }
        .instagram_link:hover .social_img, .github_link:hover .social_img {
            transform: scale(1.1);
        }
        .service_icon {
    width: 100px;
    height: 100px;
    object-fit: contain;
    margin-bottom: 15px;
    transition: transform 0.3s ease;
}

.services_section p {
    color: white;
}

.services_section h4 {
    color: #fe5b29; /* Orange (matches your site accent) */
    font-weight: bold;
    font-size: 1.3rem;
}


@media (min-width: 768px) {
    .service_icon {
        width: 120px;
        height: 120px;
    }
}

@media (min-width: 992px) {
    .service_icon {
        width: 140px;
        height: 140px;
    }
}

.service_icon:hover {
    transform: scale(1.1);
}
    </style>

    <!-- Footer -->
    <div style="background: url('images/logo-background.png')" class="footer_section layout_padding">
        <div class="container text-center">
            <div class="footeer_logo"><img src="images/logo3.png" alt="Logo"></div>
            <p class="copyright_text">© 2025 All Rights Reserved</p>
        </div>
    </div>

    <!-- Scripts -->
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
