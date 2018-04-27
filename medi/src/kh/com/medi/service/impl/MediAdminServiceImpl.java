package kh.com.medi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;

import kh.com.medi.dao.MediAdminDao;
import kh.com.medi.service.MediAdminService;

public class MediAdminServiceImpl implements MediAdminService {
	
	@Autowired
	MediAdminDao mediAdminDao;

}
