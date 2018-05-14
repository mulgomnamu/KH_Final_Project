package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediAdminReservationDto;

public interface MediAdminReservationService {
	
	public int getAdminReservationListCount(MediAdminReservationDto dto_r);
	public List<MediAdminReservationDto> getAdminReservationList(MediAdminReservationDto dto_r);
	public boolean deleteAdminReservation(MediAdminReservationDto dto_r);

	
	public int getHospitalReservationListCount(MediAdminReservationDto dto_r);
	public List<MediAdminReservationDto> getHospitalReservationList(MediAdminReservationDto dto_r);
	public boolean deleteHospitalReservation(MediAdminReservationDto dto_r);

}
