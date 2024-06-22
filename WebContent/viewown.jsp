<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.IOException" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="charity_system.Dbconnection" %>
<%@ page import="charity_system.User" %>

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
try {
    // Establish database connection
    Connection con = Dbconnection.connect();
    
    // Get user email
    String email = User.getEmail();
    
    // Prepare statements
    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM donor WHERE email=?");
    pstmt.setString(1, email);
    
    // Execute query to get donor ID
    ResultSet rs1 = pstmt.executeQuery();
    
    // Check if a donor with the provided email exists
    if (rs1.next()) {
        // Retrieve donor ID
        int id = rs1.getInt("id");
        
        // Prepare statement to select donation logs for the donor
        PreparedStatement pst = con.prepareStatement("SELECT * FROM donationlogs WHERE donorId=?");
        pst.setInt(1, id);
        
        // Execute query to get donation logs
        ResultSet rs = pst.executeQuery();
%>

<!-- Donate Start -->
<div class="donate" data-parallax="scroll" data-image-src="img/donate.jpg">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-7">
                <div class="donate-content">
                    <div class="section-header">
                        <h1></h1>
                        <h2>Donations</h2>
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
                                    <th>Donor ID</th>
                                    <th>Project ID</th>
                                    <th>Date</th>
                                    <th>Time</th>
                                    <th>Amount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    // Iterate over donation logs
                                    while (rs.next()) {
                                %>
                                <tr>
                                    <td><%= rs.getInt("id") %></td>
                                    <td><%= rs.getInt("donorId") %></td>
                                    <td><%= rs.getInt("projectId") %></td>
                                    <td><%= rs.getDate("donateDate") %></td>
                                    <td><%= rs.getTime("donateTime") %></td>
                                    <td><%= rs.getDouble("amt") %></td>
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
    } else {
        out.println("No donor found with the provided email.");
    }
} catch (SQLException e) {
    // Handle SQL exceptions
    e.printStackTrace();
} catch (Exception e) {
    // Handle other exceptions
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
