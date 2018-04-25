package kh.com.medi.service;

import java.util.HashMap;
import java.util.List;

import kh.com.medi.model.MediConsultingAllDto;
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
	
	public List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto mylist) throws Exception;
	
	List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception;
	
	int getBbsCount(MediConsultingAllDto alldto) throws Exception;
}
