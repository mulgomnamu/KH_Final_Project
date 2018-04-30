package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediHospital_subject;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSubjectDto;

public interface MediMember_hService {
	
	public boolean addMember_h(MediMember_hDto dto_h);
	public boolean addHospitalImage(MediHospital_imageDto dto_hi);
	public boolean addHospitalSubject(MediHospital_subject dto_s);
	public boolean deleteHospitalSubject(MediHospital_subject dto_s);
	public boolean checkId(MediMember_hDto dto_h);
	public int checkTel(MediMember_hDto dto_h);
	public int checkAddress(MediMember_hDto dto_h);
	public int checkEmail(MediMember_hDto dto_h);
	public MediMember_hDto getHospitalColumn(String id);
	public boolean updateMember_h(MediMember_hDto dto_h);
	public boolean deleteMember_h(MediMember_hDto dto_h);
	public MediMember_hDto login(MediMember_hDto dto_h);
	public boolean changePwd(MediMember_hDto dto_h);
	public List<MediSubjectDto> getHospitalSubjectColumns(MediMember_hDto dto_h);

}
