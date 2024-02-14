<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registered Users</title>
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

        /* Style for the phone icon column */
        .phone-icon {
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="header">
        <h2>Registered Users</h2>
    </div>
    <div class="container">
        <table border="1">
            <tr>
                <th>First Name</th>
                <th>UserName</th>
                <th>Email</th>
                <th>Phone Number</th>
                <th>Country</th>
                
            </tr>
            <%
            try {
                // Load the JDBC driver and establish a database connection
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/innervoice", "root", "12345");

                // Prepare the SQL query to fetch data from the table where yearsOfService is "watch service"
                String query = "SELECT firstName, username, email, phoneNumber,country FROM user1";
                PreparedStatement preparedStatement = con.prepareStatement(query);
                ResultSet resultSet = preparedStatement.executeQuery();

                // Iterate through the result set and display data in the table
                while (resultSet.next()) {
                    String firstName = resultSet.getString("firstName");
                    String username = resultSet.getString("username");
                    String email = resultSet.getString("email");
                    String phoneNumber = resultSet.getString("phoneNumber");
                    String country = resultSet.getString("country");
                    
            %>
            <tr>
                <td><%= firstName %></td>
                <td><%= username %></td>
                <td><%= email %></td>
                <td><%= phoneNumber %></td>
                <td><%= country %></td>
                
                <td class="phone-icon">
                    <!-- Display a phone icon for making a call -->
                    <a href="tel:<%= phoneNumber %>">&#128222;</a>
                </td>
                
                <td class="delete-icon">
  <!-- Display a delete icon that triggers a JavaScript function when clicked -->
  <a href="#" onclick="deleteRecord(<%= username %>)">&#128465;</a>
</td>
                
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