package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediDoctorDao;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediDoctor_specialtyDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;

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

	@Override
	public boolean addSpecialty(MediDoctor_specialtyDto dto_ds) {
		int n = sqlSession.insert(ns+"addSpecialty", dto_ds);
		return n > 0;
	}

	@Override
	public boolean addSchedul(MediDoctorSchedulDto dto_dsc) {
		int n = sqlSession.insert(ns+"addSchedul", dto_dsc);
		return n > 0;
	}

	@Override
	public boolean updateDoctor(MediDoctorDto dto_d) {
		int n = sqlSession.update(ns+"updateDoctor", dto_d);
		return n > 0;
	}

	@Override
	public boolean deleteDoctor(MediDoctorDto dto_d) {
		int n = sqlSession.update(ns+"deleteDoctor", dto_d);
		return n > 0;
	}

	@Override
	public MediDoctorDto getDoctorColumn(MediMember_hDto dto_h) {
		return sqlSession.selectOne(ns+"getDoctorColumn", dto_h);
	}

	@Override
	public List<MediSpecialtyDto> getHospitalSpecialtyColumns(MediMember_hDto dto_h) {
		return sqlSession.selectList(ns+"getHospitalSpecialtyColumns", dto_h);
	}

	@Override
	public List<MediDoctorSchedulDto> getHospitalSchedulColumns(MediMember_hDto dto_h) {
		return sqlSession.selectList(ns+"getHospitalSchedulColumns", dto_h);
	}

}
