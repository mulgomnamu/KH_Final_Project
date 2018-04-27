package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAdminDao;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.service.MediAdminService;

@Service
public class MediAdminServiceImpl implements MediAdminService {
	
	@Autowired
	MediAdminDao mediAdminDao;

	@Override
	public List<MediMyListPagingDto> getMemberList(MediMyListPagingDto dto_m) {
		return mediAdminDao.getMemberList(dto_m);
	}

}
