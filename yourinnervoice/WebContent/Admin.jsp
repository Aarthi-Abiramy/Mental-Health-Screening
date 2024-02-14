<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");

String admin_name = request.getParameter("admin_name");
String password = request.getParameter("password");

try {
    // Load the JDBC driver
    Class.forName("com.mysql.jdbc.Driver");

    // Establish a database connection
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/innervoice", "root", "12345");

    // Prepare the SQL query
    String query = "SELECT * FROM admin WHERE admin_name = ? AND password = ?";
    PreparedStatement preparedStatement = con.prepareStatement(query);
    preparedStatement.setString(1, admin_name);
    preparedStatement.setString(2, password);

    // Execute the query
    ResultSet resultSet = preparedStatement.executeQuery();

    if (resultSet.next()) {
        // Successful login
        response.sendRedirect("AdminHome.html");
    } else {
        // Invalid credentials
        response.getWriter().println("Invalid credentials. Please try again.");
    }

    // Close resources
    resultSet.close();
    preparedStatement.close();
    con.close();
} catch (Exception e) {
    response.getWriter().println("An error occurred: " + e.getMessage());
    e.printStackTrace();
}
%>
</body>
</html>
