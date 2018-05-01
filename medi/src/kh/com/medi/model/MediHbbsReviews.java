package kh.com.medi.model;

import java.io.Serializable;

public class MediHbbsReviews implements Serializable {
	
	private int seq;
	private int hos_seq;
	private String id;
	private String content;
	private int del;
	private String rdate;
	private int stars;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getHos_seq() {
		return hos_seq;
	}
	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getStars() {
		return stars;
	}
	public void setStars(int stars) {
		this.stars = stars;
	}
	
	public MediHbbsReviews() {
	}
	
	public MediHbbsReviews(int seq, int hos_seq, String id, String content, int del, String rdate, int stars) {
		super();
		this.seq = seq;
		this.hos_seq = hos_seq;
		this.id = id;
		this.content = content;
		this.del = del;
		this.rdate = rdate;
		this.stars = stars;
	}
	@Override
	public String toString() {
		return "MediHbbsReviews [seq=" + seq + ", hos_seq=" + hos_seq + ", id=" + id + ", content=" + content + ", del="
				+ del + ", rdate=" + rdate + ", stars=" + stars + "]";
	}
	
}
