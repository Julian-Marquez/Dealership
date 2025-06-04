package deal;

import java.util.ArrayList;
import java.util.List;

public class User {

    private String fname;
    private String lname;
    private String email;
    private String username;
    private String phone;
    private String password;
    private long id;
    private byte[] profilePic;
    private List<Vehicle> savedVehicles;
    private List<Vehicle> ownedVehicles;
    private List<Receipt> receipts;
    private List<Card> payMethods;
    private boolean isAdmin = false;

    public User(String fname, String lname, String email, String username, String phone, String password) {
        this.fname = fname;
        this.lname = lname;
        this.email = email;
        this.username = username;
        this.phone = phone;
        this.password = password;

        this.savedVehicles = new ArrayList<>();
        this.ownedVehicles = new ArrayList<>();
        this.receipts = new ArrayList<>();
        this.payMethods = new ArrayList<>();
    }

    // Getters and Setters
    public String getFirstName() {
        return fname;
    }

    public void setFirstName(String fname) {
        this.fname = fname;
    }

    public String getLastName() {
        return lname;
    }

    public void setLastName(String lname) {
        this.lname = lname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }
    
    public void setUserId(long id) {
    	this.id = id;
    }
    
    public void setAdmin(boolean admin) {
    	this.isAdmin = admin;
    }
    
    public long getId() {
    	return this.id;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getProfilePic() {
        return profilePic;
    }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    public List<Vehicle> getSavedVehicles() {
        return savedVehicles;
    }

    public List<Vehicle> getOwnedVehicles() {
        return ownedVehicles;
    }

    public List<Receipt> getReceipts() {
        return receipts;
    }

    public List<Card> getPayMethods() {
        return payMethods;
    }
    
    public boolean isAdmin() {
    	return this.isAdmin;
    }

}
