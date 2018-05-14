package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediAdminReservationDto;

public interface MediAdminReservationDao {
	
	int getAdminReservationListCount(MediAdminReservationDto dto_r);
	List<MediAdminReservationDto> getAdminReservationList(MediAdminReservationDto dto_r);
	boolean deleteAdminReservation(MediAdminReservationDto dto_r);

	
	int getHospitalReservationListCount(MediAdminReservationDto dto_r);
	List<MediAdminReservationDto> getHospitalReservationList(MediAdminReservationDto dto_r);
	boolean deleteHospitalReservation(MediAdminReservationDto dto_r);

}
