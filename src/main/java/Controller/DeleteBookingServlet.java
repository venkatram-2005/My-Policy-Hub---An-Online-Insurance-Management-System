package Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteBooking")
public class DeleteBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingId = request.getParameter("bookingId");
        Connection con = null;
     // Dispatcher for forwarding the request
        RequestDispatcher dispatcher = null;
        try {
            // Establish a database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/infy", "root", "valluri");

            // Prepare and execute the delete statement
            String deleteQuery = "DELETE FROM booking WHERE booking_id = ?";
            PreparedStatement pst = con.prepareStatement(deleteQuery);
            pst.setInt(1, Integer.parseInt(bookingId));
            int rowCount = pst.executeUpdate();

            // Redirect to the bookings page after deletion
            if (rowCount > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }
            
            dispatcher = request.getRequestDispatcher("enterEmail.jsp");
            
            // Forward to confirmation page
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
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
