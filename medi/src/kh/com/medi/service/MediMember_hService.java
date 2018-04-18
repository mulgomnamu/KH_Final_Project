package kh.com.medi.service;

import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediMember_hDto;

public interface MediMember_hService {
	
	public boolean addMember_h(MediMember_hDto dto_h);
	public boolean checkId(MediMember_hDto dto_h);
	public MediMember_hDto getHospitalColumn(String id);
	public boolean addHospitalImage(MediHospital_imageDto dto_hi);

}
