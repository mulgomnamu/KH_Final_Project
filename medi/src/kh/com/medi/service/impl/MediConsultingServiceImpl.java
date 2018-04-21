package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.dao.MediConsultingDao;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediConsultingService;
@Service
public class MediConsultingServiceImpl implements MediConsultingService {
	@Autowired
	MediConsultingDao mediConsultingDao;

	@Override
	public List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.getBbsPagingList(alldto);
	}

	@Override
	public int getBbsCount(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.getBbsCount(alldto);
	}

	@Override
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.getBbsDetail(dto);
	}

	@Override
	public boolean insertBbs(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.insertBbs(dto);
	}

	@Override
	public boolean deleteBbs(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.deleteBbs(dto);
	}

	@Override
	public boolean updateBbs(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.updateBbs(dto);
	}

	@Override
	public void readcountBbs(MediConsultingAllDto dto) throws Exception {
		mediConsultingDao.readcountBbs(dto);
	}

	@Override
	public void commentcountBbs(MediConsultingAllDto dto) throws Exception {
		mediConsultingDao.commentcountBbs(dto);
	}

	@Override
	public boolean selectyn(MediConsultingAnswerDto dto) throws Exception {
		return mediConsultingDao.selectyn(dto);
	}

	@Override
	public boolean answerinsert(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.answerinsert(dto);
	}

	@Override
	public boolean answerdelete(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.answerdelete(dto);
	}

	@Override
	public boolean answerupdate(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.answerupdate(dto);
	}

	@Override
	public MediMember_hDto get() throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.get();
	}

	@Override
	public List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.answerlist(alldto);
	}

	@Override
	public MediConsultingAnswerDto answerdetail(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.answerdetail(alldto);
	}

	@Override
	public boolean selected(MediConsultingAnswerDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediConsultingDao.selected(dto);
	}


}
