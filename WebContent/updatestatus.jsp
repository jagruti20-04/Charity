<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="charity_system.Dbconnection"%>

<%
    String projectId = request.getParameter("projectId");
    String updateQuery = "UPDATE project SET status = 'Complete' WHERE id = ?";
    
    Connection con = Dbconnection.connect();
    PreparedStatement pstmt = null;
    
    try {
        pstmt = con.prepareStatement(updateQuery);
        pstmt.setString(1, projectId);
        int rowsAffected = pstmt.executeUpdate();
        
        if (rowsAffected > 0) {
            out.println("<script>alert('Status updated successfully');</script>");
        } else {
            out.println("<script>alert('Failed to update status');</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<script>alert('Error: Failed to update status');</script>");
    } finally {
        if (pstmt != null) {
            try {
                pstmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

<meta http-equiv="refresh" content="0;url=ngoregi.html">
