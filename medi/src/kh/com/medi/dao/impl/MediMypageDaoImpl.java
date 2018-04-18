package kh.com.medi.dao.impl;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediMyPageDao;
import kh.com.medi.model.MediMemberDto;


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
	
	
}
