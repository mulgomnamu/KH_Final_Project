package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.dao.MediMemberDao;
import kh.com.medi.model.MediAppointmentDto;
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
	public List<MediMember_hDto> getserchhospitalList(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getserchhospitalList", alldto);
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


	@Override
	public MediMember_hDto gethospitaldetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"gethospitaldetail", alldto);
	}


	@Override
	public MediDoctorDto getdocdetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getdocdetail", alldto);
	}


	@Override
	public boolean reserve(MediAppointmentNeedDto alldto) throws Exception {
		int isS=sqlSession.insert(ns+"reserve", alldto);
		return isS>0?true:false;
	}


	@Override
	public boolean confirmreserve(MediAppointmentNeedDto alldto) throws Exception {
		MediAppointmentDto dto=sqlSession.selectOne(ns+"confirmreserve", alldto);
		
		return dto==null?true:false;
	}


	@Override
	public List<MediAppointmentDto> canttime(MediAppointmentNeedDto alldto) throws Exception {
		List<MediAppointmentDto> cattimelist=sqlSession.selectList(ns+"canttime", alldto);
		return cattimelist;
	}


	@Override
	public MediDoctorSchedulDto getdocsceduledetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getdocsceduledetail", alldto);
	}
	


}
