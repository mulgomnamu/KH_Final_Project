package kh.com.medi.model;

import java.io.Serializable;
/*
//건강정보 답변
CREATE TABLE `medi`.`medi_consulting_answer` (
 
`ans_seq` INT(8) NOT NULL AUTO_INCREMENT,

`hos_seq` INT(8) NOT NULL,

`whos_name` VARCHAR(50) NOT NULL,
`content` VARCHAR(4000) NOT NULL,

`parent` INT(8) NOT NULL,

`ans_del` INT(1) NOT NULL,
`ans_wdate` DATETIME NOT NULL,

PRIMARY KEY (`seq`),

INDEX `FK_medi_answer_hos_seq_idx` (`hos_seq` ASC),
  
CONSTRAINT `FK_medi_answer_hos_seq`
    
FOREIGN KEY (`hos_seq`)
   
 REFERENCES `medi`.`medi_hospital` (`seq`)
    
ON DELETE NO ACTION
    
ON UPDATE NO ACTION);



 * */
public class MediConsultingAnswerDto implements Serializable {
	private int ans_seq;
	private int hos_seq;
	private String whos_name;
	private String content;
	private int parent;			//질문글의seq
	private int ans_del;
	private String ans_wdate;
	private MediMember_hDto medimember_hdto;
	public MediConsultingAnswerDto() {}
	public MediConsultingAnswerDto(int ans_seq, int hos_seq, String whos_name, String content, int parent, int ans_del,
			String ans_wdate, MediMember_hDto medimember_hdto) {
		super();
		this.ans_seq = ans_seq;
		this.hos_seq = hos_seq;
		this.whos_name = whos_name;
		this.content = content;
		this.parent = parent;
		this.ans_del = ans_del;
		this.ans_wdate = ans_wdate;
		this.medimember_hdto = medimember_hdto;
	}
	public int getAns_seq() {
		return ans_seq;
	}
	public void setAns_seq(int ans_seq) {
		this.ans_seq = ans_seq;
	}
	public int getHos_seq() {
		return hos_seq;
	}
	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}
	public String getWhos_name() {
		return whos_name;
	}
	public void setWhos_name(String whos_name) {
		this.whos_name = whos_name;
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
	public int getAns_del() {
		return ans_del;
	}
	public void setAns_del(int ans_del) {
		this.ans_del = ans_del;
	}
	public String getAns_wdate() {
		return ans_wdate;
	}
	public void setAns_wdate(String ans_wdate) {
		this.ans_wdate = ans_wdate;
	}
	public MediMember_hDto getMedimember_hdto() {
		return medimember_hdto;
	}
	public void setMedimember_hdto(MediMember_hDto medimember_hdto) {
		this.medimember_hdto = medimember_hdto;
	}
	@Override
	public String toString() {
		return "MediConsultingAnswerDto [ans_seq=" + ans_seq + ", hos_seq=" + hos_seq + ", whos_name=" + whos_name
				+ ", content=" + content + ", parent=" + parent + ", ans_del=" + ans_del + ", ans_wdate=" + ans_wdate
				+ ", medimember_hdto=" + medimember_hdto + "]";
	}

	
	
	
	
	
}
