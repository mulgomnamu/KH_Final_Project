package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;

public interface MediConsultingDao {
	//질문 페이징리스트
	List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception;
	//전체갯수
	int getBbsCount(MediConsultingAllDto alldto) throws Exception;
	//디테일
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception;
	//추가
	public boolean insertBbs(MediConsultingAllDto dto) throws Exception;
	//삭제
	public boolean deleteBbs(MediConsultingAllDto dto) throws Exception;
	//수정
	public boolean updateBbs(MediConsultingAllDto dto) throws Exception;
	//조회수올리기
	public void readcountBbs(MediConsultingAllDto dto) throws Exception;
	//답글수올리기
	public void commentcountBbs(MediConsultingAllDto dto) throws Exception;
	//질문채택완료
	public boolean selectyn(MediConsultingAnswerDto dto) throws Exception;
	//의사답글추가
	public boolean answerinsert(MediConsultingAllDto dto) throws Exception;
	//의사답글삭제
	public boolean answerdelete(MediConsultingAllDto dto) throws Exception;
	//의사답글수정
	public boolean answerupdate(MediConsultingAllDto dto) throws Exception;
	//답변 리스트
	List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception;
	//답변 디테일
	MediConsultingAnswerDto answerdetail(MediConsultingAllDto alldto) throws Exception;	
	//답변채택완료
	public boolean selected(MediConsultingAnswerDto dto) throws Exception;
	
	
	//병원디테일
	public MediConsultingAnswerDto get(MediConsultingAllDto dto) throws Exception;
	//질문만 페이징리스트
	List<MediConsultingQuestionDto> getquePagingList(MediConsultingAllDto alldto) throws Exception;
	//질문만갯수
	int getqueCount(MediConsultingAllDto alldto) throws Exception;
	//답변완료 페이징리스트
	List<MediConsultingQuestionDto> getansweredList(MediConsultingAllDto alldto) throws Exception;
	//답변완료갯수
	int getanswerCount(MediConsultingAllDto alldto) throws Exception;
	//병원스코어올리기
	public void plusscore(MediConsultingAllDto dto) throws Exception;

}
