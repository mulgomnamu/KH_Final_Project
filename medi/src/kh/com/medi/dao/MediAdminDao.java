package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediMyListPagingDto;

public interface MediAdminDao {
	
	List<MediMyListPagingDto> getMemberList(MediMyListPagingDto dto_m);

}
