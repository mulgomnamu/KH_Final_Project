package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAdminDoctorDao;
import kh.com.medi.model.MediDoctorPagingDto;

@Repository
public class MediAdminDoctorDaoImpl implements MediAdminDoctorDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediAdminDoctor.";

	@Override
	public int getDoctorPagingListCount(MediDoctorPagingDto dto_d) {
		return sqlSession.selectOne(ns+"getDoctorPagingListCount", dto_d);
	}

	@Override
	public List<MediDoctorPagingDto> getDoctorPagingList(MediDoctorPagingDto dto_d) {
		return sqlSession.selectList(ns+"getDoctorPagingList", dto_d);
	}

	@Override
	public boolean updateDoctorByAdmin(MediDoctorPagingDto dto_d) {
		int n = sqlSession.update(ns+"updateDoctorByAdmin", dto_d);
		return n > 0;
	}

	@Override
	public MediDoctorPagingDto getDoctorListatSeq(MediDoctorPagingDto dto_d) {
		return sqlSession.selectOne(ns+"getDoctorListatSeq", dto_d);
	}

}
