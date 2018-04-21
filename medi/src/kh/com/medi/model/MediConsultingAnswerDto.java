package kh.com.medi.model;

import java.io.Serializable;
/*
//건강정보 답변
CREATE TABLE `medi`.`medi_answer` (
 
`seq` INT(8) NOT NULL AUTO_INCREMENT,

`hos_seq` INT(8) NOT NULL,

`whos_name` VARCHAR(50) NOT NULL,
`content` VARCHAR(4000) NOT NULL,

`parent` INT(8) NOT NULL,

`del` INT(1) NOT NULL,
`wdate` DATETIME NOT NULL,

PRIMARY KEY (`seq`),

INDEX `FK_medi_answer_hos_seq_idx` (`hos_seq` ASC),
  
CONSTRAINT `FK_medi_answer_hos_seq`
    
FOREIGN KEY (`hos_seq`)
   
 REFERENCES `medi`.`medi_hospital` (`seq`)
    
ON DELETE NO ACTION
    
ON UPDATE NO ACTION);



 * */
public class MediConsultingAnswerDto implements Serializable {
	private int seq;
	private int hos_seq;
	private String whos_name;
	private String content;
	private int parent;			//질문글의seq
	private int del;
	private String wdate;
	
	public MediConsultingAnswerDto() {}

	

	public MediConsultingAnswerDto(int seq, int hos_seq, String whos_name, String content, int parent, int del,
			String wdate) {
		super();
		this.seq = seq;
		this.hos_seq = hos_seq;
		this.whos_name = whos_name;
		this.content = content;
		this.parent = parent;
		this.del = del;
		this.wdate = wdate;
	}


	

	public String getWhos_name() {
		return whos_name;
	}



	public void setWhos_name(String whos_name) {
		this.whos_name = whos_name;
	}



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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}



	@Override
	public String toString() {
		return "MediConsultingAnswerDto [seq=" + seq + ", hos_seq=" + hos_seq + ", whos_name=" + whos_name
				+ ", content=" + content + ", parent=" + parent + ", del=" + del + ", wdate=" + wdate + "]";
	}

	
	
}
