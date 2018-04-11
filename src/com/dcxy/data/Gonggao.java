package com.dcxy.data;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="gonggao")
public class Gonggao {
	@Id
	private int gid;
	private String  gname;	
	private String  gneirong;
	private Date gtime;	
	private String  gphoto;
	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGneirong() {
		return gneirong;
	}
	public void setGneirong(String gneirong) {
		this.gneirong = gneirong;
	}
	public Date getGtime() {
		return gtime;
	}
	public void setGtime(Date gtime) {
		this.gtime = gtime;
	}
	public String getGphoto() {
		return gphoto;
	}
	public void setGphoto(String gphoto) {
		this.gphoto = gphoto;
	}
	
	
	
	
	
	
	
	

}
