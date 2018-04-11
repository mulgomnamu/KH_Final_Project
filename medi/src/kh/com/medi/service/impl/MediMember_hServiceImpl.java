package kh.com.medi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediMember_hDao;
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

}
