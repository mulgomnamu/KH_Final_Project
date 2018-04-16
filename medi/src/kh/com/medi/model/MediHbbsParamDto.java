package kh.com.medi.model;

import java.io.Serializable;

public class MediHbbsParamDto implements Serializable {

	private int seq;
	private String id;
	private String pwd;
	private String name;
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
	private String regdate;
	
	// ---------------- search
	private String s_category;		// 검색 카테고리
	private String s_keyword;		// 검색어
	
	// ---------------- paging
	private int recordCounterPage = 4;
	private int pageNumber = 0;
	
	private int start = 1;
	private int end = 4;
	
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
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
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
	public int getRecordCounterPage() {
		return recordCounterPage;
	}
	public void setRecordCounterPage(int recordCounterPage) {
		this.recordCounterPage = recordCounterPage;
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
	public MediHbbsParamDto(int seq, String id, String pwd, String name, String tel, String post, String address,
			String map, String email, String question, String answer, String confirm_img, String info, int del,
			String regdate, String s_category, String s_keyword, int recordCounterPage, int pageNumber, int start,
			int end) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
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
		this.regdate = regdate;
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCounterPage = recordCounterPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}
	
	public MediHbbsParamDto() {
	}
	@Override
	public String toString() {
		return "MediHbbsParamDto [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", tel=" + tel
				+ ", post=" + post + ", address=" + address + ", map=" + map + ", email=" + email + ", question="
				+ question + ", answer=" + answer + ", confirm_img=" + confirm_img + ", info=" + info + ", del=" + del
				+ ", regdate=" + regdate + ", s_category=" + s_category + ", s_keyword=" + s_keyword
				+ ", recordCounterPage=" + recordCounterPage + ", pageNumber=" + pageNumber + ", start=" + start
				+ ", end=" + end + "]";
	}
	
	
	
}
