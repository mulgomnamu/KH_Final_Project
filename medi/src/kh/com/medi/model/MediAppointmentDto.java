package kh.com.medi.model;

import java.io.Serializable;
/*
 * 
CREATE TABLE `medi`.`medi_reservation` (
`seq` INT(8) NOT NULL AUTO_INCREMENT,
`mem_seq` INT(8) NOT NULL,
`hos_seq` INT(8) NOT NULL,
`doc_seq` INT(8) NOT NULL,
`content` VARCHAR(4000) NOT NULL,
`day` DATE NOT NULL,
`time` TIME NOT NULL,
`wdate` DATETIME NOT NULL,
`type` INT(1) NOT NULL,
PRIMARY KEY (`seq`),
INDEX `FK_medi_reservation_mem_seq_idx` (`mem_seq` ASC),
INDEX `FK_medi_reservation_idx` (`hos_seq` ASC),
INDEX `FK_medi_reservation_doc_seq_idx` (`doc_seq` ASC),
CONSTRAINT `FK_medi_reservation_mem_seq`
  FOREIGN KEY (`mem_seq`)
  REFERENCES `medi`.`medi_member` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT `FK_medi_reservation_hos_seq`
  FOREIGN KEY (`hos_seq`)
  REFERENCES `medi`.`medi_hospital` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
CONSTRAINT `FK_medi_reservation_doc_seq`
  FOREIGN KEY (`doc_seq`)
  REFERENCES `medi`.`medi_doctor` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
 * */
public class MediAppointmentDto implements Serializable {
	private int seq;			
	private int mem_seq;		//개인회원번호
	private int hos_seq;		//병원번호
	private int doc_seq;		//의사번호
	private String content;		//증상
	private String day;			//20180411
	private String time;		//09:00
	private int type;			//기본진료(0) 화상진료(1)
	
	public MediAppointmentDto() {
	}

	public MediAppointmentDto(int seq, int mem_seq, int hos_seq, int doc_seq, String content, String day, String time,
			int type) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.hos_seq = hos_seq;
		this.doc_seq = doc_seq;
		this.content = content;
		this.day = day;
		this.time = time;
		this.type = type;
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

	public int getHos_seq() {
		return hos_seq;
	}

	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}

	public int getDoc_seq() {
		return doc_seq;
	}

	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "MediAppointmentDto [seq=" + seq + ", mem_seq=" + mem_seq + ", hos_seq=" + hos_seq + ", doc_seq="
				+ doc_seq + ", content=" + content + ", day=" + day + ", time=" + time + ", type=" + type + "]";
	}

	
}
