package kh.com.medi.dao;

import java.util.HashMap;

import kh.com.medi.model.MediMemberDto;


public interface MediMyPageDao {
	
	MediMemberDto Mydetail(MediMemberDto my) throws Exception;

	boolean myUpate(HashMap<String, Object> mep) throws Exception;

	MediMemberDto myup(MediMemberDto my) throws Exception;

	boolean mypwdupdate(HashMap<String, Object> mep) throws Exception;

	boolean mydelete(HashMap<String, Object> mep) throws Exception;

}
