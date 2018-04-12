package kh.com.medi.service;

import java.util.HashMap;

import kh.com.medi.model.MediMyPageDto;

public interface MediMyPageService {

public MediMyPageDto Mydetail(MediMyPageDto my) throws Exception;
	
	public boolean myUpate(HashMap<String, Object> mep) throws Exception;
	
	public void mydelete(MediMyPageDto my)throws Exception;
	
}
