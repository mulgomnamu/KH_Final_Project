package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAdminReservationDao;
import kh.com.medi.model.MediAdminReservationDto;

@Repository
public class MediAdminReservationDaoImpl implements MediAdminReservationDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediAdminReservation.";

	@Override
	public int getAdminReservationListCount(MediAdminReservationDto dto_r) {
		return sqlSession.selectOne(ns+"getAdminReservationListCount", dto_r);
	}

	@Override
	public List<MediAdminReservationDto> getAdminReservationList(MediAdminReservationDto dto_r) {
		return sqlSession.selectList(ns+"getAdminReservationList", dto_r);
	}

	@Override
	public boolean deleteAdminReservation(MediAdminReservationDto dto_r) {
		int n = sqlSession.delete(ns+"deleteAdminReservation", dto_r);
		return n > 0;
	}

	@Override
	public int getHospitalReservationListCount(MediAdminReservationDto dto_r) {
		return sqlSession.selectOne(ns+"getHospitalReservationListCount", dto_r);
	}

	@Override
	public List<MediAdminReservationDto> getHospitalReservationList(MediAdminReservationDto dto_r) {
		return sqlSession.selectList(ns+"getHospitalReservationList", dto_r);
	}

	@Override
	public boolean deleteHospitalReservation(MediAdminReservationDto dto_r) {
		int n = sqlSession.delete(ns+"deleteHospitalReservation", dto_r);
		return n > 0;
	}

}
