package kh.com.medi.dao;

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctor_specialtyDto;

public interface MediDoctorDao {
	
	boolean addDoctor(MediDoctorDto dto_d);
	boolean addSpecialty(MediDoctor_specialtyDto dto_ds);

}
