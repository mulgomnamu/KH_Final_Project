package kh.com.medi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediHbbsDao;
import kh.com.medi.service.MediHbbsService;

@Service
public class MediHbbsServiceImpl implements MediHbbsService {

	@Autowired
	private MediHbbsDao mediHbbsDao;
	
}
