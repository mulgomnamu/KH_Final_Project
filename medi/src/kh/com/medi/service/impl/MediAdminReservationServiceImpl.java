package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAdminReservationDao;
import kh.com.medi.model.MediAdminReservationDto;
import kh.com.medi.service.MediAdminReservationService;

@Service
public class MediAdminReservationServiceImpl implements MediAdminReservationService {
	
	@Autowired
	MediAdminReservationDao mediAdminReservationDao;

	@Override
	public int getAdminReservationListCount(MediAdminReservationDto dto_r) {
		return mediAdminReservationDao.getAdminReservationListCount(dto_r);
	}

	@Override
	public List<MediAdminReservationDto> getAdminReservationList(MediAdminReservationDto dto_r) {
		return mediAdminReservationDao.getAdminReservationList(dto_r);
	}

	@Override
	public boolean deleteAdminReservation(MediAdminReservationDto dto_r) {
		return mediAdminReservationDao.deleteAdminReservation(dto_r);
	}

	@Override
	public int getHospitalReservationListCount(MediAdminReservationDto dto_r) {
		return mediAdminReservationDao.getHospitalReservationListCount(dto_r);
	}

	@Override
	public List<MediAdminReservationDto> getHospitalReservationList(MediAdminReservationDto dto_r) {
		return mediAdminReservationDao.getHospitalReservationList(dto_r);
	}

	@Override
	public boolean deleteHospitalReservation(MediAdminReservationDto dto_r) {
		return mediAdminReservationDao.deleteHospitalReservation(dto_r);
	}

}
