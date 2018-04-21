package kh.com.medi.model;

import java.io.Serializable;

/*
DROP TABLE BBS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BBS;

CREATE TABLE BBS(
	SEQ NUMBER(8) PRIMARY KEY,
	ID VARCHAR2(50) NOT NULL,
	
	REF NUMBER(8) NOT NULL,
	STEP NUMBER(8) NOT NULL,
	DEPTH NUMBER(8) NOT NULL,
	
	QUESTION VARCHAR2(100) NOT NULL,
	TITLE VARCHAR2(200) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	WDATE DATE NOT NULL,
	MEMCHOICE VARCHAR2(100) NOT NULL,
	PARENT NUMBER(8) NOT NULL,
	
	DEL NUMBER(1) NOT NULL,
	READCOUNT NUMBER(8) NOT NULL
);

CREATE SEQUENCE SEQ_BBS
START WITH 1 INCREMENT BY 1;

ALTER TABLE BBS
ADD CONSTRAINT FK_BBS_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

*/

public class MediQnaBbsDto implements Serializable{

	
	
	private int seq;
	private String id;
	
	private int ref;	// 그룹번호
	private int step;	// 열번호
	private int depth;	// 깊이
	
	private String question;
	private String title;
	private String content;
	private String wdate;
	private int memchoice;
	private int parent;	// 부모글
	
	private int del;	// 삭제
	private int readcount;
	
	public MediQnaBbsDto() {}

	public MediQnaBbsDto(int seq, String id, int ref, int step, int depth, String question, String title,
			String content, String wdate, int memchoice, int parent, int del, int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.question = question;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.memchoice = memchoice;
		this.parent = parent;
		this.del = del;
		this.readcount = readcount;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getMemchoice() {
		return memchoice;
	}

	public void setMemchoice(int memchoice) {
		this.memchoice = memchoice;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
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
		return "MediQnaBbsDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", question=" + question + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", memchoice=" + memchoice + ", parent=" + parent + ", del=" + del + ", readcount=" + readcount + "]";
	}
	
	
	
	
}
