package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediDoctor_specialtyDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;

public interface MediDoctorDao {
	
	boolean addDoctor(MediDoctorDto dto_d);
	boolean addSpecialty(MediDoctor_specialtyDto dto_ds);
	boolean addSchedul(MediDoctorSchedulDto dto_dsc);
	boolean updateSchedul(MediDoctorSchedulDto dto_dsc);
	boolean updateDoctor(MediDoctorDto dto_d);
	boolean deleteDoctor(MediDoctorDto dto_d);
	MediDoctorDto getDoctorcolumnBySeq(MediDoctorDto dto_d);
	MediDoctorDto getDoctorcolumnByMaxSeq();
	List<MediDoctorDto> getDoctorColumnByHos_seq(MediMember_hDto dto_h);
	List<MediSpecialtyDto> getHospitalSpecialtyColumns(MediDoctorDto dto_d);
	boolean delHospitalSpecialtyColumns(MediDoctorDto dto_d);
	List<MediDoctorSchedulDto> getHospitalSchedulColumns(MediDoctorDto dto_d);
	boolean delHospitalSchedulColumns(MediDoctorDto dto_d);

}
