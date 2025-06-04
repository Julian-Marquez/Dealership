package deal;

import java.util.*;
import java.time.*;

public class Receipt {
	
	private String title = "Receipt Title"; // for now
	private LocalDate date;
	private User user;
	private List<Vehicle> items;
	private Card payment;

	
	public Receipt(LocalDate date, User user,List<Vehicle> items,Card payment) {
		this.date = date;
		this.user = user;
		this.items = items;
		this.payment = payment;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public void setDate(LocalDate date) {
		this.date = date;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setItems(List<Vehicle> items) {
		this.items = items;
	}
	public void setPayment(Card payment) {
		this.payment = payment;
	}
	
	public LocalDate getDate() {
		return this.date;
	}
	
	public User getUser() {
		return this.user;
	}
	
	public List<Vehicle> getItems(){
		return this.items;
	}
	
	public Card getPayment() {
		return this.payment;
	}
	
	public String getTitle() {
		return this.title;
	}
}
