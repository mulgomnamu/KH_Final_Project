package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediDoctor_specialtyDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;

public interface MediDoctorService {
	
	public boolean addDoctor(MediDoctorDto dto_d);
	public boolean addSpecialty(MediDoctor_specialtyDto dto_ds);
	public boolean addSchedul(MediDoctorSchedulDto dto_dsc);
	public boolean updateSchedul(MediDoctorSchedulDto dto_dsc);
	public boolean updateDoctor(MediDoctorDto dto_d);
	public boolean deleteDoctor(MediDoctorDto dto_d);
	public MediDoctorDto getDoctorcolumnBySeq(MediDoctorDto dto_d);
	public MediDoctorDto getDoctorcolumnByMaxSeq();
	public List<MediDoctorDto> getDoctorColumnByHos_seq(MediMember_hDto dto_h);
	public List<MediSpecialtyDto> getHospitalSpecialtyColumns(MediDoctorDto dto_d);
	public boolean delHospitalSpecialtyColumns(MediDoctorDto dto_d);
	public List<MediDoctorSchedulDto> getHospitalSchedulColumns(MediDoctorDto dto_d);
	public boolean delHospitalSchedulColumns(MediDoctorDto dto_d);

}
