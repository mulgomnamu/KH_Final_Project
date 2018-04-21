package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingQuestionDto;

public interface MediConsultingService {
	List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception;
	
	int getBbsCount(MediConsultingAllDto alldto) throws Exception;
}
