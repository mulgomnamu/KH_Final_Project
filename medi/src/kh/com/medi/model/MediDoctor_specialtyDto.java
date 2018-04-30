package kh.com.medi.model;

import java.io.Serializable;

public class MediDoctor_specialtyDto implements Serializable {
	
	private int doc_seq;
	private String specialty;
	
	public MediDoctor_specialtyDto() {
	}

	public MediDoctor_specialtyDto(int doc_seq, String specialty) {
		super();
		this.doc_seq = doc_seq;
		this.specialty = specialty;
	}

	public int getDoc_seq() {
		return doc_seq;
	}

	public void setDoc_seq(int doc_seq) {
		this.doc_seq = doc_seq;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	@Override
	public String toString() {
		return "MediDoctor_specialtyDto [doc_seq=" + doc_seq + ", specialty=" + specialty + "]";
	}

}
