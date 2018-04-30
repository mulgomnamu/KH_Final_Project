package kh.com.medi.dao;

import java.util.List;

import kh.com.medi.model.MediAppointmentDto;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;
import kh.com.medi.model.MediSubjectDto;

public interface MediAppointmentDao {
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
	//예약창 의사 seq와 요일로 스케줄 디테일
	public MediDoctorSchedulDto getdocsceduledetail(MediAppointmentNeedDto alldto)throws Exception;
	//예약하기
	public boolean reserve(MediAppointmentNeedDto alldto)throws Exception;
	//예약확인
	public boolean confirmreserve(MediAppointmentNeedDto alldto)throws Exception;
	//예약된시간뽑아오기
	public List<MediAppointmentDto> canttime(MediAppointmentNeedDto alldto)throws Exception;
	//진료과목으로검색할때
	public List<MediSubjectDto> byspecialty(MediSubjectDto alldto)throws Exception;
	//예약창에서 의사로 검색할때
	public List<MediDoctorDto> doclist(MediAppointmentNeedDto alldto)throws Exception;
	//예약디테일
	public MediAppointmentDto reservedetail(MediAppointmentNeedDto alldto)throws Exception;
	//예약취소
	public boolean resevecancel(MediAppointmentNeedDto alldto)throws Exception;	
}
