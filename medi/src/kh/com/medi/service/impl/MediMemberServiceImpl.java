package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediMemberDao;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.service.MediMemberService;

@Service
public class MediMemberServiceImpl implements MediMemberService {
	
	@Autowired
	private MediMemberDao mediMemberDao;

	@Override
	public List<MediMemberDto> test() throws Exception {
		return mediMemberDao.test();
	}

	@Override
	public MediMemberDto idCheck(String id) throws Exception {
		// TODO Auto-generated method stub
		return  mediMemberDao.idCheck(id);
	}

	@Override
	public boolean insertMember(MediMemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMemberDao.insertMember(dto);
	}

	@Override
	public MediMemberDto loginAf(MediMemberDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMemberDao.loginAf(dto);
	}

}
