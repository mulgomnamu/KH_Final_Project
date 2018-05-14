package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediDoctorPagingDto;

public interface MediAdminDoctorService {

	public int getDoctorPagingListCount(MediDoctorPagingDto dto_d);
	public List<MediDoctorPagingDto> getDoctorPagingList(MediDoctorPagingDto dto_d);
	public boolean updateDoctorByAdmin(MediDoctorPagingDto dto_d);
	public MediDoctorPagingDto getDoctorListatSeq(MediDoctorPagingDto dto_d);

}
