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
	
	private String start_hour;
	private String start_min;
	private String end_hour;
	private String end_min;
	private String lunch_hour;
	private String lunch_min;
	
	
	public MediDoctorSchedulDto() {
	}
	public MediDoctorSchedulDto(int seq, int doc_seq, String day, String start_time, String end_time, String lunch_time,
			String[] list_day, String[] s_time, String[] e_time, String[] l_time, String start_hour, String start_min,
			String end_hour, String end_min, String lunch_hour, String lunch_min) {
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
		this.start_hour = start_hour;
		this.start_min = start_min;
		this.end_hour = end_hour;
		this.end_min = end_min;
		this.lunch_hour = lunch_hour;
		this.lunch_min = lunch_min;
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
	public String getStart_hour() {
		return start_hour;
	}
	public void setStart_hour(String start_hour) {
		this.start_hour = start_hour;
	}
	public String getStart_min() {
		return start_min;
	}
	public void setStart_min(String start_min) {
		this.start_min = start_min;
	}
	public String getEnd_hour() {
		return end_hour;
	}
	public void setEnd_hour(String end_hour) {
		this.end_hour = end_hour;
	}
	public String getEnd_min() {
		return end_min;
	}
	public void setEnd_min(String end_min) {
		this.end_min = end_min;
	}
	public String getLunch_hour() {
		return lunch_hour;
	}
	public void setLunch_hour(String lunch_hour) {
		this.lunch_hour = lunch_hour;
	}
	public String getLunch_min() {
		return lunch_min;
	}
	public void setLunch_min(String lunch_min) {
		this.lunch_min = lunch_min;
	}
	@Override
	public String toString() {
		return "MediDoctorSchedulDto [seq=" + seq + ", doc_seq=" + doc_seq + ", day=" + day + ", start_time="
				+ start_time + ", end_time=" + end_time + ", lunch_time=" + lunch_time + ", list_day="
				+ Arrays.toString(list_day) + ", s_time=" + Arrays.toString(s_time) + ", e_time="
				+ Arrays.toString(e_time) + ", l_time=" + Arrays.toString(l_time) + ", start_hour=" + start_hour
				+ ", start_min=" + start_min + ", end_hour=" + end_hour + ", end_min=" + end_min + ", lunch_hour="
				+ lunch_hour + ", lunch_min=" + lunch_min + "]";
	}
	
	
}
