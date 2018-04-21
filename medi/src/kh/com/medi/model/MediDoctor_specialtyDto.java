package kh.com.medi.model;

import java.io.Serializable;

public class MediDoctor_specialtyDto implements Serializable {
	
	private int hos_seq;
	private String specialty;
	
	public MediDoctor_specialtyDto() {
	}

	public MediDoctor_specialtyDto(int hos_seq, String specialty) {
		super();
		this.hos_seq = hos_seq;
		this.specialty = specialty;
	}

	public int getHos_seq() {
		return hos_seq;
	}

	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}

	public String getSpecialty() {
		return specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}

	@Override
	public String toString() {
		return "MediDoctor_specialty [hos_seq=" + hos_seq + ", specialty=" + specialty + "]";
	}

}
