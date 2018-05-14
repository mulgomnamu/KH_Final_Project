package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAdminDoctorDao;
import kh.com.medi.model.MediDoctorPagingDto;
import kh.com.medi.service.MediAdminDoctorService;

@Service
public class MediAdminDoctorServiceImpl implements MediAdminDoctorService {
	
	@Autowired
	MediAdminDoctorDao mediAdminDoctorDao;

	@Override
	public int getDoctorPagingListCount(MediDoctorPagingDto dto_d) {
		return mediAdminDoctorDao.getDoctorPagingListCount(dto_d);
	}

	@Override
	public List<MediDoctorPagingDto> getDoctorPagingList(MediDoctorPagingDto dto_d) {
		return mediAdminDoctorDao.getDoctorPagingList(dto_d);
	}

	@Override
	public boolean updateDoctorByAdmin(MediDoctorPagingDto dto_d) {
		return mediAdminDoctorDao.updateDoctorByAdmin(dto_d);
	}

	@Override
	public MediDoctorPagingDto getDoctorListatSeq(MediDoctorPagingDto dto_d) {
		return mediAdminDoctorDao.getDoctorListatSeq(dto_d);
	}

}
