package kh.com.medi.service;

import java.util.HashMap;

import kh.com.medi.model.MediMemberDto;


public interface MediMyPageService {

public MediMemberDto Mydetail(MediMemberDto my) throws Exception;
	
	public boolean myUpate(HashMap<String, Object> mep) throws Exception;
	
	public boolean mydelete(HashMap<String, Object> mep)throws Exception;

	public MediMemberDto myup(MediMemberDto my) throws Exception;
	
	public boolean mypwdupdate(HashMap<String, Object> mep) throws Exception;
	
}
