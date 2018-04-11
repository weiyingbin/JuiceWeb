package com.dcxy.data;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="user")
public class User {

	@Id
	private int id;
	private String name;
	private String email;
	private String phone;
	private String pwd;
	private String address;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPho(String phone) {
		this.phone = phone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public void setId(int id) {
		this.id = id;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", pwd=" + pwd
				+ ", address=" + address + "]";
	}
	
}
