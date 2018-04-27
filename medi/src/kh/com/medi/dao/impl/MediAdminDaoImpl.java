package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAdminDao;
import kh.com.medi.model.MediMyListPagingDto;

@Repository
public class MediAdminDaoImpl implements MediAdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediAdmin.";

	@Override
	public List<MediMyListPagingDto> getMemberList(MediMyListPagingDto dto_m) {
		return sqlSession.selectList(ns+"getMemberList", dto_m);
	}

}
