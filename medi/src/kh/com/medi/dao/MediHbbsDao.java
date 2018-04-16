package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediMember_hDto;

public interface MediHbbsDao {

	int getBbsCount(MediHbbsParamDto hbbs) throws Exception;
	List<MediMember_hDto> getBbsPagingList(MediHbbsParamDto hbbs) throws Exception;
	MediMember_hDto getBbsDetail(int seq) throws Exception;
}
