package Objects;

public class Customer {
    private int id;                // Auto-generated ID
    private String name;           // Customer name
    private String dob;            // Date of birth
    private String email;          // Email ID
    private String phoneNumber;    // Phone number
    private String address;        // Address
    private String password;       // Password (hashed for security)
    private String confirmPassword; // Confirm Password

    // Default Constructor
    public Customer() {
    }

    // Parameterized Constructor
    public Customer(String name, String dob, String email, String phoneNumber, String address, String password, String confirmPassword) {
        this.name = name;
        this.dob = dob;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.password = password;
        this.confirmPassword = confirmPassword;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    // toString() Method for Debugging
    @Override
    public String toString() {
        return "Customer [id=" + id + ", name=" + name + ", dob=" + dob + ", email=" + email + 
               ", phoneNumber=" + phoneNumber + ", address=" + address + "]";
    }
}
