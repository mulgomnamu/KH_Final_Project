package kh.com.medi.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediMyPageDao;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.model.MediMyPageDto;
import kh.com.medi.service.MediMyPageService;

@Service
public class MediMyPageServiceImpl implements MediMyPageService {
	
	@Autowired
	private MediMyPageDao mediMyPageDao;
	
	@Override
	public MediMemberDto Mydetail(MediMemberDto my) throws Exception {
		return mediMyPageDao.Mydetail(my);
	}

	@Override
	public boolean myUpate(HashMap<String, Object> mep) throws Exception {
		return mediMyPageDao.myUpate(mep);
	}

	@Override
	public MediMemberDto myup(MediMemberDto my) throws Exception {
		return mediMyPageDao.myup(my);
	}

	@Override
	public boolean mypwdupdate(HashMap<String, Object> mep) throws Exception {
		return mediMyPageDao.mypwdupdate(mep);
	}

	@Override
	public boolean mydelete(HashMap<String, Object> mep) throws Exception {
		
		return mediMyPageDao.mydelete(mep);
	}
	
	@Override
	public int getBbsCount(MediMyListPagingDto mylist) throws Exception {
		return mediMyPageDao.getBbsCount(mylist);
	}

	@Override
	public List<MediMemberDto> getBbsPagingList(MediMyListPagingDto mylist) throws Exception {
	    return mediMyPageDao.getBbsPagingList(mylist);
	}

	@Override
	public boolean checkPhone(MediMemberDto my) throws Exception {
		return mediMyPageDao.checkPhone(my);
	}

	@Override
	public boolean checkEmail(MediMemberDto my) throws Exception {
		return mediMyPageDao.checkEmail(my);
	}

	
}
