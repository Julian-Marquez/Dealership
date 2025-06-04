package deal;

import java.time.LocalDate;

public class Card {
	
	private int cvv;
	private String nameHolder;
	private String cardNum;
	private LocalDate expiry;
	private long paymentId;
	private String type;
	
	public Card(int cvv, String nameHolder, String cardNum, LocalDate expiry,String type) {
		this.cvv = cvv;
		this.nameHolder= nameHolder;
		this.cardNum = cardNum;
		this.expiry = expiry;
		this.type = type;
	}
	
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	
	public void setNameHolder(String nameHolder) {
		this.nameHolder = nameHolder;
	}
	public void cardNum(String cardNum) {
		this.cardNum = cardNum;
	}
	
	public void setExperiy(LocalDate expiry) {
		this.expiry = expiry;
	}
	
	public void setPaymentId(long id ) {
		this.paymentId =  id;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
	public int getCvv() {
		return this.cvv;
	}
	
	public String getNameHolder() {
		return this.nameHolder;
	}
	public String getCardNumber() {
		return this.cardNum;
	}
	
	public LocalDate getExpiry() {
		return this.expiry;
	}
	public long getPaymentId() {
		return this.paymentId;
	}

	public String getType() {
		return this.type;
	}
}
