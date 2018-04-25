package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediQnabbsDao;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;
import kh.com.medi.service.MediQnaBbsService;

@Service
public class MediQnaBbsServiceImpl implements MediQnaBbsService {

	@Autowired
	private MediQnabbsDao mediQnaDao;
	
	@Override
	public List<MediQnaBbsDto> getBbsList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.getBbsPagingList(param);
	}

	@Override
	public List<MediQnaBbsDto> getBbsPagingList1(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.getBbsPagingList1(param);
	}
	
	@Override
	public List<MediQnaBbsDto> getBbsPagingList4(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.getBbsPagingList4(param);
	}

	@Override
	public int getBbsCount(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.getBbsCount(param);
	}
	
	@Override
	public int getBbsCount1(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.getBbsCount1(param);
	}
	
	@Override
	public int getBbsCount4(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.getBbsCount4(param);
	}

	@Override
	public MediQnaBbsDto getBbsDetail(MediQnaBbsDto dto) throws Exception {
		return mediQnaDao.getBbsDetail(dto);
	}

	@Override
	public boolean insertBbs1(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.insertBbs1(dto);
	}
	
	@Override
	public boolean insertBbs4(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.insertBbs4(dto);
	}

	@Override
	public boolean deleteBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.deleteBbs(dto);
	}

	@Override
	public boolean updateBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.updateBbs(dto);
	}

	@Override
	public boolean readcountBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean answerUpdate(int seq) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean answerInsert(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediQnaDao.answerInsert(dto);
	}

}