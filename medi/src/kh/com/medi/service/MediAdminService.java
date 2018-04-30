package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;

public interface MediAdminService {
	
	public List<MediMyListPagingDto> getMemberList();
	public int getMemberPagingListCount(MediMyListPagingDto dto_m);
	public List<MediMyListPagingDto> getMemberPagingList(MediMyListPagingDto dto_m);
	public MediMyListPagingDto getMemberListatSeq(MediMyListPagingDto dto_m);
	public boolean addYellowCard(MediMyListPagingDto dto_m);
	public boolean delYellowCard(MediMyListPagingDto dto_m);
	public boolean updateMemberByAdmin(MediMyListPagingDto dto_m);

}
