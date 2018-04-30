package kh.com.medi.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.medi.dao.MediAdminDao;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;

@Repository
public class MediAdminDaoImpl implements MediAdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "MediAdmin.";

	@Override
	public List<MediMyListPagingDto> getMemberList() {
		return sqlSession.selectList(ns+"getMemberList");
	}

	@Override
	public int getMemberPagingListCount(MediMyListPagingDto dto_m) {
		return sqlSession.selectOne(ns+"getMemberPagingListCount", dto_m);
	}

	@Override
	public List<MediMyListPagingDto> getMemberPagingList(MediMyListPagingDto dto_m) {
		return sqlSession.selectList(ns+"getMemberPagingList", dto_m);
	}

	@Override
	public MediMyListPagingDto getMemberListatSeq(MediMyListPagingDto dto_m) {
		return sqlSession.selectOne(ns+"getMemberListatSeq", dto_m);
	}

	@Override
	public boolean addYellowCard(MediMyListPagingDto dto_m) {
		int n = sqlSession.update(ns+"addYellowCard", dto_m);
		return n > 0;
	}

	@Override
	public boolean delYellowCard(MediMyListPagingDto dto_m) {
		int n = sqlSession.update(ns+"delYellowCard", dto_m);
		return n > 0;
	}

	@Override
	public boolean updateMemberByAdmin(MediMyListPagingDto dto_m) {
		int n = sqlSession.update(ns+"updateMemberByAdmin", dto_m);
		return n > 0;
	}

}
