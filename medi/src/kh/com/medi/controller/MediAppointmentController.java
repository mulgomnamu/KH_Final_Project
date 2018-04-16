package kh.com.medi.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.medi.aop.CalendarUtil;
import kh.com.medi.aop.myCal;
import kh.com.medi.model.CalendarDto;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediAppointmentService;
import kh.com.medi.service.MediMemberService;

@Controller
public class MediAppointmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAppointmentController.class);
	
	@Autowired
	private MediAppointmentService mediAppointmentService;
	
	
	@RequestMapping(value="appointment.do", method={RequestMethod.GET, RequestMethod.POST})
	public String changeplz(myCal jcal,Model model) throws Exception{
		logger.info("MediAppointmentController appointment " + new Date());
		jcal.calculate();
		model.addAttribute("jcal", jcal);
		return "appointment.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="serchhospital.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> serchhospital(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController serchhospital " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		List<MediMember_hDto> hospitallist=mediAppointmentService.getserchhospitalList(alldto);
		
		String yn="";
		if (hospitallist.size()==0||hospitallist==null) {
			yn="no";
		}else {
			yn="yes";
		}
		map.put("hospitallist",hospitallist);
		map.put("yn",yn);
		return map;
	}		
	@ResponseBody
	@RequestMapping(value="getdoctor.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getdoclist(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController getdoclist " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		
		MediMember_hDto selecthos=mediAppointmentService.gethospitaldetail(alldto);
		List<MediDoctorDto> getdoclist=mediAppointmentService.getdoclist(alldto);
		map.put("getdoclist",getdoclist);
		map.put("name",selecthos.getName());
		map.put("tel",selecthos.getTel());	//메인사진은나중다른dto에서받아와야한다
		return map;
	}
	@ResponseBody
	@RequestMapping(value="getscadule.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getscadule(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController getscadule " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		myCal jcal=new myCal();
		jcal.calculate();
		int dayOfWeek = jcal.getDayOfWeek();
		int lastDayOfMonth = jcal.getLastDay();
		int year = jcal.getYear();
		int month =jcal.getMonth();
		Calendar cal = Calendar.getInstance();
		int today=cal.get(Calendar.DATE);
		int nowmon=cal.get(Calendar.MONTH)+1;
		cal.set(year, month-1, 1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<MediDoctorSchedulDto> canlist=mediAppointmentService.getdocscedulelist(alldto);
		MediDoctorDto selectdoc=mediAppointmentService.getdocdetail(alldto);
		String months=CalendarUtil.two(jcal.getMonth());
		for (int i = 0; i < canlist.size(); i++) {
		System.out.println(canlist.get(i).toString());	
		}
		
		map.put("dayOfWeek",dayOfWeek);
		map.put("lastDayOfMonth",lastDayOfMonth);
		map.put("year",year);
		map.put("month",months);
		map.put("today",today);
		map.put("nowmon",nowmon);
		map.put("lastDay",lastDay);
		map.put("canlist",canlist);
		map.put("name",selectdoc.getName());
		map.put("specialty",selectdoc.getSpecialty());
		map.put("doc_profile",selectdoc.getDoc_profile());
		return map;
	}
	@ResponseBody
	@RequestMapping(value="monnext.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> monnext(MediAppointmentNeedDto alldto,myCal chcal,Model model) throws Exception{
		logger.info("MediAppointmentControll monnext " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		chcal.calculate();
		int dayOfWeek = chcal.getDayOfWeek();
		int lastDayOfMonth = chcal.getLastDay();
		int year = chcal.getYear();
		int month =chcal.getMonth()+1;
		Calendar cal = Calendar.getInstance();
		int today=cal.get(Calendar.DATE);
		int nowmon=cal.get(Calendar.MONTH)+1;
		cal.set(year, month-1, 1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<MediDoctorSchedulDto> canlist=mediAppointmentService.getdocscedulelist(alldto);
		MediDoctorDto selectdoc=mediAppointmentService.getdocdetail(alldto);
		String months=CalendarUtil.two(chcal.getMonth());
		map.put("dayOfWeek",dayOfWeek);
		map.put("lastDayOfMonth",lastDayOfMonth);
		map.put("year",year);
		map.put("month",months);
		map.put("nowmon",nowmon);
		map.put("today",today);
		map.put("lastDay",lastDay);
		map.put("canlist",canlist);
		map.put("name",selectdoc.getName());
		map.put("specialty",selectdoc.getSpecialty());
		map.put("doc_profile",selectdoc.getDoc_profile());
		return map;
	}	
	@ResponseBody		
	@RequestMapping(value="reserve.do", method= {RequestMethod.POST,RequestMethod.GET})
	public MediAppointmentNeedDto checkreserve(MediAppointmentNeedDto alldto,HttpServletRequest req,Model model)throws Exception {
		logger.info("MediAppointmentController checkreserve" + new Date());
		int count=0; 
		MediAppointmentNeedDto yes=new MediAppointmentNeedDto();
		
		String _day=alldto.getDay().substring(0, 8);
		String _time=alldto.getDay().substring(8, 12)+"00";
		alldto.setDay(_day);
		alldto.setTime(_time);
	
		//여기서해야될일
		//예약테이블에추가해주면된다 - mem_seq, doc_seq, type, content, day,time 으로넘어올것이다
		//테이블에추가하기전에 검색쿼리먼저돌리고 그게있으면 RESERVENO라고찍어줘야한다
		//mem_seq취득 
		int seq=((MediMemberDto)req.getSession().getAttribute("login")).getSeq();
		alldto.setMem_seq(seq);
		//hos_seq취득
		MediDoctorDto docdto=mediAppointmentService.getdocdetail(alldto);
		alldto.setHos_seq(docdto.getHos_seq());
		System.out.println(alldto.toString());
		
		boolean canreserve=mediAppointmentService.reserve(alldto);
		if (canreserve) {	//저장가능
			yes.setMessage("예약했습니다");
		}else {
			yes.setMessage("예약못했습니다");
		}
		return yes;
	}
}
