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
	public boolean updateSchedul(MediDoctorSchedulDto dto_dsc) {
		int n = sqlSession.insert(ns+"updateSchedul", dto_dsc);
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
	public MediDoctorDto getDoctorcolumnBySeq(MediDoctorDto dto_d) {
		return sqlSession.selectOne(ns+"getDoctorcolumnBySeq", dto_d);
	}

	@Override
	public MediDoctorDto getDoctorcolumnByMaxSeq() {
		return sqlSession.selectOne(ns+"getDoctorcolumnByMaxSeq");
	}

	@Override
	public List<MediDoctorDto> getDoctorColumnByHos_seq(MediMember_hDto dto_h) {
		return sqlSession.selectList(ns+"getDoctorColumnByHos_seq", dto_h);
	}

	@Override
	public List<MediSpecialtyDto> getHospitalSpecialtyColumns(MediDoctorDto dto_d) {
		return sqlSession.selectList(ns+"getHospitalSpecialtyColumns", dto_d);
	}

	@Override
	public List<MediDoctorSchedulDto> getHospitalSchedulColumns(MediDoctorDto dto_d) {
		return sqlSession.selectList(ns+"getHospitalSchedulColumns", dto_d);
	}

	@Override
	public boolean delHospitalSpecialtyColumns(MediDoctorDto dto_d) {
		int n = sqlSession.update(ns+"delHospitalSpecialtyColumns", dto_d);
		return n > 0;
	}

	@Override
	public boolean delHospitalSchedulColumns(MediDoctorDto dto_d) {
		int n = sqlSession.update(ns+"delHospitalSchedulColumns", dto_d);
		return n > 0;
	}

}
