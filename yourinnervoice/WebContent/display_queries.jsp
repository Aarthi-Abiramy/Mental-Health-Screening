<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Customer Queries</title>
    <style>
        body {
            background-image: url("https://i.pinimg.com/originals/ee/2c/41/ee2c4191251fd267fda23548dd63e53f.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            margin: 0;
            padding: 0;
            font-family: Arial, Helvetica, sans-serif;
        }

        .header {
            text-align: center;
            background-color: #333;
            color: white;
            padding: 20px;
        }

        .container {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }

        table {
            background-color: black;
            color: white;
            margin-top: 20px;
        }

        table th {
            background-color: black;
        }

        table, th, td {
            border: 1px solid white;
        }

       
    </style>
</head>
<body>
    <div class="header">
        <h2>Customer Queries</h2>
    </div>
    <div class="container">
        <table border="1">
            <tr>
                <th>UserName</th>
                <th>Email</th>
                <th>Message</th>
            </tr>
            <%
            try {
                // Load the JDBC driver and establish a database connection
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/innervoice", "root", "12345");

                //String query = "SELECT username, email, message FROM contact";
                String query = "SELECT * FROM contact";
                PreparedStatement preparedStatement = con.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery();

                // Iterate through the result set and display data in the table
                while (resultSet.next()) {
                    String UserName = resultSet.getString("username");
                    String Email = resultSet.getString("email");
                    String Message = resultSet.getString("message");
            %>
            <tr>
                <td><%= UserName %></td>
                <td><%= Email %></td>
                <td><%= Message %></td>
                
            </tr>
            <%
                }
                // Close resources
                resultSet.close();
                preparedStatement.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
        </table>
    </div>
</body>
</html>