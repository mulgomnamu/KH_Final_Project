package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediMember_hDao;
import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediHospital_subject;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSubjectDto;

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

	@Override
	public boolean addHospitalImage(MediHospital_imageDto dto_hi) {
		int n = sqlSession.insert(ns+"addImage", dto_hi);
		return n > 0;
	}

	@Override
	public boolean addHospitalSubject(MediHospital_subject dto_s) {
		int n = sqlSession.insert(ns+"addSubject", dto_s);
		return n > 0;
	}

	@Override
	public boolean deleteHospitalSubject(MediHospital_subject dto_s) {
		int n = sqlSession.delete(ns+"deleteSubject", dto_s);
		return n > 0;
	}

	@Override
	public boolean checkId(MediMember_hDto dto_h) {
		int n = sqlSession.selectOne(ns+"checkId_h", dto_h);
		return n > 0;
	}

	@Override
	public int checkTel(MediMember_hDto dto_h) {
		return sqlSession.selectOne(ns+"checkTel_h", dto_h);
	}

	@Override
	public int checkAddress(MediMember_hDto dto_h) {
		return sqlSession.selectOne(ns+"checkAddress_h", dto_h);
	}

	@Override
	public int checkEmail(MediMember_hDto dto_h) {
		return sqlSession.selectOne(ns+"checkEmail_h", dto_h);
	}

	@Override
	public MediMember_hDto getHospitalColumn(String id) {
		return sqlSession.selectOne(ns+"getHospitalColumn", id);
	}

	@Override
	public boolean updateMember_h(MediMember_hDto dto_h) {
		int n = sqlSession.update(ns+"updateMember_h", dto_h);
		return n > 0;
	}

	@Override
	public boolean deleteMember_h(MediMember_hDto dto_h) {
		int n = sqlSession.update(ns+"deleteMember_h", dto_h);
		return n > 0;
	}

	@Override
	public MediMember_hDto login(MediMember_hDto dto_h) {
		return sqlSession.selectOne(ns+"loginCheck", dto_h);
	}

	@Override
	public boolean changePwd(MediMember_hDto dto_h) {
		int n = sqlSession.update(ns+"changePwd", dto_h);
		return n > 0;
	}
	
	@Override
	public List<MediSubjectDto> getHospitalSubjectColumns(MediMember_hDto dto_h) {
		return sqlSession.selectList(ns+"getHospitalSubjectColumns", dto_h);
	}

	@Override
	public List<MediHospital_imageDto> getImageList(MediMember_hDto dto_h) {
		return sqlSession.selectList(ns+"getImageList", dto_h);
	}

	@Override
	public List<MediMember_hDto> getScoreList() {
		return sqlSession.selectList(ns+"getScoreList");
	}

	@Override
	public int getDoctorCount(int seq) {
		return sqlSession.selectOne(ns+"getDoctorCount", seq);
	}
}
