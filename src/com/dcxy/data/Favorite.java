package com.dcxy.data;



import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="favorite")
public class Favorite {

	@Id
	private int id;
	private int userid;
	private int proid;
	private Date date;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "Favorite [id=" + id + ", userid=" + userid + ", proid=" + proid + ", date=" + date + "]";
	}
	
	
	
}
