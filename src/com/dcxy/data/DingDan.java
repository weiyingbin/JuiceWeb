package com.dcxy.data;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="dingdan")
public class DingDan {

	@Id
	private int id;
	private int userid;
	private int cid;
	
	private int number;
	private int state;
	private Date ddate;
	
	public Date getDdate() {
		return ddate;
	}
	public void setDdate(Date ddate) {
		this.ddate = ddate;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	
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
	
}
