package kh.com.medi.model;

import java.io.Serializable;

public class MediMember_hDto implements Serializable {

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
	private int del;
	private String regdate;
	private int auth;
	
	private String pwd1;
	
	public MediMember_hDto() {
	}

	public MediMember_hDto(int seq, String id, String pwd, String name, String tel, String post, String address,
			String latitude, String longtitude, String email, String question, String answer, String confirm_img,
			String info, int del, String regdate, int auth, String pwd1) {
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
		this.del = del;
		this.regdate = regdate;
		this.auth = auth;
		this.pwd1 = pwd1;
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

	public String getPwd1() {
		return pwd1;
	}

	public void setPwd1(String pwd1) {
		this.pwd1 = pwd1;
	}

	@Override
	public String toString() {
		return "MediMember_hDto [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel
				+ ", post=" + post + ", address=" + address + ", latitude=" + latitude + ", longtitude=" + longtitude
				+ ", email=" + email + ", question=" + question + ", answer=" + answer + ", confirm_img=" + confirm_img
				+ ", info=" + info + ", del=" + del + ", regdate=" + regdate + ", auth=" + auth + ", pwd1=" + pwd1
				+ "]";
	}
	
}
