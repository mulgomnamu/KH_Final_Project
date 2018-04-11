package kh.com.medi.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediHealthBookDao;
import kh.com.medi.model.MediHealthBookDto;
@Repository
public class MediHealthBookDaoImpl implements MediHealthBookDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "HealthBook.";

	@Override
	public boolean Healthmain(MediHealthBookDto healthbook) throws Exception {
		int n = sqlSession.insert(ns+"Healthmain", healthbook);
		return n>0? true:false;
	}
}
