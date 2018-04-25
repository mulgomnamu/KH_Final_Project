package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;

public interface MediQnabbsDao {

	List<MediQnaBbsDto> getBbsList() throws Exception;
	
	List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto param) throws Exception;
	
	List<MediQnaBbsDto> getBbsPagingList1(MediQnaBbsParamDto param) throws Exception;
	
	List<MediQnaBbsDto> getBbsPagingList4(MediQnaBbsParamDto param) throws Exception;
	
	int getBbsCount(MediQnaBbsParamDto param) throws Exception;
	
	int getBbsCount1(MediQnaBbsParamDto param) throws Exception;
	
	int getBbsCount4(MediQnaBbsParamDto param) throws Exception;
	
	public MediQnaBbsDto getBbsDetail(MediQnaBbsDto dto) throws Exception;
	
	public boolean insertBbs1(MediQnaBbsDto dto) throws Exception;
	
	public boolean insertBbs4(MediQnaBbsDto dto) throws Exception;
	
	public boolean deleteBbs(MediQnaBbsDto dto) throws Exception;
	
	public boolean updateBbs(MediQnaBbsDto dto) throws Exception;
	
	public boolean readcountBbs(MediQnaBbsDto dto) throws Exception;
	
	public boolean answerUpdate(int seq) throws Exception;
	
	public boolean answerInsert(MediQnaBbsDto dto) throws Exception;
	
}