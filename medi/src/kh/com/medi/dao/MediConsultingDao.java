package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;

public interface MediConsultingDao {
	List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception;
	
	int getBbsCount(MediConsultingAllDto alldto) throws Exception;
}
