package kh.com.medi.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediDoctorDao;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediDoctor_specialtyDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;
import kh.com.medi.service.MediDoctorService;

@Service
public class MediDoctorServiceImpl implements MediDoctorService {
	
	@Autowired
	MediDoctorDao mediDoctorDao;

	@Override
	public boolean addDoctor(MediDoctorDto dto_d) {
		return mediDoctorDao.addDoctor(dto_d);
	}

	@Override
	public boolean addSpecialty(MediDoctor_specialtyDto dto_ds) {
		return mediDoctorDao.addSpecialty(dto_ds);
	}

	@Override
	public boolean addSchedul(MediDoctorSchedulDto dto_dsc) {
		return mediDoctorDao.addSchedul(dto_dsc);
	}

	@Override
	public boolean updateSchedul(MediDoctorSchedulDto dto_dsc) {
		return mediDoctorDao.updateSchedul(dto_dsc);
	}

	@Override
	public boolean updateDoctor(MediDoctorDto dto_d) {
		return mediDoctorDao.updateDoctor(dto_d);
	}

	@Override
	public boolean deleteDoctor(MediDoctorDto dto_d) {
		return mediDoctorDao.deleteDoctor(dto_d);
	}

	@Override
	public MediDoctorDto getDoctorcolumnBySeq(MediDoctorDto dto_d) {
		return mediDoctorDao.getDoctorcolumnBySeq(dto_d);
	}

	@Override
	public MediDoctorDto getDoctorcolumnByMaxSeq() {
		return mediDoctorDao.getDoctorcolumnByMaxSeq();
	}

	@Override
	public List<MediDoctorDto> getDoctorColumnByHos_seq(MediMember_hDto dto_h) {
		return mediDoctorDao.getDoctorColumnByHos_seq(dto_h);
	}

	@Override
	public List<MediSpecialtyDto> getHospitalSpecialtyColumns(MediDoctorDto dto_d) {
		return mediDoctorDao.getHospitalSpecialtyColumns(dto_d);
	}

	@Override
	public List<MediDoctorSchedulDto> getHospitalSchedulColumns(MediDoctorDto dto_d) {
		return mediDoctorDao.getHospitalSchedulColumns(dto_d);
	}

	@Override
	public boolean delHospitalSpecialtyColumns(MediDoctorDto dto_d) {
		return mediDoctorDao.delHospitalSpecialtyColumns(dto_d);
	}

	@Override
	public boolean delHospitalSchedulColumns(MediDoctorDto dto_d) {
		return mediDoctorDao.delHospitalSchedulColumns(dto_d);
	}

}
