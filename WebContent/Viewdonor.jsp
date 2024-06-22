<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.IOException"%>
  <%@ page import=" java.sql.*"%>
  <%@ page import="  javax.servlet.*"%>
<%@ page import=" javax.servlet.http.*"%>
<%@ page import="charity_system.Dbconnection"%>








<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>HELPZ - Free Charity Website Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free Website Template" name="keywords">
        <meta content="Free Website Template" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        
        <!-- CSS Libraries -->
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="lib/flaticon/font/flaticon.css" rel="stylesheet">
        <link href="lib/animate/animate.min.css" rel="stylesheet">
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>
 <body>
 <%
            Connection con = Dbconnection.connect();
  try {
     PreparedStatement pstmt;
     pstmt = con.prepareStatement("SELECT * FROM donor ");
     ResultSet rs = pstmt.executeQuery();
%>

<!-- Donate Start -->
<div class="donate" data-parallax="scroll" data-image-src="img/donate.jpg">
 <div class="container">
     <div class="row align-items-center">
         <div class="col-lg-7">
             <div class="donate-content">
                 <div class="section-header">
                     <h1></h1>
                     <h2>Donor List</h2>
                 </div>
                 <div class="donate-text">
                     
                 </div>
             </div>
         </div>
         <div class="col-lg-5">
             <div class="donate-form">
                 <div class="table-responsive">
                     <table class="table table-bordered">
                         <thead>
                             <tr>
                                 <th>ID</th>
                                 <th>Name</th>
                                 <th>Address</th>
                                 <th>City</th>
                                 <th>Pin</th>
                                 <th>Contact</th>
                                 <th>Email</th>
                             </tr>
                         </thead>
                         <tbody>
                             <% 
                                 while (rs.next()) {
                             %>
                             <tr>
                                 <td><%=rs.getString("id")%></td>
                                 <td><%=rs.getString("name")%></td>
                                 <td><%=rs.getString("address")%></td>
                                 <td><%=rs.getString("city")%></td>
                                 <td><%=rs.getString("pincode")%></td>
                                 <td><%=rs.getString("contact")%></td>
                                 <td><%=rs.getString("email")%></td>
                             </tr>
                             <% 
                                 }
                             %>
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
     </div>
 </div>
</div>
<!-- Donate End -->

<%
 } catch(Exception e) {
     e.printStackTrace();
 }
%>

        
                        <!-- Footer Start -->
        
        
        <!-- Back to top button -->
        <a href="#" class="back-to-top"><i class="fa fa-chevron-up"></i></a>
        
        <!-- Pre Loader -->
        <div id="loader" class="show">
            <div class="loader"></div>
        </div>

        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>
        <script src="lib/waypoints/waypoints.min.js"></script>
        <script src="lib/counterup/counterup.min.js"></script>
        <script src="lib/parallax/parallax.min.js"></script>
        
        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>
</html>
