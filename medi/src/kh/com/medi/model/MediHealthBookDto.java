package kh.com.medi.model;

import java.io.Serializable;

public class MediHealthBookDto implements Serializable {
	
	private int seq;
	private int mem_seq;
	private String birth;
	private String gender;
	private int height;
	private int weight;
	private String bloodtype;
	private String allergy;
	
	
	public MediHealthBookDto(int seq, int mem_seq, String birth, String gender, int height, int weight,
			String bloodtype, String allergy) {
		super();
		this.seq = seq;
		this.mem_seq = mem_seq;
		this.birth = birth;
		this.gender = gender;
		this.height = height;
		this.weight = weight;
		this.bloodtype = bloodtype;
		this.allergy = allergy;
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


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public int getHeight() {
		return height;
	}


	public void setHeight(int height) {
		this.height = height;
	}


	public int getWeight() {
		return weight;
	}


	public void setWeight(int weight) {
		this.weight = weight;
	}


	public String getBloodtype() {
		return bloodtype;
	}


	public void setBloodtype(String bloodtype) {
		this.bloodtype = bloodtype;
	}


	public String getAllergy() {
		return allergy;
	}


	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}


	@Override
	public String toString() {
		return "MediHealthBookDto [seq=" + seq + ", mem_seq=" + mem_seq + ", birth=" + birth + ", gender=" + gender
				+ ", height=" + height + ", weight=" + weight + ", bloodtype=" + bloodtype + ", allergy=" + allergy
				+ "]";
	}
	
	
	

}
