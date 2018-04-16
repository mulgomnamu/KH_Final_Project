package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediHbbsDao;
import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediHbbsService;

@Service
public class MediHbbsServiceImpl implements MediHbbsService {

	@Autowired
	private MediHbbsDao mediHbbsDao;

	@Override
	public int getBbsCount(MediHbbsParamDto hbbs) throws Exception {
		return mediHbbsDao.getBbsCount(hbbs);
	}

	@Override
	public List<MediMember_hDto> getBbsPagingList(MediHbbsParamDto hbbs) throws Exception {
		return mediHbbsDao.getBbsPagingList(hbbs);
	}

	@Override
	public MediMember_hDto getBbsDetail(int seq) throws Exception {
		return mediHbbsDao.getBbsDetail(seq);
	}
	
}
