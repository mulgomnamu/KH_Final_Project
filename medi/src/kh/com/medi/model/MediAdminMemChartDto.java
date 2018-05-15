package kh.com.medi.model;

import java.io.Serializable;

public class MediAdminMemChartDto implements Serializable {
	
	private int total;
	private int d0;
	private int d1;
	private int d2;
	private int d3;
	private int d4;
	private int d5;
	private int d6;
	
	public MediAdminMemChartDto() {
	}

	public MediAdminMemChartDto(int total, int d0, int d1, int d2, int d3, int d4, int d5, int d6) {
		super();
		this.total = total;
		this.d0 = d0;
		this.d1 = d1;
		this.d2 = d2;
		this.d3 = d3;
		this.d4 = d4;
		this.d5 = d5;
		this.d6 = d6;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getD0() {
		return d0;
	}

	public void setD0(int d0) {
		this.d0 = d0;
	}

	public int getD1() {
		return d1;
	}

	public void setD1(int d1) {
		this.d1 = d1;
	}

	public int getD2() {
		return d2;
	}

	public void setD2(int d2) {
		this.d2 = d2;
	}

	public int getD3() {
		return d3;
	}

	public void setD3(int d3) {
		this.d3 = d3;
	}

	public int getD4() {
		return d4;
	}

	public void setD4(int d4) {
		this.d4 = d4;
	}

	public int getD5() {
		return d5;
	}

	public void setD5(int d5) {
		this.d5 = d5;
	}

	public int getD6() {
		return d6;
	}

	public void setD6(int d6) {
		this.d6 = d6;
	}

	@Override
	public String toString() {
		return "MediAdminUserChartDto [total=" + total + ", d0=" + d0 + ", d1=" + d1 + ", d2=" + d2 + ", d3=" + d3
				+ ", d4=" + d4 + ", d5=" + d5 + ", d6=" + d6 + "]";
	}

}
