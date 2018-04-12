package kh.com.medi.model;

import java.io.Serializable;
/*
CREATE TABLE `medi`.`medi_subject` (
`hos_seq` INT(8) NOT NULL,
`subject` VARCHAR(50) NOT NULL,
INDEX `FK_medi_subject_hos_seq_idx` (`hos_seq` ASC),
CONSTRAINT `FK_medi_subject_hos_seq`
  FOREIGN KEY (`hos_seq`)
  REFERENCES `medi`.`medi_hospital` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
 * */
public class MediSubjectDto implements Serializable {
	private int hos_seq;		//병원번호
	private String subject;		//병원진료과목
	
	public MediSubjectDto() {
	}

	public MediSubjectDto(int hos_seq, String subject) {
		super();
		this.hos_seq = hos_seq;
		this.subject = subject;
	}

	public int getHos_seq() {
		return hos_seq;
	}

	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "MediSubjectDto [hos_seq=" + hos_seq + ", subject=" + subject + "]";
	}
	
	
}
