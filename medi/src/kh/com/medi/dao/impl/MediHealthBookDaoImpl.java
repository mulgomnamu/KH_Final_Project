package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import kh.com.medi.dao.MediHealthBookDao;
import kh.com.medi.model.MediHealthBookDto;
@Repository
public class MediHealthBookDaoImpl implements MediHealthBookDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediHealthBook.";
	
	@Override
	public List<MediHealthBookDto> getHealthBookList() throws Exception {
		List<MediHealthBookDto> hlist = sqlSession.selectList(ns + "getHealthBook");		
		
		return hlist;
	}

	@Override
	public boolean healthBookWrite(MediHealthBookDto healthbookdto) throws Exception {
		int n = sqlSession.insert(ns+"healthBookWrite", healthbookdto);
		return n>0? true:false;
	}



}
