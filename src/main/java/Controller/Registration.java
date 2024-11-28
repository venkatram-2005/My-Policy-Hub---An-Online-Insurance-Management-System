package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class Registration extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form data
        String name = request.getParameter("name");
        String dob = request.getParameter("dob");
        String email = request.getParameter("email");
        String phoneNumber = request.getParameter("phone_number");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirm_password");

        // Initialize dispatcher and connection
        RequestDispatcher dispatcher = null;
        Connection con = null;

        // Validate that passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("registration.jsp");
            dispatcher.forward(request, response);
            return;
        }

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy?allowPublicKeyRetrieval=true&useSSL=false", "root", "valluri");

            // Insert query
            String query = "INSERT INTO customer (name, dob, email, phone_number, address, password) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);

            // Set parameters
            pst.setString(1, name);
            pst.setString(2, dob);
            pst.setString(3, email);
            pst.setString(4, phoneNumber);
            pst.setString(5, address);
            pst.setString(6, password); // Ideally hash this before storing

            // Execute query
            int rowCount = pst.executeUpdate();
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            // Handle response
            dispatcher = request.getRequestDispatcher("registration.jsp");
            
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the connection
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
