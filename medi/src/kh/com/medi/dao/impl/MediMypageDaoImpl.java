package kh.com.medi.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediMyPageDao;
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


@Repository
public class MediMypageDaoImpl implements MediMyPageDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediMyPage.";
	
	@Override
	public MediMemberDto Mydetail(MediMemberDto my) throws Exception {		
		return sqlSession.selectOne(ns+"mydetail", my);
	}
	
	@Override
	public boolean myUpate(HashMap<String, Object> mep) throws Exception{
		int h = sqlSession.update(ns+"myupdate", mep);
		
		return h>0?true:false;
	}
	
	@Override
	public boolean mydelete(HashMap<String, Object> mep)throws Exception{
	    int h = sqlSession.update(ns+"Mydelete",mep);	
		
		return h>0?true:false;
	}
	@Override
	public MediMemberDto myup(MediMemberDto my) throws Exception{
		   return sqlSession.selectOne(ns+"myup", my);

	}
	@Override
	public boolean mypwdupdate(HashMap<String, Object> mep) throws Exception{
		int h = sqlSession.update(ns+"mypwdupdateAf", mep);
		
		return h>0?true:false;
	}
	
	@Override
	public int getBbsCount(MediQnaBbsParamDto mylist) throws Exception {
		int number = 0;
		number = sqlSession.selectOne(ns+"getBbsCount", mylist);
		return number;
	}

	@Override
	public List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto mylist) throws Exception {
		List<MediQnaBbsDto> list = sqlSession.selectList(ns+"getBbsPagingList", mylist);
		return list;
	}

	@Override
	public boolean checkPhone(MediMemberDto my) throws Exception {
		int n = sqlSession.selectOne(ns+"checkPhone", my);
		return n > 0;
	}

	@Override
	public boolean checkEmail(MediMemberDto my) throws Exception {
		int n = sqlSession.selectOne(ns+"checkEmail", my);
		return n > 0;
	}
	
	@Override
	public List<MediConsultingQuestionDto> getconPagingList(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"ConsultingPagingList", alldto);
	}

	@Override
	public int getBbsCount(MediConsultingAllDto alldto) throws Exception {
		int number = 0;
		number = sqlSession.selectOne(ns + "getcomCount", alldto);
		return number;
	}

	@Override
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getBbsDetail", dto);
	}

	@Override
	public List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception {
		
		return sqlSession.selectList(ns+"answerlist1", alldto);
	}
	
	@Override
	public void readcountBbs(MediConsultingAllDto dto) throws Exception {
		sqlSession.update(ns+"plusreadcount", dto);
	}
	/*예약현황*/
	@Override
	public List<MediAppointmentDto> relist(MediConsultingAllDto dto) throws Exception{
		
		return sqlSession.selectList(ns+"answerlist", dto);
		
	}

	@Override
	public int getanswerlistCount(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getanswerlistCount", alldto);
	}
	
	@Override
	public MediMember_hDto mygethospitaldetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"mygethospitaldetail", alldto);
	}
	
	@Override
	public MediDoctorDto mygetdocdetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"mygetdocdetail", alldto);
	}
	@Override
	public MediAppointmentDto myreservedetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"myreservedetail", alldto);
	}
	@Override
	public boolean myresevecancel(MediAppointmentNeedDto alldto) throws Exception {
		int count=sqlSession.delete(ns+"myresevecancel", alldto);
		
		return count>0?true:false;
	}
	@Override
	public boolean mybbsDelete(MediConsultingAllDto dto) throws Exception{
		int count=sqlSession.update(ns+"mybbsDelete",dto);
		
		return count>0?true:false;
	}
	
	@Override
	public boolean updateBbs(MediConsultingAllDto dto) throws Exception {
		int count=sqlSession.update(ns+"bbsUpdate", dto);
		return count>0?true:false;
	}
	
	@Override
	public boolean selected(MediConsultingAnswerDto dto) throws Exception {
		int count=sqlSession.update(ns+"myselected", dto);
		return count>0?true:false;
	}
	
	@Override
	public boolean selectyn(MediConsultingAnswerDto dto) throws Exception {
		int count=sqlSession.update(ns+"myselectyn", dto);
		return count>0?true:false;
	}
	@Override
	public void plusscore(MediConsultingAllDto dto) throws Exception {
		sqlSession.update(ns+"myplusscore", dto);
	}
	@Override
	public MediConsultingAnswerDto answerdetail(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"myanswerdetail", alldto);
	}
	
}
