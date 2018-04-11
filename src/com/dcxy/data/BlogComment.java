package com.dcxy.data;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="blogcomment")
public class BlogComment {
	
	@Id
	int id;
	int usid;
	String uname;
	String detalis;
	Date btime;
	int bid;
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
	
	
	public String getDetalis() {
		return detalis;
	}
	public void setDetalis(String detalis) {
		this.detalis = detalis;
	}
	public Date getBtime() {
		return btime;
	}
	public void setBtime(Date btime) {
		this.btime = btime;
	}
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}


		
		
	}
	
