package kh.com.medi.dao;

import java.util.HashMap;
import java.util.List;

import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;


public interface MediMyPageDao {
	
	MediMemberDto Mydetail(MediMemberDto my) throws Exception;

	boolean myUpate(HashMap<String, Object> mep) throws Exception;

	MediMemberDto myup(MediMemberDto my) throws Exception;

	boolean mypwdupdate(HashMap<String, Object> mep) throws Exception;

	boolean mydelete(HashMap<String, Object> mep) throws Exception;
	
	/*QnA*/
	int getBbsCount(MediQnaBbsParamDto mylist) throws Exception;
	
	List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto mylist) throws Exception;
	
	/*커뮤니티*/
	List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception;
	
	int getBbsCount(MediConsultingAllDto alldto) throws Exception;
	
	//디테일
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception;
	
	List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception;
	//조횟수
	public void readcountBbs(MediConsultingAllDto dto) throws Exception;
}
