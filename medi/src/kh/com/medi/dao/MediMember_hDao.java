package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediHospital_subject;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSubjectDto;

public interface MediMember_hDao {
	
	boolean addMember_h(MediMember_hDto dto_h);
	boolean addHospitalImage(MediHospital_imageDto dto_hi);
	boolean addHospitalSubject(MediHospital_subject dto_s);
	boolean deleteHospitalSubject(MediHospital_subject dto_s);
	boolean checkId(MediMember_hDto dto_h);
	int checkTel(MediMember_hDto dto_h);
	int checkAddress(MediMember_hDto dto_h);
	int checkEmail(MediMember_hDto dto_h);
	MediMember_hDto getHospitalColumn(String id);
	boolean updateMember_h(MediMember_hDto dto_h);
	boolean deleteMember_h(MediMember_hDto dto_h);
	MediMember_hDto login(MediMember_hDto dto_h);
	boolean changePwd(MediMember_hDto dto_h);
	List<MediSubjectDto> getHospitalSubjectColumns(MediMember_hDto dto_h);
	List<MediHospital_imageDto> getImageList(MediMember_hDto dto_h);
	List<MediMember_hDto> getScoreList();
	public int getDoctorCount(int seq);
	
	MediMember_hDto hosIdFind(MediMember_hDto dto);  
	MediMember_hDto getHosQuesAns(MediMember_hDto dto);
	boolean hosPwdReset(MediMember_hDto dto);
}
