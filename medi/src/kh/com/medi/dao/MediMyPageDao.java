package kh.com.medi.dao;

import java.util.HashMap;

import kh.com.medi.model.MediMyPageDto;

public interface MediMyPageDao {
	
	MediMyPageDto Mydetail(MediMyPageDto my) throws Exception;

	boolean myUpate(HashMap<String, Object> mep) throws Exception;

	void mydelete(MediMyPageDto my) throws Exception;

}
