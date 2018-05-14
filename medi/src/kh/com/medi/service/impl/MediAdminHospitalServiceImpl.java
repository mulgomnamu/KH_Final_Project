package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAdminHospitalDao;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediHospitalPagingDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.service.MediAdminHospitalService;

@Service
public class MediAdminHospitalServiceImpl implements MediAdminHospitalService {
	
	@Autowired
	MediAdminHospitalDao mediAdminHospitalDao;

	@Override
	public int getMemberPagingListCount(MediHospitalPagingDto dto_h) {
		return mediAdminHospitalDao.getMemberPagingListCount(dto_h);
	}

	@Override
	public List<MediHospitalPagingDto> getMemberPagingList(MediHospitalPagingDto dto_h) {
		return mediAdminHospitalDao.getMemberPagingList(dto_h);
	}

	@Override
	public boolean updateMemberByAdmin(MediHospitalPagingDto dto_h) {
		return mediAdminHospitalDao.updateMemberByAdmin(dto_h);
	}

	@Override
	public MediHospitalPagingDto getHospitalListatSeq(MediHospitalPagingDto dto_h) {
		return mediAdminHospitalDao.getHospitalListatSeq(dto_h);
	}

	@Override
	public List<MediDoctorDto> getDoctorColumnsByAdmin(MediMember_hDto dto_h) {
		return mediAdminHospitalDao.getDoctorColumnsByAdmin(dto_h);
	}

	@Override
	public int getHospitalConfirmImgListCount(MediHospitalPagingDto dto_h) {
		return mediAdminHospitalDao.getHospitalConfirmImgListCount(dto_h);
	}

	@Override
	public List<MediHospitalPagingDto> getHospitalConfirmImgList(MediHospitalPagingDto dto_h) {
		return mediAdminHospitalDao.getHospitalConfirmImgList(dto_h);
	}

	@Override
	public boolean updateHospitalAuth(MediHospitalPagingDto dto_h) {
		return mediAdminHospitalDao.updateHospitalAuth(dto_h);
	}

}
