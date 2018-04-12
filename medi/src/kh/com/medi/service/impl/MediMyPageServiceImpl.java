package kh.com.medi.service.impl;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediMyPageDao;
import kh.com.medi.model.MediMyPageDto;
import kh.com.medi.service.MediMyPageService;

@Service
public class MediMyPageServiceImpl implements MediMyPageService {
	
	@Autowired
	private MediMyPageDao mediMyPageDao;
	
	@Override
	public MediMyPageDto Mydetail(MediMyPageDto my) throws Exception {
		return mediMyPageDao.Mydetail(my);
	}

	@Override
	public boolean myUpate(HashMap<String, Object> mep) throws Exception {
		return mediMyPageDao.myUpate(mep);
	}

	@Override
	public void mydelete(MediMyPageDto my) throws Exception {
		mediMyPageDao.mydelete(my);
		
	}
	
}
