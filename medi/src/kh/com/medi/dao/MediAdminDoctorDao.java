package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediDoctorPagingDto;

public interface MediAdminDoctorDao {

	int getDoctorPagingListCount(MediDoctorPagingDto dto_d);
	List<MediDoctorPagingDto> getDoctorPagingList(MediDoctorPagingDto dto_d);
	boolean updateDoctorByAdmin(MediDoctorPagingDto dto_d);
	MediDoctorPagingDto getDoctorListatSeq(MediDoctorPagingDto dto_d);

}
