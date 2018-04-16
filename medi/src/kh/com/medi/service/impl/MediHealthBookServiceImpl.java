package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.com.medi.dao.MediHealthBookDao;
import kh.com.medi.model.MediHealthBookDto;
import kh.com.medi.service.MediHeathBookService;

@Service
public class MediHealthBookServiceImpl implements MediHeathBookService {
	
	@Autowired
	private MediHealthBookDao mediHealthBookDao;
	
	@Override
	public List<MediHealthBookDto> getHealthBookList() throws Exception {
		return mediHealthBookDao.getHealthBookList();
	}

	@Override
	public boolean healthBookWrite(MediHealthBookDto healthbookdto) throws Exception {
		// TODO Auto-generated method stub
		return mediHealthBookDao.healthBookWrite(healthbookdto);
	}





	
}
