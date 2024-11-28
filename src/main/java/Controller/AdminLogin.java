package Controller;

import java.io.IOException;
import java.io.PrintWriter;
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

@WebServlet("/adminlogin")
public class AdminLogin extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/infy"; // Update database name
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "valluri";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");

        
        
        RequestDispatcher dispatcher = null;
        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Query to check agent credentials
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, password);

            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                // Authentication successful
                HttpSession session = request.getSession();
                session.setAttribute("name", name);
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("adminhome.jsp");
            } else {
                // Authentication failed
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("admin_side_login.jsp");
            }
            dispatcher.forward(request, response);

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
