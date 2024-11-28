package Objects;

import java.time.LocalDate;
import java.time.LocalTime;

public class Booking {
    private int bookingId;          // Auto-generated ID
    private String customerName;    // Customer's name
    private String customerMail;    // Customer's email
    private String customerPhone;   // Customer's phone number
    private LocalDate bookingDate;  // Booking date
    private LocalTime bookingTime;  // Booking time
    private Integer agentId;        // Agent ID (can be null)

    // Default constructor
    public Booking() {
    }

    // Parameterized constructor
    public Booking(String customerName, String customerMail, String customerPhone, 
                   LocalDate bookingDate, LocalTime bookingTime, Integer agentId) {
        this.customerName = customerName;
        this.customerMail = customerMail;
        this.customerPhone = customerPhone;
        this.bookingDate = bookingDate;
        this.bookingTime = bookingTime;
        this.agentId = agentId;
    }

    // Getters and setters
    public int getBookingId() {
        return bookingId;
    }

    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerMail() {
        return customerMail;
    }

    public void setCustomerMail(String customerMail) {
        this.customerMail = customerMail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public LocalDate getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDate bookingDate) {
        this.bookingDate = bookingDate;
    }

    public LocalTime getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(LocalTime bookingTime) {
        this.bookingTime = bookingTime;
    }

    public Integer getAgentId() {
        return agentId;
    }

    public void setAgentId(Integer agentId) {
        this.agentId = agentId;
    }

    // toString() method for debugging
    @Override
    public String toString() {
        return "Booking [bookingId=" + bookingId + ", customerName=" + customerName + 
               ", customerMail=" + customerMail + ", customerPhone=" + customerPhone + 
               ", bookingDate=" + bookingDate + ", bookingTime=" + bookingTime + 
               ", agentId=" + agentId + "]";
    }
}
