package kh.com.medi.service;

import java.util.HashMap;
import java.util.List;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;


public interface MediMyPageService {

public MediMemberDto Mydetail(MediMemberDto my) throws Exception;
	
	public boolean myUpate(HashMap<String, Object> mep) throws Exception;
	
	public boolean mydelete(HashMap<String, Object> mep)throws Exception;

	public MediMemberDto myup(MediMemberDto my) throws Exception;
	
	public boolean mypwdupdate(HashMap<String, Object> mep) throws Exception;
	
	public int getBbsCount(MediMyListPagingDto mylist) throws Exception;
	
	public List<MediMemberDto> getBbsPagingList(MediMyListPagingDto mylist) throws Exception;
}
