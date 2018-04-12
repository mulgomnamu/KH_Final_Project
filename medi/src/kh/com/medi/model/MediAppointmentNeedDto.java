package kh.com.medi.model;

import java.io.Serializable;

public class MediAppointmentNeedDto implements Serializable {
	private String id;	//name,regdate있다 name은 일반회원이름, regdate는 일반회원가입날짜
	private String pwd;
	private String tel;
	private String post;
	private String address;
	private String map;
	private String email;
	private String question;
	private String answer;
	private String confirm_img;
	private String info;
	private int del;
	
	private int seq;			
	private int mem_seq;		//개인회원번호
	private int hos_seq;		//병원번호
	private int doc_seq;		//의사번호
	private String content;		//증상
	private String day;			//20180411
	private String time;		//09:00
	private int type;			//기본진료(0) 화상진료(1)
	
	private String name;		//의사이름
	private String specialty;	//진료분야 EX) 감기, 내시경 
	private String regdate;		//의사가입날짜
	private String doc_profile;	//의사프로필사진
	private String doc_content;	//의사설명
	
	
	private String start_time;	//09:00:00 day개념있다 이건 월,화,수같은거
	private String end_time;	//13:30:00 start_time~end_time-lunch_time으로 30분씩으로나눠서표현해준다
	private String lunch_time;	//12:00:00 입력받으면 그후한시간은막아야된다
	
	private String subject;		//병원의진료과목
	
	private int monthyn;		//병원의진료과목
	public MediAppointmentNeedDto() {
	}
	
	//병원회원가입 dto
	public MediAppointmentNeedDto(String id, String pwd, String tel, String post, String address, String map,
			String email, String question, String answer, String confirm_img, String info, int del, int seq,
			String name, String regdate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.tel = tel;
		this.post = post;
		this.address = address;
		this.map = map;
		this.email = email;
		this.question = question;
		this.answer = answer;
		this.confirm_img = confirm_img;
		this.info = info;
		this.del = del;
		this.seq = seq;
		this.name = name;
		this.regdate = regdate;
	}
	//병원디테일
	public MediAppointmentNeedDto(int seq,String name,String info,String address,String tel) {
		super();
		this.seq = seq;
		this.name = name;
		this.info = info;
		this.address = address;
		this.tel = tel;
	}
	//병원예약 dto
	public MediAppointmentNeedDto(int seq, int mem_seq, int hos_seq, int doc_seq, String content, String day,
			String time, int type) {
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
	
	//의사디테일dto
	public MediAppointmentNeedDto(int seq, int hos_seq, String name, String specialty, String regdate,
			String doc_profile, String doc_content) {
		super();
		this.seq = seq;
		this.hos_seq = hos_seq;
		this.name = name;
		this.specialty = specialty;
		this.regdate = regdate;
		this.doc_profile = doc_profile;
		this.doc_content = doc_content;
	}
	//의사의 진료가능시간dto
	public MediAppointmentNeedDto(int seq, int doc_seq, String day, String start_time, String end_time,
			String lunch_time) {
		super();
		this.seq = seq;
		this.doc_seq = doc_seq;
		this.day = day;
		this.start_time = start_time;
		this.end_time = end_time;
		this.lunch_time = lunch_time;
	}
	//병원진료분야dto
	public MediAppointmentNeedDto(int hos_seq, String specialty) {
		super();
		this.hos_seq = hos_seq;
		this.specialty = specialty;
	}
	//병원진료과목dto
	public MediAppointmentNeedDto(String subject,int hos_seq ) {
		super();
		this.subject = subject;
		this.hos_seq = hos_seq;
		
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getConfirm_img() {
		return confirm_img;
	}

	public void setConfirm_img(String confirm_img) {
		this.confirm_img = confirm_img;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getMonthyn() {
		return monthyn;
	}

	public void setMonthyn(int monthyn) {
		this.monthyn = monthyn;
	}

	@Override
	public String toString() {
		return "MediAppointmentNeedDto [seq=" + seq + ", mem_seq=" + mem_seq + ", hos_seq=" + hos_seq + ", doc_seq="
				+ doc_seq + ", content=" + content + ", day=" + day + ", time=" + time + ", type=" + type + ", name="
				+ name + ", specialty=" + specialty + ", regdate=" + regdate + ", doc_profile=" + doc_profile
				+ ", doc_content=" + doc_content + ", start_time=" + start_time + ", end_time=" + end_time
				+ ", lunch_time=" + lunch_time + ", subject=" + subject + "]";
	}
	
	
}
