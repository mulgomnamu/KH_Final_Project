package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediHbbsDao;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediHbbsReviews;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediHbbsService;

@Service
public class MediHbbsServiceImpl implements MediHbbsService {

	@Autowired
	private MediHbbsDao mediHbbsDao;

	@Override
	public int getBbsCount(MediHbbsParamDto hbbs) throws Exception {
		return mediHbbsDao.getBbsCount(hbbs);
	}

	@Override
	public List<MediMember_hDto> getBbsPagingList(MediHbbsParamDto hbbs) throws Exception {
		return mediHbbsDao.getBbsPagingList(hbbs);
	}

	@Override
	public MediMember_hDto getBbsDetail(int seq) throws Exception {
		return mediHbbsDao.getBbsDetail(seq);
	}

	@Override
	public List<MediDoctorDto> getDoctorDetail(int seq) throws Exception {
		return mediHbbsDao.getDoctorDetail(seq);
	}
	
	// 맵 시작
	@Override
	public List<MediMember_hDto> getHospitalList(MediHbbsParamDto hbbs) throws Exception {
		return mediHbbsDao.getHospitalList(hbbs);
	}

	// 이용후기 시작
	@Override
	public boolean writeReviews(MediHbbsReviews redto) throws Exception {
		return mediHbbsDao.writeReviews(redto);
	}

	@Override
	public List<MediHbbsReviews> getReviews(MediHbbsParamDto hbbsp) throws Exception {
		return mediHbbsDao.getReviews(hbbsp);
	}

	@Override
	public int getReviewsCount(MediHbbsParamDto hbbsp) throws Exception {
		// TODO Auto-generated method stub
		return mediHbbsDao.getReviewsCount(hbbsp);
	}

}
