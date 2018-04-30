package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAdminDao;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.service.MediAdminService;

@Service
public class MediAdminServiceImpl implements MediAdminService {
	
	@Autowired
	MediAdminDao mediAdminDao;

	@Override
	public List<MediMyListPagingDto> getMemberList() {
		return mediAdminDao.getMemberList();
	}

	@Override
	public int getMemberPagingListCount(MediMyListPagingDto dto_m) {
		return mediAdminDao.getMemberPagingListCount(dto_m);
	}

	@Override
	public List<MediMyListPagingDto> getMemberPagingList(MediMyListPagingDto dto_m) {
		return mediAdminDao.getMemberPagingList(dto_m);
	}

	@Override
	public MediMyListPagingDto getMemberListatSeq(MediMyListPagingDto dto_m) {
		return mediAdminDao.getMemberListatSeq(dto_m);
	}

	@Override
	public boolean addYellowCard(MediMyListPagingDto dto_m) {
		return mediAdminDao.addYellowCard(dto_m);
	}

	@Override
	public boolean delYellowCard(MediMyListPagingDto dto_m) {
		return mediAdminDao.delYellowCard(dto_m);
	}

	@Override
	public boolean updateMemberByAdmin(MediMyListPagingDto dto_m) {
		return mediAdminDao.updateMemberByAdmin(dto_m);
	}

}
