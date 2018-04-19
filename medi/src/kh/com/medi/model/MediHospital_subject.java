package kh.com.medi.model;

import java.io.Serializable;
import java.util.List;

public class MediHospital_subject implements Serializable {
	
	private int hos_seq;
	private String subject;
	
	private String cl_sjt_list;
	
	public MediHospital_subject() {
	}

	public MediHospital_subject(int hos_seq, String subject, String cl_sjt_list) {
		super();
		this.hos_seq = hos_seq;
		this.subject = subject;
		this.cl_sjt_list = cl_sjt_list;
	}

	public int getHos_seq() {
		return hos_seq;
	}

	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getCl_sjt_list() {
		return cl_sjt_list;
	}

	public void setCl_sjt_list(String cl_sjt_list) {
		this.cl_sjt_list = cl_sjt_list;
	}

	@Override
	public String toString() {
		return "MediHospital_subject [hos_seq=" + hos_seq + ", subject=" + subject + ", cl_sjt_list=" + cl_sjt_list
				+ "]";
	}

	

	

}
