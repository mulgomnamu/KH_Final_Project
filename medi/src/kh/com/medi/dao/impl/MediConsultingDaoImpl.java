package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediConsultingDao;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediMember_hDto;

@Repository
public class MediConsultingDaoImpl implements MediConsultingDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Consulting.";

	@Override
	public List<MediConsultingQuestionDto> getBbsPagingList(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"ConsultingPagingList", alldto);
	}

	@Override
	public int getBbsCount(MediConsultingAllDto alldto) throws Exception {
		int number = 0;
		number = sqlSession.selectOne(ns + "getBbsCount", alldto);
		return number;
	}

	@Override
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"getBbsDetail", dto);
	}

	@Override
	public boolean insertBbs(MediConsultingAllDto dto) throws Exception {
		int count=sqlSession.insert(ns+"insertBbs", dto);
		return count>0?true:false;
	}

	@Override
	public boolean deleteBbs(MediConsultingAllDto dto) throws Exception {
		int count=sqlSession.update(ns+"bbsDelete", dto);
		return count>0?true:false;
	}

	@Override
	public boolean updateBbs(MediConsultingAllDto dto) throws Exception {
		int count=sqlSession.update(ns+"bbsUpdate", dto);
		return count>0?true:false;
	}

	@Override
	public void readcountBbs(MediConsultingAllDto dto) throws Exception {
		sqlSession.update(ns+"plusreadcount", dto);
	}

	@Override
	public void commentcountBbs(MediConsultingAllDto dto) throws Exception {
		sqlSession.update(ns+"pluscommentcount", dto);
	}

	@Override
	public boolean selectyn(MediConsultingAnswerDto dto) throws Exception {
		int count=sqlSession.update(ns+"selectyn", dto);
		return count>0?true:false;
	}

	@Override
	public boolean answerinsert(MediConsultingAllDto dto) throws Exception {
		int count=sqlSession.insert(ns+"answerinsert", dto);
		return count>0?true:false;
	}

	@Override
	public boolean answerdelete(MediConsultingAllDto dto) throws Exception {
		int count=sqlSession.update(ns+"answerdelete", dto);
		return count>0?true:false;
	}

	@Override
	public boolean answerupdate(MediConsultingAllDto dto) throws Exception {
		int count=sqlSession.update(ns+"answerupdate", dto);
		return count>0?true:false;
	}

	@Override
	public MediMember_hDto get() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"gethospitaldetail");
	}

	@Override
	public List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"answerlist", alldto);
	}

	@Override
	public MediConsultingAnswerDto answerdetail(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ns+"answerdetail", alldto);
	}

	@Override
	public boolean selected(MediConsultingAnswerDto dto) throws Exception {
		int count=sqlSession.update(ns+"selected", dto);
		return count>0?true:false;
	}

	@Override
	public List<MediConsultingQuestionDto> getquePagingList(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getquePagingList", alldto);
	}

	@Override
	public int getqueCount(MediConsultingAllDto alldto) throws Exception {
		int number = 0;
		number = sqlSession.selectOne(ns + "getqueCount", alldto);
		return number;
	}

	@Override
	public List<MediConsultingQuestionDto> getansweredList(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns+"getansweredList", alldto);
	}

	@Override
	public int getanswerCount(MediConsultingAllDto alldto) throws Exception {
		int number = 0;
		number = sqlSession.selectOne(ns + "getanswerCount", alldto);
		return number;
	}
}
