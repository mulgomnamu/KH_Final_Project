package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediMemberDao;
import kh.com.medi.model.MediMemberDto;

@Repository
public class MediMemberDaoImpl implements MediMemberDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediMember.";

	@Override
	public List<MediMemberDto> test() throws Exception {
		return sqlSession.selectList(ns+"test");
	}

	@Override
	public MediMemberDto idCheck(String id) throws Exception {
		MediMemberDto dto = sqlSession.selectOne(ns+"idcheck", id);
		return dto;
	}

	@Override
	public void sendEmail(String email, String authNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
