package Servlet;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet implements Serializable {
private static final long serialVersionUID = 1L;
private static final String DB_URL="jdbc:mysql://localhost:3307/innervoice";
private static final String DB_USER="root";
private static final String DB_PASSWORD="12345";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
     
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob");
        String phoneNumber = request.getParameter("phoneNumber");
        String country = request.getParameter("country");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
            String insertQuery="INSERT INTO user1(firstName,lastName,email,username,password,gender,dob,phoneNumber,country)VALUES(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(insertQuery);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, username);
            ps.setString(5, password);
            ps.setString(6, gender);
            ps.setString(7, dob);
            ps.setString(8, phoneNumber);
            ps.setString(9, country);
           
            ps.executeUpdate();
            ps.close();
            conn.close();
            response.sendRedirect("AccountCreated.html");
        }
           catch(Exception e) {
                e.printStackTrace();
            }
        }
}