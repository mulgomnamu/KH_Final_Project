package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediHbbsDao;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediMember_hDto;

@Repository
public class MediHbbsDaoImpl implements MediHbbsDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "hbbs.";

	@Override
	public int getBbsCount(MediHbbsParamDto hbbs) throws Exception {
		int number = 0;
		number = sqlSession.selectOne(ns + "getBbsCount", hbbs);
		return number;
	}

	@Override
	public List<MediMember_hDto> getBbsPagingList(MediHbbsParamDto hbbs) throws Exception {
		List<MediMember_hDto> list = sqlSession.selectList(ns + "getBbsPagingList", hbbs);
		return list;
	}

	@Override
	public MediMember_hDto getBbsDetail(int seq) throws Exception {
		MediMember_hDto hdto = sqlSession.selectOne(ns + "getBbsDetail", seq);
		return hdto;
	}

	@Override
	public List<MediDoctorDto> getDoctorDetail(int seq) throws Exception {
		List<MediDoctorDto> doctorList = sqlSession.selectList(ns + "getDoctorDetail", seq);
		return doctorList;
	}

	@Override
	public List<MediMember_hDto> getHospitalList(MediHbbsParamDto hbbs) throws Exception {
		List<MediMember_hDto> hlist = sqlSession.selectList(ns + "getHospitalList", hbbs);
		return hlist;
	}
	
}
