package kh.com.medi.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediDoctorDao;
import kh.com.medi.model.MediDoctorDto;

@Repository
public class MediDoctorDaoImpl implements MediDoctorDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediDoctor.";

	@Override
	public boolean addDoctor(MediDoctorDto dto_d) {
		int n = sqlSession.insert(ns+"addDoctor", dto_d);
		return n > 0;
	}

}
