package kh.com.medi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediMember_hDao;
import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediHospital_subject;
import kh.com.medi.model.MediMember_hDto;
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

}
