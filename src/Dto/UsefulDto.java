package Dto;

import java.io.Serializable;

public class UsefulDto implements Serializable{
	private int rnum;
	private int seq;
	private String myid;
	private String title;
	private String mycontent;
	private String wdate;
	private String link;
	private int del;
	private int readcount;
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMycontent() {
		return mycontent;
	}
	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	@Override
	public String toString() {
		return "UsefulDto [rnum=" + rnum + ", seq=" + seq + ", myid=" + myid + ", title=" + title + ", mycontent="
				+ mycontent + ", wdate=" + wdate + ", link=" + link + ", del=" + del + ", readcount=" + readcount + "]";
	}
	public UsefulDto(int rnum, int seq, String myid, String title, String mycontent, String wdate, String link, int del,
			int readcount) {
		super();
		this.rnum = rnum;
		this.seq = seq;
		this.myid = myid;
		this.title = title;
		this.mycontent = mycontent;
		this.wdate = wdate;
		this.link = link;
		this.del = del;
		this.readcount = readcount;
	}
	public UsefulDto(String title, String mycontent, String wdate, String link) {
		super();
		this.title = title;
		this.mycontent = mycontent;
		this.wdate = wdate;
		this.link = link;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
