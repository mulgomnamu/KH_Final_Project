package kh.com.medi.dao;

import kh.com.medi.model.MediMember_hDto;

public interface MediMember_hDao {
	
	boolean addMember_h(MediMember_hDto dto_h);
	boolean checkId(MediMember_hDto dto_h);

}
