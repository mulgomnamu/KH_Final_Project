package kh.com.medi.model;

import java.io.Serializable;

public class MediHospitalPagingDto implements Serializable {
	
	private int seq;
	private String id;
	private String pwd;
	private String name;
	private String tel;
	private String post;
	private String address;
	private String latitude;
	private String longtitude;
	private String email;
	private String question;
	private String answer;
	private String confirm_img;
	private String info;
	private int score;
	private int del;
	private String regdate;
	private int auth; 
	
	private String s_category;
	private String s_keyword;
	
	private int recordCountPerPage = 10;
	private int pageNumber=0;
	private int start = 1;
	private int end = 10;
	
	public MediHospitalPagingDto() {
	}

	public MediHospitalPagingDto(int seq, String id, String pwd, String name, String tel, String post, String address,
			String latitude, String longtitude, String email, String question, String answer, String confirm_img,
			String info, int score, int del, String regdate, int auth, String s_category, String s_keyword,
			int recordCountPerPage, int pageNumber, int start, int end) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.tel = tel;
		this.post = post;
		this.address = address;
		this.latitude = latitude;
		this.longtitude = longtitude;
		this.email = email;
		this.question = question;
		this.answer = answer;
		this.confirm_img = confirm_img;
		this.info = info;
		this.score = score;
		this.del = del;
		this.regdate = regdate;
		this.auth = auth;
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getLatitude() {
		return latitude;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public String getLongtitude() {
		return longtitude;
	}

	public void setLongtitude(String longtitude) {
		this.longtitude = longtitude;
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

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getS_keyword() {
		return s_keyword;
	}

	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "MediHospitalPagingDto [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel
				+ ", post=" + post + ", address=" + address + ", latitude=" + latitude + ", longtitude=" + longtitude
				+ ", email=" + email + ", question=" + question + ", answer=" + answer + ", confirm_img=" + confirm_img
				+ ", info=" + info + ", score=" + score + ", del=" + del + ", regdate=" + regdate + ", auth=" + auth
				+ ", s_category=" + s_category + ", s_keyword=" + s_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}

}
