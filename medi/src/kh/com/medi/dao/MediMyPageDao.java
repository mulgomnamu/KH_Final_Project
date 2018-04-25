package kh.com.medi.dao;

import java.util.HashMap;
import java.util.List;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;


public interface MediMyPageDao {
	
	MediMemberDto Mydetail(MediMemberDto my) throws Exception;

	boolean myUpate(HashMap<String, Object> mep) throws Exception;

	MediMemberDto myup(MediMemberDto my) throws Exception;

	boolean mypwdupdate(HashMap<String, Object> mep) throws Exception;

	boolean mydelete(HashMap<String, Object> mep) throws Exception;
	
	int getBbsCount(MediMyListPagingDto mylist) throws Exception;
	
	List<MediMemberDto> getBbsPagingList(MediMyListPagingDto mylist) throws Exception;
	
	boolean checkPhone(MediMemberDto my) throws Exception;
	boolean checkEmail(MediMemberDto my) throws Exception;

}
