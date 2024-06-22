<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="charity_system.Dbconnection"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Update Project Status</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        .yellow-button, .green-button {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        .yellow-button {
            background-color: yellow;
        }
        .green-button {
            background-color: green;
            color: #fff;
        }
        form {
            margin: 0;
        }
        button[type="submit"] {
            padding: 5px 10px;
            border: none;
            border-radius: 3px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h1>Update Project Status</h1>
    
    <table border="1">
        <thead>
            <tr>
                <th>Project ID</th>
                <th>Project Name</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
            Connection con = Dbconnection.connect();
            try {
                PreparedStatement pstmt = con.prepareStatement("SELECT * FROM project");
                ResultSet rs = pstmt.executeQuery();
                while (rs.next()) {
                    String projectId = rs.getString("id");
                    String projectName = rs.getString("projectName");
                    String status = rs.getString("status");
            %>
            <tr>
                <td><%= projectId %></td>
                <td><%= projectName %></td>
                <td>
                    <% if (status.equals("Complete")) { %>
                        <span class="green-button">Complete</span>
                    <% } else { %>
                        <span class="yellow-button">Pending</span>
                    <% } %>
                </td>
                <td>
                    <form action="<%= status.equals("Complete") ? "ngoregi.html" : "updatestatus.jsp" %>" method="post">
                        <input type="hidden" name="projectId" value="<%= projectId %>">
                        <button type="submit"><%= status.equals("Complete") ? "Completed" : "Mark as Complete" %></button>
                    </form>
                </td>
            </tr>
            <% 
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            %>
        </tbody>
    </table>
</body>
</html>
