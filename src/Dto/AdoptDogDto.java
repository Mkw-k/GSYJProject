package Dto;

import java.io.Serializable;

public class AdoptDogDto implements Serializable{

	private int seq;
	private String myid;
	private String wdate;
	private String rdate;
	private String mycontent;
	private String phoneNum;
	private String title;
	private int del;	// 게시글 삭제
	
	
	public AdoptDogDto() {
		// TODO Auto-generated constructor stub
	}



	
	public AdoptDogDto(String myid, String rdate, String mycontent, String phoneNum, String title) {
		super();
		this.myid = myid;
		this.rdate = rdate;
		this.mycontent = mycontent;
		this.phoneNum = phoneNum;
		this.title = title;
	}



	public AdoptDogDto(int seq, String myid, String wdate, String rdate, String mycontent, String phoneNum,
			String title, int del) {
		super();
		this.seq = seq;
		this.myid = myid;
		this.wdate = wdate;
		this.rdate = rdate;
		this.mycontent = mycontent;
		this.phoneNum = phoneNum;
		this.title = title;
		this.del = del;
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





	public String getWdate() {
		return wdate;
	}





	public void setWdate(String wdate) {
		this.wdate = wdate;
	}





	public String getRdate() {
		return rdate;
	}





	public void setRdate(String rdate) {
		this.rdate = rdate;
	}





	public String getMycontent() {
		return mycontent;
	}





	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}





	public String getPhoneNum() {
		return phoneNum;
	}





	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}





	public int getDel() {
		return del;
	}





	public void setDel(int del) {
		this.del = del;
	}





	@Override
	public String toString() {
		return "AdoptDogDto [seq=" + seq + ", myid=" + myid + ", wdate=" + wdate + ", rdate=" + rdate + ", mycontent="
				+ mycontent + ", phoneNum=" + phoneNum + ", title=" + title + ", del=" + del + "]";
	}
	
	
	
	/*
	public AdoptDogDto(int seq, String myid, String wdate, String rdate, String mycontent, String phoneNum, String title) {
		super();
		this.seq = seq;					// 시퀀스
		this.myid = myid;				// 아이디
		this.wdate = wdate;				// 작성일
		this.rdate = rdate;				// 입양희망일
		this.mycontent = mycontent;		// 내용
		this.phoneNum = phoneNum;		// 연락처
		this.title = title;				// 제목
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


	public String getWdate() {
		return wdate;
	}


	public void setWdate(String wdate) {
		this.wdate = wdate;
	}


	public String getRdate() {
		return rdate;
	}


	public void setRdate(String rdate) {
		this.rdate = rdate;
	}


	public String getMycontent() {
		return mycontent;
	}


	public void setMycontent(String mycontent) {
		this.mycontent = mycontent;
	}


	public String getPhoneNum() {
		return phoneNum;
	}


	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	@Override
	public String toString() {
		return "AdoptDogDto [seq=" + seq + ", myid=" + myid + ", wdate=" + wdate + ", rdate=" + rdate + ", mycontent="
				+ mycontent + ", phoneNum=" + phoneNum + ", title=" + title + "]";
	}
	
	*/
}
