package kh.com.medi.model;

import java.io.Serializable;
/*
CREATE TABLE `medi`.`medi_specialty` (
`doc_seq` INT(8) NOT NULL,
`specialty` VARCHAR(50) NOT NULL,
INDEX `FK_medi_specialty_doc_seq_idx` (`doc_seq` ASC),
CONSTRAINT `FK_medi_specialty_doc_seq`
  FOREIGN KEY (`doc_seq`)
  REFERENCES `medi`.`medi_doctor` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
 * */
public class MediSubjectDto implements Serializable {
	private int doc_seq;		//의사번호
	private String subject;		//병원진료과목
	
	public MediSubjectDto() {
	}

	public MediSubjectDto(int doc_seq, String subject) {
		super();
		this.doc_seq = doc_seq;
		this.subject = subject;
	}

	public int getDoc_seq() {
		return doc_seq;
	}

	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "MediSubjectDto [doc_seq=" + doc_seq + ", subject=" + subject + "]";
	}
	
}
