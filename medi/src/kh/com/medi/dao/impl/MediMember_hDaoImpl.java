package kh.com.medi.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediMember_hDao;
import kh.com.medi.model.MediMember_hDto;

@Repository
public class MediMember_hDaoImpl implements MediMember_hDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediMember_h.";

	@Override
	public boolean addMember_h(MediMember_hDto dto_h) {
		int n = sqlSession.insert(ns+"addMember_h", dto_h);
		return n > 0;
	}

}
