package kh.com.medi.dao;

import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediHospital_subject;
import kh.com.medi.model.MediMember_hDto;

public interface MediMember_hDao {
	
	boolean addMember_h(MediMember_hDto dto_h);
	boolean addHospitalImage(MediHospital_imageDto dto_hi);
	boolean addHospitalSubject(MediHospital_subject dto_s);
	boolean checkId(MediMember_hDto dto_h);
	MediMember_hDto getHospitalColumn(String id);

}
