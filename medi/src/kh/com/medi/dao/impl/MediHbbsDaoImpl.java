package kh.com.medi.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediHbbsDao;

@Repository
public class MediHbbsDaoImpl implements MediHbbsDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = ".";
	
}
