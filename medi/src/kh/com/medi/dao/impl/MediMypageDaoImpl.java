package kh.com.medi.dao.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediMyPageDao;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediMemberDto;
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
	public List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception {
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
		
		return sqlSession.selectList(ns+"answerlist", alldto);
	}
	
	@Override
	public void readcountBbs(MediConsultingAllDto dto) throws Exception {
		sqlSession.update(ns+"plusreadcount", dto);
	}

}
