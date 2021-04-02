package Dto;

import java.io.Serializable;

public class RescuedDogDto implements Serializable {
	private int seq;              //시퀀스
	private String wdate;         //작성일
	private int vcount;           //조회수
	private int condition;	      //입양진행유무 (0:default, 1:입양진행중, 2:입양완료)
	
	private String title;         //제목
	private String myContent;     //내용
	private String filename;      //앞에서 받아온 파일 이름
	private String newfilename;   //새로 업로드한 파일 이름
	private int del;              //삭제유무 (0:default, 1:삭제)
	
	
	
	
	public RescuedDogDto(String title, String myContent, String filename, String newfilename) {
		this.title = title;
		this.myContent = myContent;
		this.filename = filename;
		this.newfilename = newfilename;
	}




	public RescuedDogDto(int seq, String wdate, int vcount, int condition, String title, String myContent,
			String filename, String newfilename, int del) {
		this.seq = seq;
		this.wdate = wdate;
		this.vcount = vcount;
		this.condition = condition;
		this.title = title;
		this.myContent = myContent;
		this.filename = filename;
		this.newfilename = newfilename;
		this.del = del;
	}




	public int getSeq() {
		return seq;
	}




	public void setSeq(int seq) {
		this.seq = seq;
	}




	@Override
	public String toString() {
		return "RescuedDogDto [seq=" + seq + ", wdate=" + wdate + ", vcount=" + vcount + ", condition=" + condition
				+ ", title=" + title + ", myContent=" + myContent + ", filename=" + filename + ", newfilename="
				+ newfilename + ", del=" + del + "]";
	}




	public String getWdate() {
		return wdate;
	}




	public void setWdate(String wdate) {
		this.wdate = wdate;
	}




	public int getVcount() {
		return vcount;
	}




	public void setVcount(int vcount) {
		this.vcount = vcount;
	}




	public int getCondition() {
		return condition;
	}




	public void setCondition(int condition) {
		this.condition = condition;
	}




	public String getTitle() {
		return title;
	}




	public void setTitle(String title) {
		this.title = title;
	}




	public String getMyContent() {
		return myContent;
	}




	public void setMyContent(String myConent) {
		this.myContent = myConent;
	}




	public String getFilename() {
		return filename;
	}




	public void setFilename(String filename) {
		this.filename = filename;
	}




	public String getNewfilename() {
		return newfilename;
	}




	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}




	public int getDel() {
		return del;
	}




	public void setDel(int del) {
		this.del = del;
	}

	
	
	
	
}




