package kh.com.medi.service;

import java.util.List;

import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediMember_hDto;

public interface MediAppointmentService {
	//예약창에서 병원검색할때
	public List<MediMember_hDto> getserchhospitalList(MediAppointmentNeedDto alldto)throws Exception;
	//병원디테일
	public MediMember_hDto gethospitaldetail(MediAppointmentNeedDto alldto)throws Exception;
	//예약창 병원 seq로 의사선생님 리스트뽑기
	public List<MediDoctorDto> getdoclist(MediAppointmentNeedDto alldto)throws Exception;
	//의사디테일
	public MediDoctorDto getdocdetail(MediAppointmentNeedDto alldto)throws Exception;
	//예약창 의사 seq로 스케줄 리스트뽑기
	public List<MediDoctorSchedulDto> getdocscedulelist(MediAppointmentNeedDto alldto)throws Exception;
	//예약하기
	public boolean reserve(MediAppointmentNeedDto alldto)throws Exception;
}
