package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediMember_hDao;
import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediHospital_subject;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSubjectDto;
import kh.com.medi.service.MediMember_hService;

@Service
public class MediMember_hServiceImpl implements MediMember_hService {
	
	@Autowired
	MediMember_hDao mediMember_hDao;

	@Override
	public boolean addMember_h(MediMember_hDto dto_h) {
		return mediMember_hDao.addMember_h(dto_h);
	}

	@Override
	public boolean checkId(MediMember_hDto dto_h) {
		return mediMember_hDao.checkId(dto_h);
	}

	@Override
	public int checkTel(MediMember_hDto dto_h) {
		return mediMember_hDao.checkTel(dto_h);
	}

	@Override
	public int checkAddress(MediMember_hDto dto_h) {
		return mediMember_hDao.checkAddress(dto_h);
	}

	@Override
	public int checkEmail(MediMember_hDto dto_h) {
		return mediMember_hDao.checkEmail(dto_h);
	}

	@Override
	public MediMember_hDto getHospitalColumn(String id) {
		return mediMember_hDao.getHospitalColumn(id);
	}

	@Override
	public boolean addHospitalImage(MediHospital_imageDto dto_hi) {
		return mediMember_hDao.addHospitalImage(dto_hi);
	}

	@Override
	public boolean addHospitalSubject(MediHospital_subject dto_s) {
		return mediMember_hDao.addHospitalSubject(dto_s);
	}

	@Override
	public boolean deleteHospitalSubject(MediHospital_subject dto_s) {
		return mediMember_hDao.deleteHospitalSubject(dto_s);
	}

	@Override
	public boolean updateMember_h(MediMember_hDto dto_h) {
		return mediMember_hDao.updateMember_h(dto_h);
	}

	@Override
	public boolean deleteMember_h(MediMember_hDto dto_h) {
		return mediMember_hDao.deleteMember_h(dto_h);
	}

	@Override
	public MediMember_hDto login(MediMember_hDto dto_h) {
		return mediMember_hDao.login(dto_h);
	}

	@Override
	public boolean changePwd(MediMember_hDto dto_h) {
		return mediMember_hDao.changePwd(dto_h);
	}

	@Override
	public List<MediSubjectDto> getHospitalSubjectColumns(MediMember_hDto dto_h) {
		return mediMember_hDao.getHospitalSubjectColumns(dto_h);
	}

	@Override
	public List<MediHospital_imageDto> getImageList(MediMember_hDto dto_h) {
		return mediMember_hDao.getImageList(dto_h);
	}

	@Override
	public List<MediMember_hDto> getScoreList() {
		// TODO Auto-generated method stub
		return mediMember_hDao.getScoreList();
	}

	@Override
	public int getDoctorCount(int seq) {
		return mediMember_hDao.getDoctorCount(seq);
	}
	
}
