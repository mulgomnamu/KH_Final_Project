package kh.com.medi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediHealthBookDao;
import kh.com.medi.dao.MediMyPageDao;
import kh.com.medi.service.MediHeathBookService;

@Service
public class MediHealthBookServiceImpl implements MediHeathBookService {
	
	@Autowired
	private MediHealthBookDao mediHealthBookDao;

}
