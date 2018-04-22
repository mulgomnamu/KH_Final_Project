package kh.com.medi.service;

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediDoctor_specialtyDto;

public interface MediDoctorService {
	
	public boolean addDoctor(MediDoctorDto dto_d);
	public boolean addSpecialty(MediDoctor_specialtyDto dto_ds);
	public boolean addSchedul(MediDoctorSchedulDto dto_dsc);
	public boolean updateDoctor(MediDoctorDto dto_d);
	public boolean deleteDoctor(MediDoctorDto dto_d);

}
