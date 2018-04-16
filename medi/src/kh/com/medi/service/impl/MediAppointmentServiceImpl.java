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
			/*달력에서날짜를클릭하면 settime으로넘어가는데 그때 ajax로호출한다 에약한시간빼고 뿌려주는 times[i]
			 * 그럼거기에서 시간이랑 예약하기뿌려준다 넘겨주는값은 예약테이블에저근할거랑 doc스케줄테이블에접근할것들
			 * 예약테이블에저근할거: doc_seq로 day time빼온다 -> 몇월몇일몇시에예약했는지 검색가능하니까 이걸제거하면된다
			 * doc스케줄테이블: doc_seq로 시작 끝 점심시간알아와서 여기에서 예약테이블의 time을빼고 뿌려준다 
			 * 다해주면 data로보내야할거 몇월몇일몇시 리스트로, doc_seq
			 * String can[]=canhour.split("-");
			List<String> canhours=new ArrayList<>();
			for (int c = 0; c < can.length; c++) {
				canhours.add(can[c]);
			}
			String _canttime="1000-0900-";
			String split[]=_canttime.split("-");
			List<String> canttime=new ArrayList<>();
			for (int c = 0; c < split.length; c++) {
				canttime.add(split[c]);
			}
			
			for (int k = 0; k < canhours.size(); k++) {
				for (int j = 0; j < canttime.size(); j++) {
					if (canhours.get(k).equals(canttime.get(j))) {
						canhours.remove(k);
					}
				}
			}
			for (int j = 0; j < canhours.size(); j++) {
				canhour=canhours.get(j)+"-";
			}*/
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
			alldto.setTime(alldto.getTime().substring(0, 4));
			returnb=false;
		}
		return returnb;
	}
	
	
	
	

}
