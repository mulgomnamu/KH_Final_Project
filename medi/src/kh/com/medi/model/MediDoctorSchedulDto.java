package kh.com.medi.model;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

/*
 CREATE TABLE `medi`.`medi_schedul` (
`seq` INT(8) NOT NULL,
`doc_seq` INT(8) NOT NULL,
`day` VARCHAR(50) NOT NULL,
`start_time` TIME NOT NULL,
`end_time` TIME NOT NULL,
`lunch_time` TIME NOT NULL,
PRIMARY KEY (`seq`),
INDEX `FK_medi_schedul_doc_seq_idx` (`doc_seq` ASC),
CONSTRAINT `FK_medi_schedul_doc_seq`
  FOREIGN KEY (`doc_seq`)
  REFERENCES `medi`.`medi_doctor` (`seq`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION);
 * */
public class MediDoctorSchedulDto implements Serializable {
	private int seq;
	private int doc_seq;		//의사번호
	private String day;			//월요일 가능요일추가될때마다 row가생성된다
	private String start_time;	//09:00:00
	private String end_time;	//13:30:00 start_time~end_time-lunch_time으로 30분씩으로나눠서표현해준다
	private String lunch_time;	//12:00:00 입력받으면 그후한시간은막아야된다
	
	private String[] list_day;
	private String[] s_time;
	private String[] e_time;
	private String[] l_time;
	
	
	public MediDoctorSchedulDto() {
	}
	public MediDoctorSchedulDto(int seq, int doc_seq, String day, String start_time, String end_time,
			String lunch_time) {
		super();
		this.seq = seq;
		this.doc_seq = doc_seq;
		this.day = day;
		this.start_time = start_time;
		this.end_time = end_time;
		this.lunch_time = lunch_time;
	}
	public MediDoctorSchedulDto(int seq, int doc_seq, String day, String start_time, String end_time, String lunch_time,
			String[] list_day, String[] s_time, String[] e_time, String[] l_time) {
		super();
		this.seq = seq;
		this.doc_seq = doc_seq;
		this.day = day;
		this.start_time = start_time;
		this.end_time = end_time;
		this.lunch_time = lunch_time;
		this.list_day = list_day;
		this.s_time = s_time;
		this.e_time = e_time;
		this.l_time = l_time;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getDoc_seq() {
		return doc_seq;
	}
	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String start_time) {
		this.start_time = start_time;
	}
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String end_time) {
		this.end_time = end_time;
	}
	public String getLunch_time() {
		return lunch_time;
	}
	public void setLunch_time(String lunch_time) {
		this.lunch_time = lunch_time;
	}
	public String[] getList_day() {
		return list_day;
	}
	public void setList_day(String[] list_day) {
		this.list_day = list_day;
	}
	public String[] getS_time() {
		return s_time;
	}
	public void setS_time(String[] s_time) {
		this.s_time = s_time;
	}
	public String[] getE_time() {
		return e_time;
	}
	public void setE_time(String[] e_time) {
		this.e_time = e_time;
	}
	public String[] getL_time() {
		return l_time;
	}
	public void setL_time(String[] l_time) {
		this.l_time = l_time;
	}
	@Override
	public String toString() {
		return "MediDoctorSchedulDto [seq=" + seq + ", doc_seq=" + doc_seq + ", day=" + day + ", start_time="
				+ start_time + ", end_time=" + end_time + ", lunch_time=" + lunch_time + ", list_day="
				+ Arrays.toString(list_day) + ", s_time=" + Arrays.toString(s_time) + ", e_time="
				+ Arrays.toString(e_time) + ", l_time=" + Arrays.toString(l_time) + "]";
	}
	
	
}
