package kh.com.medi.model;

import java.io.Serializable;

public class MediMemberDto implements Serializable {
	
	private String id;
	private String pw;
	private String name;
	
	public MediMemberDto() {
	}
	
	public MediMemberDto(String id) {
		this.id = id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
