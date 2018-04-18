package kh.com.medi.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediQnabbsDao;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;

@Repository
public class MediQnaBbsDaoImpl implements MediQnabbsDao {

	@Override
	public List<MediQnaBbsDto> getBbsList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getBbsCount(MediQnaBbsParamDto param) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public MediQnaBbsDto getBbsDetail(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insertBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean deleteBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return false;
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
		return false;
	}

}
