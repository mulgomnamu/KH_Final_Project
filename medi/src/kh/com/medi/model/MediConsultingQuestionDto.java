package kh.com.medi.model;

import java.io.Serializable;
/*
//건강정보 질문
CREATE TABLE `medi`.`medi_question` (
  
`seq` INT(8) NOT NULL AUTO_INCREMENT,
 
`mem_seq` INT(8) NOT NULL,
 
`wid` VARCHAR(50) NOT NULL,
`title` VARCHAR(50) NOT NULL,

 `content` VARCHAR(4000) NOT NULL,
 
`category` VARCHAR(50) NOT NULL,
 
`readcount` INT(8) NOT NULL,
 
`commentcount` INT(8) NOT NULL,
 
`selectyn` INT(1) NOT NULL,
 
`del` INT(1) NOT NULL,
 
`wdate` DATETIME NOT NULL,
 
PRIMARY KEY (`seq`),
 
INDEX `FK_medi_question_mem_seq_idx`
(`mem_seq` ASC),
 
CONSTRAINT `FK_medi_question_mem_seq`
  
FOREIGN KEY (`mem_seq`)
    
REFERENCES `medi`.`medi_member` (`seq`)
    
ON DELETE NO ACTION
   
 ON UPDATE NO ACTION);
 * */
public class MediConsultingQuestionDto implements Serializable {
	private int seq;
	private int mem_seq;
	private String wid;
	private String title;
	private String content;
	private String category;		//진료분야
	private int readcount;
	private int commentcount;
	private int selectyn;			//채택된질문이야아니냐
	private int del;
	private String wdate;
	
	public MediConsultingQuestionDto() {
	}

	

	public MediConsultingQuestionDto(int seq, int mem_seq, String wid, String title, String content, String category,
			int readcount, int commentcount, int selectyn, int del, String wdate) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.wid = wid;
		this.title = title;
		this.content = content;
		this.category = category;
		this.readcount = readcount;
		this.commentcount = commentcount;
		this.selectyn = selectyn;
		this.del = del;
		this.wdate = wdate;
	}


	

	public String getWid() {
		return wid;
	}



	public void setWid(String wid) {
		this.wid = wid;
	}



	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getMem_seq() {
		return mem_seq;
	}

	public void setMem_seq(int mem_seq) {
		this.mem_seq = mem_seq;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getCommentcount() {
		return commentcount;
	}

	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}

	public int getSelectyn() {
		return selectyn;
	}

	public void setSelectyn(int selectyn) {
		this.selectyn = selectyn;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}



	@Override
	public String toString() {
		return "MediConsultingQuestionDto [seq=" + seq + ", mem_seq=" + mem_seq + ", wid=" + wid + ", title=" + title
				+ ", content=" + content + ", category=" + category + ", readcount=" + readcount + ", commentcount="
				+ commentcount + ", selectyn=" + selectyn + ", del=" + del + ", wdate=" + wdate + "]";
	}

	
	
	
}
