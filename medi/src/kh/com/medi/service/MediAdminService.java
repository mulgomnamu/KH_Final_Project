package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediMyListPagingDto;

public interface MediAdminService {
	
	public List<MediMyListPagingDto> getMemberList(MediMyListPagingDto dto_m);

}
