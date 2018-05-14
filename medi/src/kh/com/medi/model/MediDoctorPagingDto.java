package kh.com.medi.model;

import java.io.Serializable;

public class MediDoctorPagingDto implements Serializable {
	
	private int seq;
	private int hos_seq;
	private String name;
	private String specialty; 
	private String regdate;
	private String doc_profile;
	private String doc_content;
	private String day_tostring;
	
	private String s_category;
	private String s_keyword;
	
	private int recordCountPerPage = 10;
	private int pageNumber = 0;
	private int start = 1;
	private int end = 10;
	
	public MediDoctorPagingDto() {
	}

	public MediDoctorPagingDto(int seq, int hos_seq, String name, String specialty, String regdate, String doc_profile,
			String doc_content, String day_tostring, String s_category, String s_keyword, int recordCountPerPage,
			int pageNumber, int start, int end) {
		super();
		this.seq = seq;
		this.hos_seq = hos_seq;
		this.name = name;
		this.specialty = specialty;
		this.regdate = regdate;
		this.doc_profile = doc_profile;
		this.doc_content = doc_content;
		this.day_tostring = day_tostring;
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

	public int getHos_seq() {
		return hos_seq;
	}

	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
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

	public String getDay_tostring() {
		return day_tostring;
	}

	public void setDay_tostring(String day_tostring) {
		this.day_tostring = day_tostring;
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
		return "MediDoctorPagingDto [seq=" + seq + ", hos_seq=" + hos_seq + ", name=" + name + ", specialty="
				+ specialty + ", regdate=" + regdate + ", doc_profile=" + doc_profile + ", doc_content=" + doc_content
				+ ", day_tostring=" + day_tostring + ", s_category=" + s_category + ", s_keyword=" + s_keyword
				+ ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start
				+ ", end=" + end + "]";
	}

}
