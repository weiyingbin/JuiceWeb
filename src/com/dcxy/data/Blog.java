package com.dcxy.data;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="blog")
public class Blog {
@Id
int id;
int usid;
String username;
String title;
String details;
String photo;
Date btime;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUsid() {
	return usid;
}
public void setUsid(int usid) {
	this.usid = usid;
}
public String getDetails() {
	return details;
}
public void setDetails(String details) {
	this.details = details;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
public Date getBtime() {
	return btime;
}
public void setBtime(Date btime) {
	this.btime = btime;
}
public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}


	
	
}
