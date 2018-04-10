package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediMemberDto;

public interface MediMemberDao {
	
	
	public List<MediMemberDto> test() throws Exception;
	public MediMemberDto idCheck(String id) throws Exception;

}
