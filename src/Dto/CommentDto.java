package Dto;

import java.io.Serializable;

public class CommentDto  implements Serializable{
	private String myID;
	private String content;
	private int ref;        //부모  seq와 같이 감 
	
	private int del;        //default(0), 삭제(1) 
	private int seq;
	
	
	public String getId() {
		return myID;
	}
	public void setId(String myID) {
		this.myID = myID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}

	public CommentDto(String myID, String content, int ref, int del, int seq) {
		this.myID = myID;
		this.content = content;
		this.ref = ref;
		this.del = del;
		this.seq = seq;
	}
	
	// 입력용 
	public CommentDto(String myID, String content, int ref) {
		this.myID = myID;
		this.content = content;
		this.ref = ref;
	}
	

}