package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/Login")
public class Login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve login credentials
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Initialize dispatcher and connection
        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            // Database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy?allowPublicKeyRetrieval=true&useSSL=false", "root", "valluri");

            // Query to verify user
            String query = "SELECT * FROM customer WHERE email = ? AND password = ?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password); // Use hashed password comparison in production

            // Execute query
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                // Authentication successful
                HttpSession session = request.getSession();
                session.setAttribute("email", email); // Optional: Store email in session
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("home.jsp");
            } else {
                // Authentication failed
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("index.html");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close the connection
            if (con != null) {
                try {
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
