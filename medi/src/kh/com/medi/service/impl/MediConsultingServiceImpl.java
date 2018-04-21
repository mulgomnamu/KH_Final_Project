package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.dao.MediConsultingDao;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingQuestionDto;
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

}
