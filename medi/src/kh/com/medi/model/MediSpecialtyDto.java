package kh.com.medi.model;

import java.io.Serializable;
/*
CREATE TABLE `medi`.`medi_specialty` (
`hos_seq` INT(8) NOT NULL,
`specialty` VARCHAR(50) NOT NULL,
INDEX `FK_medi_specialty_hos_seq_idx` (`hos_seq` ASC),
CONSTRAINT `FK_medi_specialty_hos_seq`
  FOREIGN KEY (`hos_seq`)
  REFERENCES `medi`.`medi_hospital` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);

 * */
public class MediSpecialtyDto implements Serializable {
	private int doc_seq;		//병원번호
	private String specialty;	//병원디테일에뿌릴진료분야 -> 의사가입하면서 선택되는것들이저장될것이다
	private MediMember_hDto medimember_hdto;
	
	public MediSpecialtyDto() {
	}
	
	public MediSpecialtyDto(int doc_seq, String specialty) {
		super();
		this.doc_seq = doc_seq;
		this.specialty = specialty;
	}
	
	public MediSpecialtyDto(int doc_seq, String specialty, MediMember_hDto medimember_hdto) {
		super();
		this.doc_seq = doc_seq;
		this.specialty = specialty;
		this.medimember_hdto = medimember_hdto;
	}

	public MediMember_hDto getMedimember_hdto() {
		return medimember_hdto;
	}

	public void setMedimember_hdto(MediMember_hDto medimember_hdto) {
		this.medimember_hdto = medimember_hdto;
	}

	public int getDoc_seq() {
		return doc_seq;
	}

	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	@Override
	public String toString() {
		return "MediSpecialtyDto [doc_seq=" + doc_seq + ", specialty=" + specialty + "]";
	}
	
	
}
