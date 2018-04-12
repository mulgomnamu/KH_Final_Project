package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.dao.MediMemberDao;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMember_hDto;

@Repository
public class MediAppointmentDaoImpl implements MediAppointmentDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Appointment.";

	@Override
	public List<MediMember_hDto> gethospitalList(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"gethospitalList", alldto);
	}

	@Override
	public List<MediDoctorDto> getdoclist(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getdocList", alldto);
	}

	@Override
	public List<MediDoctorSchedulDto> getdocscedulelist(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getdocscedulelist", alldto);
	}
	


}
