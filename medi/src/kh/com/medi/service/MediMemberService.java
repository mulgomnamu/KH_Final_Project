package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediMemberDto;

public interface MediMemberService {
	
	public List<MediMemberDto> test() throws Exception;
	public MediMemberDto idCheck(String id) throws Exception;

}
