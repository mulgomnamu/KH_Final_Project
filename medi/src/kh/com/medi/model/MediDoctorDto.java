package kh.com.medi.model;

import java.io.Serializable;
/*
CREATE TABLE `medi`.`medi_doctor` (
`seq` INT(8) NOT NULL,
`hos_seq` INT(8) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`specialty` VARCHAR(50) NOT NULL,
`REGDATE` DATETIME NOT NULL,
`doc_profile` VARCHAR(100) NOT NULL,
`doc_content` VARCHAR(500) NOT NULL,
PRIMARY KEY (`seq`),
INDEX `FK_medi_doctor_hos_seq_idx` (`hos_seq` ASC),
CONSTRAINT `FK_medi_doctor_hos_seq`
  FOREIGN KEY (`hos_seq`)
  REFERENCES `medi`.`medi_hospital` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);

 * */
public class MediDoctorDto implements Serializable {
	private int seq;
	private int hos_seq;		//병원번호
	private String name;		//의사이름
	private String specialty;	//진료분야 EX) 감기, 내시경 
	private String regdate;		//의사가입날짜
	private String doc_profile;	//의사프로필사진
	private String doc_content;	//의사설명
	
	public MediDoctorDto() {
	}

	
	public MediDoctorDto(int seq, int hos_seq, String name, String specialty, String regdate, String doc_profile,
			String doc_content) {
		super();
		this.seq = seq;
		this.hos_seq = hos_seq;
		this.name = name;
		this.specialty = specialty;
		this.regdate = regdate;
		this.doc_profile = doc_profile;
		this.doc_content = doc_content;
	}

	
	public String getDoc_profile() {
		return doc_profile;
	}


	public void setDoc_profile(String doc_profile) {
		this.doc_profile = doc_profile;
	}


	public String getDoc_content() {
		return doc_content;
	}


	public void setDoc_content(String doc_content) {
		this.doc_content = doc_content;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "MediDoctorDto [seq=" + seq + ", hos_seq=" + hos_seq + ", name=" + name + ", specialty=" + specialty
				+ ", regdate=" + regdate + ", doc_profile=" + doc_profile + ", doc_content=" + doc_content + "]";
	}

	
	
}
