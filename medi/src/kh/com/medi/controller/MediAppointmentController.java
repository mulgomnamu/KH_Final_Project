package kh.com.medi.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		List<MediMember_hDto> hospitallist=mediAppointmentService.gethospitalList(alldto);
		map.put("hospitallist",hospitallist);
		
		return map;
	}		
	@ResponseBody
	@RequestMapping(value="getdoctor.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getdoclist(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController getdoclist " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		List<MediDoctorDto> getdoclist=mediAppointmentService.getdoclist(alldto);
		map.put("getdoclist",getdoclist);
		
		return map;
	}
	@ResponseBody
	@RequestMapping(value="getscadule.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getscadule(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController getscadule " + new Date());
		System.out.println(alldto.getDoc_seq());
		Map<String, Object> map=new HashMap<String, Object>();
		myCal jcal=new myCal();
		jcal.calculate();
		int dayOfWeek = jcal.getDayOfWeek();
		int lastDayOfMonth = jcal.getLastDay();
		int year = jcal.getYear();
		int month =jcal.getMonth();
		Calendar cal = Calendar.getInstance();
		cal.set(year, month-1, 1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<MediDoctorSchedulDto> canlist=mediAppointmentService.getdocscedulelist(alldto);
		System.out.println(canlist.get(0).getStart_time());
		String months=CalendarUtil.two(jcal.getMonth());
		map.put("dayOfWeek",dayOfWeek);
		map.put("lastDayOfMonth",lastDayOfMonth);
		map.put("year",year);
		map.put("month",months);
		map.put("lastDay",lastDay);
		map.put("canlist",canlist);
		return map;
	}		
}
