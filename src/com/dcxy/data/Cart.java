package com.dcxy.data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="cart")
public class Cart {
 
	@Id
	int id;
	int userId;
	
	int itemId;
	
	int amount;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getItemId() {
		return itemId;
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	
	
	
	public int getAmount() {
		return amount;
	}
	
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
}
