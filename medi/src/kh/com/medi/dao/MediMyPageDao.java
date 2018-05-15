package kh.com.medi.dao;

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


public interface MediMyPageDao {
	
	MediMemberDto Mydetail(MediMemberDto my) throws Exception;

	boolean myUpate(HashMap<String, Object> mep) throws Exception;

	MediMemberDto myup(MediMemberDto my) throws Exception;

	boolean mypwdupdate(HashMap<String, Object> mep) throws Exception;

	boolean mydelete(HashMap<String, Object> mep) throws Exception;
	
	/*QnA*/
	int getBbsCount(MediQnaBbsParamDto mylist) throws Exception;
	//Qna detail
	public MediQnaBbsDto getQnADetail(MediQnaBbsDto dto) throws Exception;
	//Qna update
	public boolean QnAupdateBbs(MediQnaBbsDto dto) throws Exception;
	//Qna delete
	public boolean QnAdeleteBbs(MediQnaBbsDto dto) throws Exception;

	List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto mylist) throws Exception;
	
	/*커뮤니티*/
	List<MediConsultingQuestionDto> getconPagingList(MediConsultingAllDto alldto) throws Exception;
	//건강상담 삭제
	boolean mybbsDelete(MediConsultingAllDto dto) throws Exception;	
	//건강상담 수정
	public boolean updateBbs(MediConsultingAllDto dto) throws Exception;
	//질문채택완료
	public boolean selectyn(MediConsultingAnswerDto dto) throws Exception;
	//답변 디테일
	MediConsultingAnswerDto answerdetail(MediConsultingAllDto alldto) throws Exception;	
	//답변채택완료
	public boolean selected(MediConsultingAnswerDto dto) throws Exception;
	//병원스코어올리기
	public void plusscore(MediConsultingAllDto dto) throws Exception;
	
	int getBbsCount1(MediConsultingAllDto alldto) throws Exception;
	
	//디테일
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception;
	
	List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception;
	//조횟수
	public void readcountBbs(MediConsultingAllDto dto) throws Exception;

	
	
	boolean checkPhone(MediMemberDto my) throws Exception;
	boolean checkEmail(MediMemberDto my) throws Exception;
	/*예약현황*/
	List<MediAppointmentDto> relist(MediConsultingAllDto dto) throws Exception;
	
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
