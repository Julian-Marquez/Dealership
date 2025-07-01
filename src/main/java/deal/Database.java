package deal;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Database {
        // Your connection details
	private static final String URL = "jdbc:postgresql://dealership-brandonmarquez505-6c36.j.aivencloud.com:20722/defaultdb?ssl=require&user=avnadmin&password=AVNS_2UfySyinqqkJYMpMapW";
        private String USER = "avnadmin";
        private String PASSWORD = "AVNS_2UfySyinqqkJYMpMapW";
        
        public Database() {
        	 try {
                 Class.forName("org.postgresql.Driver");
             } catch (ClassNotFoundException e) {
                 e.printStackTrace();
             }
        try (Connection conn = DriverManager.getConnection(URL)) {
            if (conn != null) {
                System.out.println("✅ Connection successful!");
            } else {
                System.out.println("❌ Failed to make connection!");
            }
        } catch (SQLException e) {
            System.err.println("⚠️ SQL Exception: " + e.getMessage());
            e.printStackTrace();
        }
        }
        
        public void insertUser(User user) {
            // Load the PostgreSQL JDBC driver (optional in newer versions if already in classpath)
            try {
                Class.forName("org.postgresql.Driver");
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                return;
            }

            String sql = "INSERT INTO users (fname, lname, email, username, phone, password, profile_pic, isadmin) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING user_id";

            try (Connection conn = DriverManager.getConnection(
                        "jdbc:postgresql://dealership-brandonmarquez505-6c36.j.aivencloud.com:20722/defaultdb?ssl=require&user=avnadmin&password=AVNS_2UfySyinqqkJYMpMapW");
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setString(1, user.getFirstName());
                pstmt.setString(2, user.getLastName());
                pstmt.setString(3, user.getEmail());
                pstmt.setString(4, user.getUsername());
                pstmt.setString(5, user.getPhone());
                pstmt.setString(6, user.getPassword());
                pstmt.setBytes(7, user.getProfilePic());
                pstmt.setBoolean(8, user.isAdmin());

                pstmt.executeUpdate();
                System.out.println("User inserted successfully.");

            } catch (SQLException e) {
                System.out.println("Error inserting user:");
                e.printStackTrace();
            }
        }

        public List<User> getAllUsers() {
        	 try {
                 Class.forName("org.postgresql.Driver");
             } catch (ClassNotFoundException e) {
                 e.printStackTrace();
             }
            List<User> users = new ArrayList<>();

            String sql = "SELECT user_id, fname, lname, email, username, phone, password, profile_pic, isadmin FROM users";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement pstmt = conn.prepareStatement(sql);
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    User user = new User(rs.getString("fname"),rs.getString("lname"),rs.getString("email"),rs.getString("username"),rs.getString("phone"),rs.getString("password"));
                    user.setUserId(rs.getLong("user_id")); 
                    user.setAdmin(rs.getBoolean("isadmin"));
                    user.setProfilePic(rs.getBytes("profile_pic"));
                    
                    try {
                    	
                    	user.getSavedVehicles().addAll(getSavedVehiclesForUser(rs.getLong("user_id")));
                    	
                    }catch(NullPointerException e) {
                    	
                    }

                    users.add(user);
                }

            } catch (SQLException e) {
                System.out.println("Error retrieving users:");
                e.printStackTrace();
            }

            return users;
        }
        public boolean deleteUser(User user) {
            String sql = "DELETE FROM users WHERE user_id = ?";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setLong(1, user.getId());

                int affectedRows = pstmt.executeUpdate();
                return affectedRows > 0;

            } catch (SQLException e) {
                System.out.println("Error deleting user:");
                e.printStackTrace();
            }
            return false;
        }
        public boolean updateUser(User user) {
            String sql = "UPDATE users SET fname = ?, lname = ?, email = ?, username = ?, phone = ?, password = ?, profile_pic = ? , isadmin = ? " +
                         "WHERE user_id = ?";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setString(1, user.getFirstName());
                pstmt.setString(2, user.getLastName());
                pstmt.setString(3, user.getEmail());
                pstmt.setString(4, user.getUsername());
                pstmt.setString(5, user.getPhone());
                pstmt.setString(6, user.getPassword());
                pstmt.setBytes(7, user.getProfilePic());
                pstmt.setBoolean(8,user.isAdmin());
                pstmt.setLong(9, user.getId());

                int affectedRows = pstmt.executeUpdate();
                return affectedRows > 0;

            } catch (SQLException e) {
                System.out.println("Error updating user:");
                e.printStackTrace();
            }
            return false;
        }

        public void insertVehicle(Vehicle vehicle) {
            String vehicleSql = "INSERT INTO vehicles (brand, model, year, mileage, price, engine, description, location, date_posted, owner_id) " +
                                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) RETURNING vehicle_id";

            String imageSql = "INSERT INTO vehicle_images (vehicle_id, image) VALUES (?, ?)";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement vehicleStmt = conn.prepareStatement(vehicleSql);
                 PreparedStatement imageStmt = conn.prepareStatement(imageSql)) {

                // Set vehicle fields
                vehicleStmt.setString(1, vehicle.getBrand());
                vehicleStmt.setString(2, vehicle.getModel());
                vehicleStmt.setInt(3, vehicle.getYear());
                vehicleStmt.setLong(4, vehicle.getMileage());
                vehicleStmt.setDouble(5, vehicle.getPrice());
                vehicleStmt.setString(6, vehicle.getEngine());
                vehicleStmt.setString(7, vehicle.getDescription());
                vehicleStmt.setString(8, vehicle.getLocation());
                vehicleStmt.setDate(9, java.sql.Date.valueOf(vehicle.getDatePosted()));
                vehicleStmt.setLong(10, vehicle.getOwner().getId()); // assuming User has getUserId()

                // Execute and get vehicle_id
                ResultSet rs = vehicleStmt.executeQuery();
                if (rs.next()) {
                    long vehicleId = rs.getLong("vehicle_id");

                    // Insert images
                    for (byte[] image : vehicle.getImages()) {
System.out.println("Attempting to inser images: " + image.length);
                        imageStmt.setLong(1, vehicleId);
                        imageStmt.setBytes(2, image);
                        imageStmt.addBatch();
                    }

                    imageStmt.executeBatch();
                }

            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error trying to insert a vehicle");            }
        }
        public List<Vehicle> getAllVehicles() {
            List<Vehicle> vehicles = new ArrayList<>();

            String vehicleSql = "SELECT * FROM vehicles";
            String imageSql = "SELECT image FROM vehicle_images WHERE vehicle_id = ?";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement vehicleStmt = conn.prepareStatement(vehicleSql);
                 PreparedStatement imageStmt = conn.prepareStatement(imageSql);
                 ResultSet rs = vehicleStmt.executeQuery()) {

                while (rs.next()) {
                    long vehicleId = rs.getLong("vehicle_id");
                    String brand = rs.getString("brand");
                    String model = rs.getString("model");
                    int year = rs.getInt("year");
                    long mileage = rs.getLong("mileage");
                    double price = rs.getDouble("price");
                    String engine = rs.getString("engine");
                    String description = rs.getString("description");
                    String location = rs.getString("location");
                    LocalDate datePosted = rs.getDate("date_posted").toLocalDate();
                    long ownerId = rs.getLong("owner_id");

                    // Load images
                

                    // Mocking the User (you should load from DB)
                    User owner = getUserById(ownerId);

                    // Create vehicle object
                    Vehicle vehicle = new Vehicle(brand, model, year, mileage, price, engine, description, location);
                    vehicle.setVehicleId(vehicleId);
                    vehicle.setOwner(owner);
                    vehicle.setDatePosted(datePosted);

                    // Add remaining images if any
                    imageStmt.setLong(1, vehicleId);
                    try (ResultSet imgRs = imageStmt.executeQuery()) {
                        while (imgRs.next()) {
                        	vehicle.getImages().add(imgRs.getBytes("image"));
                        }
                    }

                    vehicles.add(vehicle);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return vehicles;
        }
        
        public boolean removeVehicle(Long id) {
            String deleteImagesSql = "DELETE FROM vehicle_images WHERE vehicle_id = ?";
            String deleteVehicleSql = "DELETE FROM vehicles WHERE vehicle_id = ?";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement deleteImagesStmt = conn.prepareStatement(deleteImagesSql);
                 PreparedStatement deleteVehicleStmt = conn.prepareStatement(deleteVehicleSql)) {

                // First delete related images
                deleteImagesStmt.setLong(1, id);
                deleteImagesStmt.executeUpdate();

                // Then delete the vehicle itself
                deleteVehicleStmt.setLong(1, id);
                int affectedRows = deleteVehicleStmt.executeUpdate();

                return affectedRows > 0; // true if a vehicle was deleted

            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }
        
        public void updateVehicle(Vehicle vehicle, boolean imagesUpdated) {
            String updateVehicleSql = "UPDATE vehicles SET brand = ?, model = ?, year = ?, mileage = ?, price = ?, engine = ?, description = ?, location = ?, date_posted = ?, owner_id = ? WHERE vehicle_id = ?";
            String deleteImagesSql = "DELETE FROM vehicle_images WHERE vehicle_id = ?";
            String insertImageSql = "INSERT INTO vehicle_images (vehicle_id, image) VALUES (?, ?)";

            try (Connection conn = DriverManager.getConnection(URL)) {
                conn.setAutoCommit(false); // Start transaction

                // 1. Update vehicle data
                try (PreparedStatement updateVehicleStmt = conn.prepareStatement(updateVehicleSql)) {
                    updateVehicleStmt.setString(1, vehicle.getBrand());
                    updateVehicleStmt.setString(2, vehicle.getModel());
                    updateVehicleStmt.setInt(3, vehicle.getYear());
                    updateVehicleStmt.setLong(4, vehicle.getMileage());
                    updateVehicleStmt.setDouble(5, vehicle.getPrice());
                    updateVehicleStmt.setString(6, vehicle.getEngine());
                    updateVehicleStmt.setString(7, vehicle.getDescription());
                    updateVehicleStmt.setString(8, vehicle.getLocation());
                    updateVehicleStmt.setDate(9, java.sql.Date.valueOf(vehicle.getDatePosted()));
                    updateVehicleStmt.setLong(10, vehicle.getOwner().getId()); // Assuming getUserId() returns long
                    updateVehicleStmt.setLong(11, vehicle.getVehicleId());

                    updateVehicleStmt.executeUpdate();
                }

                if(imagesUpdated) {
                // 2. Delete old images
                try (PreparedStatement deleteImagesStmt = conn.prepareStatement(deleteImagesSql)) {
                    deleteImagesStmt.setLong(1, vehicle.getVehicleId());
                    deleteImagesStmt.executeUpdate();
                }

                // 3. Insert updated image list
                try (PreparedStatement insertImageStmt = conn.prepareStatement(insertImageSql)) {
                    for (byte[] imageData : vehicle.getImages()) {
                        insertImageStmt.setLong(1, vehicle.getVehicleId());
                        insertImageStmt.setBytes(2, imageData);
                        insertImageStmt.addBatch();
                    }
                    insertImageStmt.executeBatch();
                }
            }

                conn.commit(); // Commit transaction
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }


        
        public User getUserById(long ownerId) {
            String sql = "SELECT * FROM users WHERE user_id = ?";
            User user = null;

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setLong(1, ownerId);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                    	 user = new User(rs.getString("fname"),rs.getString("lname"),rs.getString("email"),rs.getString("username"),rs.getString("phone"),rs.getString("password"));
                         user.setUserId(rs.getLong("user_id")); 
                         user.setAdmin(rs.getBoolean("isadmin"));
                         user.setProfilePic(rs.getBytes("profile_pic"));
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return user;
        }
        
        public boolean insertVehicleForUser(long userId, long vehicleId) {
            String sql = "INSERT INTO saved_vehicles (user_id, vehicle_id) VALUES (?, ?)";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setLong(1, userId);
                stmt.setLong(2, vehicleId);

                int rowsInserted = stmt.executeUpdate();
                return rowsInserted > 0;

            } catch (SQLException e) {
                // Handle duplicate key or constraint violations gracefully
                if (e.getSQLState().equals("23505")) { // unique_violation
                    System.out.println("This vehicle is already saved by the user.");
                } else {
                    e.printStackTrace();
                }
                return false;
            }
        }

        public boolean removeSavedVehicleForUser(long userId, long vehicleId) {
            String sql = "DELETE FROM saved_vehicles WHERE user_id = ? AND vehicle_id = ?";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement stmt = conn.prepareStatement(sql)) {

                stmt.setLong(1, userId);
                stmt.setLong(2, vehicleId);

                int rowsDeleted = stmt.executeUpdate();
                return rowsDeleted > 0;

            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        }

        public List<Vehicle> getSavedVehiclesForUser(long userId) {
            List<Vehicle> savedVehicles = new ArrayList<>();

            String sql = "SELECT v.* " +
                         "FROM vehicles v " +
                         "JOIN saved_vehicles sv ON v.vehicle_id = sv.vehicle_id " +
                         "WHERE sv.user_id = ?";

            String imageSql = "SELECT image FROM vehicle_images WHERE vehicle_id = ?";

            try (Connection conn = DriverManager.getConnection(URL);
                 PreparedStatement stmt = conn.prepareStatement(sql);
                 PreparedStatement imageStmt = conn.prepareStatement(imageSql)) {

                stmt.setLong(1, userId);

                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        long vehicleId = rs.getLong("vehicle_id");
                        String brand = rs.getString("brand");
                        String model = rs.getString("model");
                        int year = rs.getInt("year");
                        long mileage = rs.getLong("mileage");
                        double price = rs.getDouble("price");
                        String engine = rs.getString("engine");
                        String description = rs.getString("description");
                        String location = rs.getString("location");
                        LocalDate datePosted = rs.getDate("date_posted").toLocalDate();
                        long ownerId = rs.getLong("owner_id");

                        // Load the owner
                        User owner = getUserById(ownerId); // This should be your method to fetch a user

                        // Construct the vehicle object
                        Vehicle vehicle = new Vehicle(brand, model, year, mileage, price, engine, description, location);
                        vehicle.setVehicleId(vehicleId);
                        vehicle.setOwner(owner);
                        vehicle.setDatePosted(datePosted);

                        // Load images for this vehicle
                        imageStmt.setLong(1, vehicleId);
                        try (ResultSet imgRs = imageStmt.executeQuery()) {
                            while (imgRs.next()) {
                                vehicle.getImages().add(imgRs.getBytes("image"));
                            }
                        }

                        savedVehicles.add(vehicle);
                    }
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

            return savedVehicles;
        }

        
}
