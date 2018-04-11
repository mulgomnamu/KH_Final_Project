package kh.com.medi.model;

import java.io.Serializable;

public class MediMemberDto implements Serializable {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private int post;
	private String address;
	private String question;
	private String answer;
	private int auth;
	private int del;
	private String myimg;
	private int blacklist;
	private String regdate;
	
	public MediMemberDto() {}
	
	public MediMemberDto(String id) {
		this.id = id;
	}
	
	public MediMemberDto(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
		
	}

	public MediMemberDto(String id, String pwd, String name, String email, String phone, int post, String address,
			String question, String answer, int auth, int del, String myimg, int blacklist, String regdate) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.post = post;
		this.address = address;
		this.question = question;
		this.answer = answer;
		this.auth = auth;
		this.del = del;
		this.myimg = myimg;
		this.blacklist = blacklist;
		this.regdate = regdate;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public int getPost() {
		return post;
	}

	public void setPost(int post) {
		this.post = post;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getMyimg() {
		return myimg;
	}

	public void setMyimg(String myimg) {
		this.myimg = myimg;
	}

	public int getBlacklist() {
		return blacklist;
	}

	public void setBlacklist(int blacklist) {
		this.blacklist = blacklist;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MediMemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", phone=" + phone
				+ ", post=" + post + ", address=" + address + ", question=" + question + ", answer=" + answer
				+ ", auth=" + auth + ", del=" + del + ", myimg=" + myimg + ", blacklist=" + blacklist + ", regdate="
				+ regdate + "]";
	}
	
	
	
	

}
