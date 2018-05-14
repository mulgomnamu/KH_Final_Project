package kh.com.medi.model;

import java.io.Serializable;

public class MediAdminReservationDto implements Serializable {
	
	private int seq;
	private int mem_seq;
	private int hos_seq;
	private int doc_seq;
	private String content;
	private String day;
	private String time;
	private String wdate;
	private int type;
	
	private String s_category;
	private String s_keyword;
	
	private int recordCountPerPage = 10;
	private int pageNumber = 0;
	private int start = 1;
	private int end = 10;
	
	private MediMemberDto adminMember;
	private MediMember_hDto adminHospital;
	private MediDoctorDto adminDoctor;
	
	public MediAdminReservationDto() {
	}

	public MediAdminReservationDto(int seq, int mem_seq, int hos_seq, int doc_seq, String content, String day,
			String time, String wdate, int type, String s_category, String s_keyword, int recordCountPerPage,
			int pageNumber, int start, int end, MediMemberDto adminMember, MediMember_hDto adminHospital,
			MediDoctorDto adminDoctor) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.hos_seq = hos_seq;
		this.doc_seq = doc_seq;
		this.content = content;
		this.day = day;
		this.time = time;
		this.wdate = wdate;
		this.type = type;
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
		this.adminMember = adminMember;
		this.adminHospital = adminHospital;
		this.adminDoctor = adminDoctor;
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

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
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

	public MediMemberDto getAdminMember() {
		return adminMember;
	}

	public void setAdminMember(MediMemberDto adminMember) {
		this.adminMember = adminMember;
	}

	public MediMember_hDto getAdminHospital() {
		return adminHospital;
	}

	public void setAdminHospital(MediMember_hDto adminHospital) {
		this.adminHospital = adminHospital;
	}

	public MediDoctorDto getAdminDoctor() {
		return adminDoctor;
	}

	public void setAdminDoctor(MediDoctorDto adminDoctor) {
		this.adminDoctor = adminDoctor;
	}

	@Override
	public String toString() {
		return "MediAdminReservationDto [seq=" + seq + ", mem_seq=" + mem_seq + ", hos_seq=" + hos_seq + ", doc_seq="
				+ doc_seq + ", content=" + content + ", day=" + day + ", time=" + time + ", wdate=" + wdate + ", type="
				+ type + ", s_category=" + s_category + ", s_keyword=" + s_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end
				+ ", adminMember=" + adminMember + ", adminHospital=" + adminHospital + ", adminDoctor=" + adminDoctor
				+ "]";
	}

}
