package kh.com.medi.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.aop.CalendarUtil;
import kh.com.medi.dao.MediAppointmentDao;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediAppointmentService;


@Service
public class MediAppointmentServiceImpl implements MediAppointmentService {
	@Autowired
	MediAppointmentDao mediAppointmentDao;

	@Override
	public List<MediMember_hDto> gethospitalList(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediAppointmentDao.gethospitalList(alldto);
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
						i=i+40;
					}
				}else if(Integer.parseInt(ii.substring(2, 4))==60) {
					j=j+40;
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
	
	
	
	

}
