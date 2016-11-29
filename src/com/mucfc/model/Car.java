package com.mucfc.model;

import java.util.Date;

public class Car {
	private int id;
	private int merid;
	private int userid;
	private Date createdate;
	private int mernum;
	private String mername;
	private String sname;
	private String pic;
	private int merprice;
	private int totalprice;
	private int sellerid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date createdate) {
		this.createdate = createdate;
	}
	public String getMername() {
		return mername;
	}
	public void setMername(String mername) {
		this.mername = mername;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getMerprice() {
		return merprice;
	}
	public void setMerprice(int merprice) {
		this.merprice = merprice;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getMerid() {
		return merid;
	}
	public void setMerid(int merid) {
		this.merid = merid;
	}
	public int getMernum() {
		return mernum;
	}
	public void setMernum(int mernum) {
		this.mernum = mernum;
	}
	public int getSellerid() {
		return sellerid;
	}
	public void setSellerid(int sellerid) {
		this.sellerid = sellerid;
	}
	
}
 