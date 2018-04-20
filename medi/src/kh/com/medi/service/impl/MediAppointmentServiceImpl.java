package kh.com.medi.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.aop.CalendarUtil;
import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.model.MediAppointmentDto;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;
import kh.com.medi.service.MediAppointmentService;


@Service
public class MediAppointmentServiceImpl implements MediAppointmentService {
	@Autowired
	MediAppointmentDao mediAppointmentDao;

	@Override
	public List<MediMember_hDto> getserchhospitalList(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.getserchhospitalList(alldto);
	}

	@Override
	public List<MediDoctorDto> getdoclist(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.getdoclist(alldto);
	}

	@Override
	public List<MediDoctorSchedulDto> getdocscedulelist(MediAppointmentNeedDto alldto) throws Exception {
		List<MediDoctorSchedulDto> docscedulelist=mediAppointmentDao.getdocscedulelist(alldto); 
		List<MediDoctorSchedulDto> reallist=new ArrayList<>();
		MediDoctorSchedulDto scedto=new MediDoctorSchedulDto();
		for (int i = 0; i < docscedulelist.size(); i++) {
			scedto=docscedulelist.get(i);
			
			String shour=scedto.getStart_time().substring(0, 2);
			String smin=scedto.getStart_time().substring(3, 5);
			String ehour=scedto.getEnd_time().substring(0, 2);
			String emin=scedto.getEnd_time().substring(3, 5);
			String lhour=scedto.getLunch_time().substring(0, 2);
			String lmin=scedto.getLunch_time().substring(3, 5);
			
			int start=Integer.parseInt(shour+smin);
			int end=Integer.parseInt(ehour+emin);
			int lun=Integer.parseInt(lhour+lmin);
			String canhour="";
			for (int j = start; j <= end; j=j+30) {
				String ii=j+"";
				if (ii.length()==3) {
					if(Integer.parseInt(ii.substring(1, 3))==60) {
						j=j+40;
					}
				}else if(ii.length()==4) {
					if(Integer.parseInt(ii.substring(2, 4))==60) {
					j=j+40;
					}
				}
				if(j==lun||j==lun+30||j==lun+100) {
					
				}
				else {
					if (ii.length()==3) {
						String iiii=(j+"").length()>3?(j+""):"0"+j;
						canhour=canhour+iiii+"-";
					}
					else {
						canhour=canhour+j+"-";
					}
					
				}
			}
			scedto.setStart_time(canhour);
			reallist.add(scedto);
		}
		return reallist;
	}

	@Override
	public MediMember_hDto gethospitaldetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.gethospitaldetail(alldto);
	}

	@Override
	public MediDoctorDto getdocdetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.getdocdetail(alldto);
	}

	@Override
	public boolean reserve(MediAppointmentNeedDto alldto) throws Exception {
		boolean canreserve=mediAppointmentDao.confirmreserve(alldto);
		boolean returnb;
		if (canreserve) {	//저장가능
			System.out.println(alldto.toString());
			returnb=mediAppointmentDao.reserve(alldto);
		}else {
			//예약이이미되서안되는시간빼줘야된다 
			//medi_schedul테이블을 업데이트해줘야된다 
			//doc_seq와day로 where절만들고 canttime - 로구분해서넣어준다
			//
			alldto.setTime(alldto.getTime().substring(0, 4));
			returnb=false;
		}
		return returnb;
	}

	@Override
	public String canttime(MediAppointmentNeedDto alldto) throws Exception {
		List<MediAppointmentDto> canttimeslist=mediAppointmentDao.canttime(alldto);
		MediDoctorSchedulDto scedto=mediAppointmentDao.getdocsceduledetail(alldto); 
			
			String shour=scedto.getStart_time().substring(0, 2);
			String smin=scedto.getStart_time().substring(3, 5);
			String ehour=scedto.getEnd_time().substring(0, 2);
			String emin=scedto.getEnd_time().substring(3, 5);
			String lhour=scedto.getLunch_time().substring(0, 2);
			String lmin=scedto.getLunch_time().substring(3, 5);
			
			int start=Integer.parseInt(shour+smin);
			int end=Integer.parseInt(ehour+emin);
			int lun=Integer.parseInt(lhour+lmin);
			String canhour="";
			for (int j = start; j <= end; j=j+30) {
				String ii=j+"";
				if (ii.length()==3) {
					if(Integer.parseInt(ii.substring(1, 3))==60) {
						j=j+40;
					}
				}else if(ii.length()==4) {
					if(Integer.parseInt(ii.substring(2, 4))==60) {
					j=j+40;
					}
				}
				if(j==lun||j==lun+30||j==lun+100) {
					
				}
				else {
					if (ii.length()==3) {
						String iiii=(j+"").length()>3?(j+""):"0"+j;
						canhour=canhour+iiii+"-";
					}
					else {
						canhour=canhour+j+"-";
					}
					
				}
			}
			String can[]=canhour.split("-");
			List<String> canhours=new ArrayList<>();
			for (int c = 0; c < can.length; c++) {
				canhours.add(can[c]);
			}
			String _canttime="";
			for (int j = 0; j < canttimeslist.size(); j++) {
				String canttime=canttimeslist.get(j).getTime().substring(0, 2)+canttimeslist.get(j).getTime().substring(3, 5);
				_canttime=_canttime+canttime+"-";
			}
			String split[]=_canttime.split("-");
			List<String> canttime=new ArrayList<>();
			for (int c = 0; c < split.length; c++) {
				canttime.add(split[c]);
			}
			System.out.println("의사가능한시간"+canhour);
			System.out.println("의사불가능한시간"+_canttime);
			for (int k = 0; k < canhours.size(); k++) {
				for (int z = 0; z < canttime.size(); z++) {
					if (canhours.get(k).equals(canttime.get(z))) {
						canhours.remove(k);
						canhours.add(k,"");
					}
				}
			}
			
			canhours.removeAll(Collections.singleton(null));
			
			String _canhour="";
			for (int i = 0; i < canhours.size(); i++) {
				if (canhours.get(i).equals("")) {
					
				}
				else {
					_canhour=_canhour+canhours.get(i)+"-";
				}
			}
			System.out.println(_canhour);
			scedto.setStart_time(_canhour);
		return scedto.getStart_time();
	}

	@Override
	public List<MediSpecialtyDto> byspecialty(MediSpecialtyDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.byspecialty(alldto);
	}

	@Override
	public List<MediDoctorDto> doclist(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.doclist(alldto);
	}

	@Override
	public MediAppointmentDto reservedetail(MediAppointmentNeedDto alldto) throws Exception {
		Calendar cal=Calendar.getInstance();
		MediAppointmentDto reservedto=mediAppointmentDao.reservedetail(alldto);
		String _year=reservedto.getDay().substring(0, 4);
		String _month=reservedto.getDay().substring(5, 7);
		String _date=reservedto.getDay().substring(8, 10);
		int year=Integer.parseInt(_year);
		int month=Integer.parseInt(_month);
		int date=Integer.parseInt(_date);
		cal.set(year, month-1, date);
		String day="";
		switch(cal.get(Calendar.DAY_OF_WEEK)){
        case 1:
            day = "일";
            break ;
        case 2:
            day = "월";
            break ;
        case 3:
            day = "화";
            break ;
        case 4:
            day = "수";
            break ;
        case 5:
            day = "목";
            break ;
        case 6:
            day = "금";
            break ;
        case 7:
            day = "토";
            break ;
             
    }
		String time=reservedto.getTime();
		reservedto.setTime(time.substring(0, 5));
		reservedto.setWdate(day);
		return reservedto;
	}

	@Override
	public boolean resevecancel(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.resevecancel(alldto);
	}
	
	
	
	

}
