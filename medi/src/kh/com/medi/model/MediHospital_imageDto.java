package kh.com.medi.model;

import java.io.Serializable;

public class MediHospital_imageDto implements Serializable {
	
	private int hos_seq;
	private String image;
	
	public MediHospital_imageDto() {
	}

	public MediHospital_imageDto(int hos_seq, String image) {
		super();
		this.hos_seq = hos_seq;
		this.image = image;
	}

	public int getHos_seq() {
		return hos_seq;
	}

	public void setHos_seq(int hos_seq) {
		this.hos_seq = hos_seq;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "MediHospital_imageDto [hos_seq=" + hos_seq + ", image=" + image + "]";
	}

}


