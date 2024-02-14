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
@WebServlet("/SubmitIssue")
public class SubmitIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL="jdbc:mysql://localhost:3307/innervoice";
	private static final String DB_USER="root";
	private static final String DB_PASSWORD="12345";

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	     
	        String username = request.getParameter("username");
	        String email = request.getParameter("email");
	        String message = request.getParameter("message");
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
	            String insertQuery="INSERT INTO contact(username,email,message)VALUES(?,?,?)";
	            PreparedStatement ps = conn.prepareStatement(insertQuery);
	            ps.setString(1, username);
	            ps.setString(2, email);
	            ps.setString(3, message);
	            
	            ps.executeUpdate();
	            ps.close();
	            conn.close();
	            response.sendRedirect("MessageSent.html");
	        }
	           catch(Exception e) {
	                e.printStackTrace();
	            }
	        }

}
