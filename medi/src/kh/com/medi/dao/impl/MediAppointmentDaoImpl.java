package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.dao.MediMemberDao;
import kh.com.medi.model.MediMemberDto;

@Repository
public class MediAppointmentDaoImpl implements MediAppointmentDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Appointment.";


}
