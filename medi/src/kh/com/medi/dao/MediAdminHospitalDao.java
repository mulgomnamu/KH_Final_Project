package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediHospitalPagingDto;
import kh.com.medi.model.MediMember_hDto;

public interface MediAdminHospitalDao {

	int getMemberPagingListCount(MediHospitalPagingDto dto_h);
	List<MediHospitalPagingDto> getMemberPagingList(MediHospitalPagingDto dto_h);
	boolean updateMemberByAdmin(MediHospitalPagingDto dto_h);
	MediHospitalPagingDto getHospitalListatSeq(MediHospitalPagingDto dto_h);
	List<MediDoctorDto> getDoctorColumnsByAdmin(MediMember_hDto dto_h);

}
