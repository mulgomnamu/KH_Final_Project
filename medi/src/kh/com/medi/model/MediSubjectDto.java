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
	private int hos_seq;		//의사번호
	private String subject;		//병원진료과목
	private MediMember_hDto medimember_hdto;
	public MediSubjectDto() {
	}
	public MediSubjectDto(int hos_seq, String subject, MediMember_hDto medimember_hdto) {
		super();
		this.hos_seq = hos_seq;
		this.subject = subject;
		this.medimember_hdto = medimember_hdto;
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
	public MediMember_hDto getMedimember_hdto() {
		return medimember_hdto;
	}
	public void setMedimember_hdto(MediMember_hDto medimember_hdto) {
		this.medimember_hdto = medimember_hdto;
	}
	@Override
	public String toString() {
		return "MediSubjectDto [hos_seq=" + hos_seq + ", subject=" + subject + ", medimember_hdto=" + medimember_hdto
				+ "]";
	}
	
	
	
	
}
