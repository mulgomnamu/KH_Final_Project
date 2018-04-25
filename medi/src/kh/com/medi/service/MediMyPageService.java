package kh.com.medi.service;

import java.util.HashMap;
import java.util.List;

import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;


public interface MediMyPageService {

public MediMemberDto Mydetail(MediMemberDto my) throws Exception;
	
	public boolean myUpate(HashMap<String, Object> mep) throws Exception;
	
	public boolean mydelete(HashMap<String, Object> mep)throws Exception;

	public MediMemberDto myup(MediMemberDto my) throws Exception;
	
	public boolean mypwdupdate(HashMap<String, Object> mep) throws Exception;
	
	public int getBbsCount(MediQnaBbsParamDto mylist) throws Exception;
	
<<<<<<< HEAD
	public List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto mylist) throws Exception;
	
	List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception;
	
	int getBbsCount(MediConsultingAllDto alldto) throws Exception;
	
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception;
	
	List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception;
	//조회수올리기
	public void readcountBbs(MediConsultingAllDto dto) throws Exception;
=======
	public List<MediMemberDto> getBbsPagingList(MediMyListPagingDto mylist) throws Exception;
	
	public boolean checkPhone(MediMemberDto my) throws Exception;
	public boolean checkEmail(MediMemberDto my) throws Exception;
>>>>>>> branch 'master' of https://github.com/mulgomnamu/KH_Final_Project.git
}
