package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediHospitalPagingDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediMyListPagingDto;

public interface MediAdminHospitalService {
	
	public int getMemberPagingListCount(MediHospitalPagingDto dto_h);
	public List<MediHospitalPagingDto> getMemberPagingList(MediHospitalPagingDto dto_h);
	public boolean updateMemberByAdmin(MediHospitalPagingDto dto_h);
	public MediHospitalPagingDto getHospitalListatSeq(MediHospitalPagingDto dto_h);
	public List<MediDoctorDto> getDoctorColumnsByAdmin(MediMember_hDto dto_h);
	
	public int getHospitalConfirmImgListCount(MediHospitalPagingDto dto_h);
	public List<MediHospitalPagingDto> getHospitalConfirmImgList(MediHospitalPagingDto dto_h);
	public boolean updateHospitalAuth(MediHospitalPagingDto dto_h);

}
