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
     pstmt = con.prepareStatement("SELECT * FROM project WHERE status = ?");
     pstmt.setString(1, "Complete");
     ResultSet rs = pstmt.executeQuery();

%>

<!-- Donate Start -->

                     <table class="table table-bordered">
                         <thead>
                             <tr>
                                  <th>NGO ID</th>
                                  
                                  <th>Project Name</th>
                                  <th>Project Details</th>
                                  <th>Project Address</th>
                                  <th>City</th>
                                  <th>Pincode</th>
                                  <th>State</th>
                                  <th>Latitude</th>
                                  <th>Longitude</th>
                                  <th>Project Cost</th>
                                  <th>Status</th>
                             </tr>
                         </thead>
                         <tbody>
                             <% 
                                 while (rs.next()) {
                             %>
                             <tr>
                                <td><%=rs.getString("id")%></td>
                                 
                                 <td><%=rs.getString("projectName")%></td>
                                 <td><%=rs.getString("projectDetails")%></td>
                                 <td><%=rs.getString("projectAddress")%></td>
                                 <td><%=rs.getString("city")%></td>
                                 <td><%=rs.getString("pincode")%></td>
                                 <td><%=rs.getString("state")%></td>
                                 <td><%=rs.getString("latitude")%></td>
                                 <td><%=rs.getString("longitude")%></td>
                                 <td><%=rs.getString("ProjectCost")%></td>
                                 <td><%=rs.getString("status")%></td>
                             </tr>
                             <% 
                                 }
                             %>
                         </tbody>
                     </table>
                 
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
