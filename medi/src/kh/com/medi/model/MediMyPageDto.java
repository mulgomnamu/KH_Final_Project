package kh.com.medi.model;

import java.io.Serializable;

/*CREATE TABLE `medi`.`medi_member` (
`seq` INT(8) AUTO_INCREMENT NOT NULL,
`id` VARCHAR(50) NOT NULL,
`pwd` VARCHAR(50) NOT NULL,
`name` VARCHAR(50) NOT NULL,
`email` VARCHAR(50) NOT NULL,
`phone` VARCHAR(50) NOT NULL,
`post` VARCHAR(50) NOT NULL,
`address` VARCHAR(50) NOT NULL,
`auth` INT(1) NOT NULL,
`del` INT(1) NOT NULL,
`myimg` VARCHAR(100) NOT NULL,
`blacklist` INT(1) NOT NULL,
`regdate` DATETIME NOT NULL,
`question` VARCHAR(50) NOT NULL,
`answer` VARCHAR(50) NOT NULL,
PRIMARY KEY (`seq`),
UNIQUE INDEX `email_UNIQUE` (`email` ASC),
UNIQUE INDEX `phone_UNIQUE` (`phone` ASC),
UNIQUE INDEX `id_UNIQUE` (`id` ASC));
*/


public class MediMyPageDto implements Serializable {
	
	private int seq;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String post;
 	private String address;
	private int auth;
	private int del; 
	private String myimg;
	private int blackilst; //경고 횟수
	private String regdate;
	private String question;
	private String answer;
	
	public MediMyPageDto() {}

	public MediMyPageDto(int seq, String id, String pwd, String name, String email, String phone, String post,
			String address, int auth, int del, String myimg, int blackilst, String regdate) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.post = post;
		this.address = address;
		this.auth = auth;
		this.del = del;
		this.myimg = myimg;
		this.blackilst = blackilst;
		this.regdate = regdate;
		this.question=question;
		this.answer=answer;
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

	public int getBlackilst() {
		return blackilst;
	}

	public void setBlackilst(int blackilst) {
		this.blackilst = blackilst;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "MediMyPageDto [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", post=" + post + ", address=" + address + ", auth=" + auth + ", del=" + del
				+ ", myimg=" + myimg + ", blackilst=" + blackilst + ", regdate=" + regdate + ", question=" + question
				+ ", answer=" + answer + "]";
	}

	
	

}
