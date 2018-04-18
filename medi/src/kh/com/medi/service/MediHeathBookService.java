package kh.com.medi.service;


import java.util.List;

import kh.com.medi.model.MediHealthBookDto;

public interface MediHeathBookService {
	
	public List<MediHealthBookDto> getHealthBookList() throws Exception;
	public boolean healthBookWrite(MediHealthBookDto healthbookdto) throws Exception;

}
