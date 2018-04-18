package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediHealthBookDto;

public interface MediHealthBookDao {
	
	List<MediHealthBookDto> getHealthBookList() throws Exception;
	public boolean healthBookWrite(MediHealthBookDto healthbookdto) throws Exception;

}
