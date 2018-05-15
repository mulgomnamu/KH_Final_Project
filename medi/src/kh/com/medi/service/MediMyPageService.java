package kh.com.medi.service;

import java.util.HashMap;
import java.util.List;

import kh.com.medi.model.MediAppointmentDto;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMember_hDto;
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
	
	public List<MediConsultingQuestionDto> getconPagingList(MediConsultingAllDto alldto) throws Exception;
	
	int getBbsCount(MediConsultingAllDto alldto) throws Exception;
	
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception;
	
	public List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception;
	//조회수올리기
	public void readcountBbs(MediConsultingAllDto dto) throws Exception;
	//건강상담 삭제
	public boolean mybbsDelete(MediConsultingAllDto dto) throws Exception;
	//건강상담 수정
	public boolean updateBbs(MediConsultingAllDto dto) throws Exception;
	//답변채택완료
	public boolean selected(MediConsultingAnswerDto dto) throws Exception;
	//채택완료
	public boolean selectyn(MediConsultingAnswerDto dto) throws Exception;
	//답변 디테일
	MediConsultingAnswerDto answerdetail(MediConsultingAllDto alldto) throws Exception;	
	//병원스코어올리기
	public void plusscore(MediConsultingAllDto dto) throws Exception;
	
	public boolean checkPhone(MediMemberDto my) throws Exception;
	public boolean checkEmail(MediMemberDto my) throws Exception;
	/*예약현황*/
	public List<MediAppointmentDto> relist(MediConsultingAllDto dto) throws Exception;
	int getanswerlistCount(MediConsultingAllDto alldto) throws Exception;
	//예약디테일
	public MediAppointmentDto myreservedetail(MediAppointmentNeedDto alldto)throws Exception;
	//의사디테일
	public MediDoctorDto mygetdocdetail(MediAppointmentNeedDto alldto)throws Exception;
	//병원디테일
	public MediMember_hDto mygethospitaldetail(MediAppointmentNeedDto alldto)throws Exception;
	//예약취소
	public boolean myresevecancel(MediAppointmentNeedDto alldto)throws Exception;		
}
