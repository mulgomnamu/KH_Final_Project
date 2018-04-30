package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;

public interface MediAdminDao {
	
	List<MediMyListPagingDto> getMemberList();
	int getMemberPagingListCount(MediMyListPagingDto dto_m);
	List<MediMyListPagingDto> getMemberPagingList(MediMyListPagingDto dto_m);
	MediMyListPagingDto getMemberListatSeq(MediMyListPagingDto dto_m);
	boolean addYellowCard(MediMyListPagingDto dto_m);
	boolean delYellowCard(MediMyListPagingDto dto_m);
	boolean updateMemberByAdmin(MediMyListPagingDto dto_m);

}
