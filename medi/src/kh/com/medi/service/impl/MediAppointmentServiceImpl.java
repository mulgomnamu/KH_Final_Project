package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.dao.MediMemberDao;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.service.MediAppointmentService;
import kh.com.medi.service.MediMemberService;

@Service
public class MediAppointmentServiceImpl implements MediAppointmentService {
	
	@Autowired
	private MediAppointmentDao mediAppointmentDao;


}
