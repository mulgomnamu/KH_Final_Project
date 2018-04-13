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
	public boolean insertMember(MediMemberDto dto) throws Exception {
		int n = sqlSession.insert(ns+"insertMember", dto);
		return n>0?true:false;
	}

	@Override
	public MediMemberDto loginAf(MediMemberDto dto) throws Exception {
		dto = sqlSession.selectOne(ns+"loginAfMember", dto);
		return dto;
	}
	
	@Override
	public MediMemberDto idFind(MediMemberDto dto) throws Exception {
		dto = sqlSession.selectOne(ns+"idFind", dto);
		return dto;
	}

	@Override
	public MediMemberDto getQuesAns(MediMemberDto dto) throws Exception {
		dto = sqlSession.selectOne(ns+"getQuesAns" , dto);
		return dto;
	}



}
