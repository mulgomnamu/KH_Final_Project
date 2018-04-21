package kh.com.medi.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediDoctorDao;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctor_specialtyDto;
import kh.com.medi.service.MediDoctorService;

@Service
public class MediDoctorServiceImpl implements MediDoctorService {
	
	@Autowired
	MediDoctorDao mediDoctorDao;

	@Override
	public boolean addDoctor(MediDoctorDto dto_d) {
		return mediDoctorDao.addDoctor(dto_d);
	}

	@Override
	public boolean addSpecialty(MediDoctor_specialtyDto dto_ds) {
		return mediDoctorDao.addSpecialty(dto_ds);
	}

}
