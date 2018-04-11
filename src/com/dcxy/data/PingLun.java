package com.dcxy.data;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="pinglun")
public class PingLun {
	@Id
	private int id;
	private String uname;
	private int cid;
	private String neirong;
	private Date ptime;
	private String pphoto;
	public Date getPtime() {
		return ptime;
	}
	public void setPtime(Date ptime) {
		this.ptime = ptime;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getPphoto() {
		return pphoto;
	}
	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	
	public String getNeirong() {
		return neirong;
	}
	public void setNeirong(String neirong) {
		this.neirong = neirong;
	}
	
	
	@Override
	public String toString() {
		return "PingLun [id=" + id + ", uname=" + uname + ", cid=" + cid + ", neirong=" + neirong + ", ptime=" + ptime
				+ ", pphoto=" + pphoto + "]";
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}

	
}
