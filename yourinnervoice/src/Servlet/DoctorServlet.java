package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SubmitIssue
 */
@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL="jdbc:mysql://localhost:3307/innervoice";
	private static final String DB_USER="root";
	private static final String DB_PASSWORD="12345";

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	     
	        String Name = request.getParameter("Name");
	        String email = request.getParameter("email");
	        String mobile = request.getParameter("mobile");
	        String specialization = request.getParameter("specialization");
	        String country = request.getParameter("country");
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	            String insertQuery="INSERT INTO doctor(name,email,mobile,specialization,country)VALUES(?,?,?,?,?)";
	            PreparedStatement ps = conn.prepareStatement(insertQuery);
	            ps.setString(1, Name);
	            ps.setString(2, email);
	            ps.setString(3, mobile);
	            ps.setString(4, specialization);
	            ps.setString(5, country);
	            
	            ps.executeUpdate();
	            ps.close();
	            conn.close();
	            response.sendRedirect("Welcome.html");
	        }
	           catch(Exception e) {
	                e.printStackTrace();
	            }
	        }

}
