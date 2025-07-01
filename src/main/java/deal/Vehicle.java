package deal;

import java.time.LocalDate;
import java.util.*;

public class Vehicle {
	
	private String brand;
	private String model;
	private int year;
	private long mileage;
	private double price;
	private String engine;
	private String location;
	private List<byte[]> images;
	private User owner;
	private long vehicleId;
	private String dsecription;
	private LocalDate datePosted;
	
	
	public Vehicle(String brand, String model,int year,long mileage,double price,String engine,String dsecription,String location) {
		this.brand = brand;
		this.model = model;
		this.year = year;
		this.mileage = mileage;
		this.price = price;
		this.engine = engine;
		this.dsecription = dsecription;
		this.location = location;
		this.images = new ArrayList<>();
	}
	
	public void setBrand(String brand) {
		this.brand = brand;
	}
	
	public void setModel(String model) {
		this.model = model;
	}
	
	public void setYear(int year) {
		this.year = year;
	}
	
	public void setMileage(long mileage) {
		this.mileage = mileage;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public void setVehicleId(long id) {
		this.vehicleId = id;
	}
	
	public void setOwner(User owner) {
		this.owner = owner;
	}
	
	public void setEngine(String engine) {
		this.engine = engine;
	}
	
	public void setDescription(String des) {
		this.dsecription = des;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}
	
	public void setDatePosted(LocalDate date) {
		this.datePosted = date;
	}
	
	public String getBrand() {
		return this.brand;
	}
	public String getModel() {
		return this.model;
	}
	public int getYear() {
		return this.year;
	}
	public long getMileage() {
		return this.mileage;
	}
	public double getPrice() {
		return this.price;
	}
	public List<byte[]> getImages(){
		return this.images;
	}
	public User getOwner() {
		return this.owner;
	}
	public long getVehicleId() {
		return this.vehicleId;
	}
	
	public String getEngine() {
		return this.engine;
	}
	
	public String getDescription() {
		return this.dsecription;
	}
	public String getLocation() {
		return this.location;
	}
	public LocalDate getDatePosted() {
		return this.datePosted;
	}

}
