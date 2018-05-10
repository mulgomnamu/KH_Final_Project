package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAdminHospitalDao;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediHospitalPagingDto;
import kh.com.medi.model.MediMember_hDto;

@Repository
public class MediAdminHospitalDaoImpl implements MediAdminHospitalDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediAdmin.";

	@Override
	public int getMemberPagingListCount(MediHospitalPagingDto dto_h) {
		return sqlSession.selectOne(ns+"getHospitalPagingListCount", dto_h);
	}

	@Override
	public List<MediHospitalPagingDto> getMemberPagingList(MediHospitalPagingDto dto_h) {
		return sqlSession.selectList(ns+"getHospitalPagingList", dto_h);
	}

	@Override
	public boolean updateMemberByAdmin(MediHospitalPagingDto dto_h) {
		int n = sqlSession.update(ns+"updateHospitalByAdmin", dto_h);
		return n > 0;
	}

	@Override
	public MediHospitalPagingDto getHospitalListatSeq(MediHospitalPagingDto dto_h) {
		return sqlSession.selectOne(ns+"getHospitalListatSeq", dto_h);
	}

	@Override
	public List<MediDoctorDto> getDoctorColumnsByAdmin(MediMember_hDto dto_h) {
		return sqlSession.selectList(ns+"getDoctorColumnsByAdmin", dto_h);
	}

}
