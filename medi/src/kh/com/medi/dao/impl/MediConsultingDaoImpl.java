package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediConsultingDao;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingQuestionDto;

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
}
