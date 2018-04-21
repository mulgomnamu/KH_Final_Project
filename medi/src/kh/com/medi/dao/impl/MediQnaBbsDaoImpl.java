package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediQnabbsDao;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;

@Repository
public class MediQnaBbsDaoImpl implements MediQnabbsDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediQnaBbs.";
	
	@Override
	public List<MediQnaBbsDto> getBbsList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto param) throws Exception {
		List<MediQnaBbsDto> list = sqlSession.selectList(ns + "getBbsPagingList", param);
		return list;
	}

	@Override
	public int getBbsCount(MediQnaBbsParamDto param) throws Exception {
		int number = 0;
		number = sqlSession.selectOne(ns + "getBbsCount", param);
		return number;
	}

	@Override
	public MediQnaBbsDto getBbsDetail(MediQnaBbsDto dto) throws Exception {
		MediQnaBbsDto detaildto = sqlSession.selectOne(ns + "getBbsDetail", dto);
		return detaildto;
	}

	@Override
	public boolean insertBbs(MediQnaBbsDto dto) throws Exception {
		int n = sqlSession.insert(ns+"insertBbs", dto);
		return n>0?true:false;
	}

	@Override
	public boolean deleteBbs(MediQnaBbsDto dto) throws Exception {
		int n = sqlSession.update(ns+"bbsDelete", dto);
		return n>0?true:false;
	}

	@Override
	public boolean updateBbs(MediQnaBbsDto dto) throws Exception {
		int n = sqlSession.update(ns+"bbsUpdate", dto);
		return n>0?true:false;
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
		int n = sqlSession.insert(ns+"answerInsert", dto);
		return n>0?true:false;
	}

}
