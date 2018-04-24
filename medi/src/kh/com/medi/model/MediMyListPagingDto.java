package kh.com.medi.model;

import java.io.Serializable;

public class MediMyListPagingDto implements Serializable{

	public MediMyListPagingDto(int seq, String id, String pwd, String name, String email, String phone, int post,
			String address, String question, String answer, int auth, int del, String myimg, int blacklist,
			String regdate, String s_category, String s_keyword, int recordCountPerPage, int pageNumber, int start,
			int end) {
		super();
		this.seq = seq;
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
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	private int seq;
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
	
	public MediMyListPagingDto() {
	}
	
	

	//-----------search
		private String s_category; //제목 , 내용, 작성자 
		private String s_keyword;  //검색어	
		//-----------paging
		private int recordCountPerPage = 10;
		private int pageNumber=0;
		
		private int start=1;
		private int end = 10;
		
		public int getSeq() {
			return seq;
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

		public void setSeq(int seq) {
			this.seq = seq;
		}

		@Override
		public String toString() {
			return "MediMyListPagingDto [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email="
					+ email + ", phone=" + phone + ", post=" + post + ", address=" + address + ", question=" + question
					+ ", answer=" + answer + ", auth=" + auth + ", del=" + del + ", myimg=" + myimg + ", blacklist="
					+ blacklist + ", regdate=" + regdate + ", s_category=" + s_category + ", s_keyword=" + s_keyword
					+ ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start
					+ ", end=" + end + "]";
		}

		
	
	
}