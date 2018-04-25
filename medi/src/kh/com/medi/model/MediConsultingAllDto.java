package kh.com.medi.model;

import java.io.Serializable;

public class MediConsultingAllDto implements Serializable {
	private int seq;
	private int mem_seq;
	private String wid;
	private String title;
	private String content;
	private String category;
	private int readcount;
	private int commentcount;
	private int selectyn;
	private int del;
	private String wdate;
	
	private int ans_seq;
	private int hos_seq;
	private String whos_name;
	private int parent;
	private int ans_del;
	private String ans_wdate;
	// -------------------- Search
	private String s_category;	// 제목, 내용, 작성자
	private String s_keyword;	// 검색어
	
	// -------------------- paging
	private int recordCountPerPage = 10;
	private int pageNumber = 0;
	// -------------------- Search
	private String s_category1;	// 제목, 내용, 작성자
	private String s_keyword1;	// 검색어
	
	// -------------------- paging
	private int recordCountPerPage1 = 10;
	private int pageNumber1 = 0;
	// -------------------- Search
	private String s_category2;	// 제목, 내용, 작성자
	private String s_keyword2;	// 검색어
	
	// -------------------- paging
	private int recordCountPerPage2 = 10;
	private int pageNumber2 = 0; 
	private int start = 1;
	private int end = 10;
	private int tab;
	public MediConsultingAllDto() {}
	
	
	public MediConsultingAllDto(int seq, int mem_seq, String wid, String title, String content, String category,
			int readcount, int commentcount, int selectyn, int del, String wdate, int ans_seq, int hos_seq,
			String whos_name, int parent, int ans_del, String ans_wdate, String s_category, String s_keyword,
			int recordCountPerPage, int pageNumber, String s_category1, String s_keyword1, int recordCountPerPage1,
			int pageNumber1, String s_category2, String s_keyword2, int recordCountPerPage2, int pageNumber2, int start,
			int end, int tab) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.wid = wid;
		this.title = title;
		this.content = content;
		this.category = category;
		this.readcount = readcount;
		this.commentcount = commentcount;
		this.selectyn = selectyn;
		this.del = del;
		this.wdate = wdate;
		this.ans_seq = ans_seq;
		this.hos_seq = hos_seq;
		this.whos_name = whos_name;
		this.parent = parent;
		this.ans_del = ans_del;
		this.ans_wdate = ans_wdate;
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.s_category1 = s_category1;
		this.s_keyword1 = s_keyword1;
		this.recordCountPerPage1 = recordCountPerPage1;
		this.pageNumber1 = pageNumber1;
		this.s_category2 = s_category2;
		this.s_keyword2 = s_keyword2;
		this.recordCountPerPage2 = recordCountPerPage2;
		this.pageNumber2 = pageNumber2;
		this.start = start;
		this.end = end;
		this.tab = tab;
	}


	public int getAns_seq() {
		return ans_seq;
	}
	public void setAns_seq(int ans_seq) {
		this.ans_seq = ans_seq;
	}
	public int getAns_del() {
		return ans_del;
	}
	public void setAns_del(int ans_del) {
		this.ans_del = ans_del;
	}
	public String getAns_wdate() {
		return ans_wdate;
	}
	public void setAns_wdate(String ans_wdate) {
		this.ans_wdate = ans_wdate;
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
	public String getWid() {
		return wid;
	}
	public void setWid(String wid) {
		this.wid = wid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getCommentcount() {
		return commentcount;
	}
	public void setCommentcount(int commentcount) {
		this.commentcount = commentcount;
	}
	public int getSelectyn() {
		return selectyn;
	}
	public void setSelectyn(int selectyn) {
		this.selectyn = selectyn;
	}
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getHos_seq() {
		return hos_seq;
	}
	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}
	public String getWhos_name() {
		return whos_name;
	}
	public void setWhos_name(String whos_name) {
		this.whos_name = whos_name;
	}
	public int getParent() {
		return parent;
	}
	public void setParent(int parent) {
		this.parent = parent;
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
	public String getS_category1() {
		return s_category1;
	}
	public void setS_category1(String s_category1) {
		this.s_category1 = s_category1;
	}
	public String getS_keyword1() {
		return s_keyword1;
	}
	public void setS_keyword1(String s_keyword1) {
		this.s_keyword1 = s_keyword1;
	}
	public int getRecordCountPerPage1() {
		return recordCountPerPage1;
	}
	public void setRecordCountPerPage1(int recordCountPerPage1) {
		this.recordCountPerPage1 = recordCountPerPage1;
	}
	public int getPageNumber1() {
		return pageNumber1;
	}
	public void setPageNumber1(int pageNumber1) {
		this.pageNumber1 = pageNumber1;
	}
	public String getS_category2() {
		return s_category2;
	}
	public void setS_category2(String s_category2) {
		this.s_category2 = s_category2;
	}
	public String getS_keyword2() {
		return s_keyword2;
	}
	public void setS_keyword2(String s_keyword2) {
		this.s_keyword2 = s_keyword2;
	}
	public int getRecordCountPerPage2() {
		return recordCountPerPage2;
	}
	public void setRecordCountPerPage2(int recordCountPerPage2) {
		this.recordCountPerPage2 = recordCountPerPage2;
	}
	public int getPageNumber2() {
		return pageNumber2;
	}
	public void setPageNumber2(int pageNumber2) {
		this.pageNumber2 = pageNumber2;
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
	
	
	public int getTab() {
		return tab;
	}
	public void setTab(int tab) {
		this.tab = tab;
	}
	
	@Override
	public String toString() {
		return "MediConsultingAllDto [seq=" + seq + ", mem_seq=" + mem_seq + ", wid=" + wid + ", title=" + title
				+ ", content=" + content + ", category=" + category + ", readcount=" + readcount + ", commentcount="
				+ commentcount + ", selectyn=" + selectyn + ", del=" + del + ", wdate=" + wdate + ", hos_seq=" + hos_seq
				+ ", whos_name=" + whos_name + ", parent=" + parent + ", s_category=" + s_category + ", s_keyword="
				+ s_keyword + ", recordCountPerPage=" + recordCountPerPage + ", pageNumber=" + pageNumber
				+ ", s_category1=" + s_category1 + ", s_keyword1=" + s_keyword1 + ", recordCountPerPage1="
				+ recordCountPerPage1 + ", pageNumber1=" + pageNumber1 + ", s_category2=" + s_category2
				+ ", s_keyword2=" + s_keyword2 + ", recordCountPerPage2=" + recordCountPerPage2 + ", pageNumber2="
				+ pageNumber2 + ", start=" + start + ", end=" + end + "]";
	}
	
}
