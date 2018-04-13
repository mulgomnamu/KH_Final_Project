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
		String months=CalendarUtil.two(jcal.getMonth());
		map.put("dayOfWeek",dayOfWeek);
		map.put("lastDayOfMonth",lastDayOfMonth);
		map.put("year",year);
		map.put("month",months);
		map.put("lastDay",lastDay);
		map.put("canlist",canlist);
		System.out.println(canlist.toString());
		return map;
	}	
	@ResponseBody		
	@RequestMapping(value="reserve.do", method= {RequestMethod.POST,RequestMethod.GET})
	public MediAppointmentNeedDto checkreserve(MediAppointmentNeedDto alldto,HttpServletRequest req,Model model)throws Exception {
		logger.info("MediAppointmentController checkreserve" + new Date());
		int count=0; 
		MediAppointmentNeedDto yes=new MediAppointmentNeedDto();
		//여기서해야될일
		//예약테이블에추가해주면된다 - mem_seq, doc_seq, type, content, day,time 으로넘어올것이다
		//테이블에추가하기전에 검색쿼리먼저돌리고 그게있으면 RESERVENO라고찍어줘야한다
		//seq취득 
		/*int seq=((MediMemberDto)req.getSession().getAttribute("login")).get;*/
		if (count>0) {
			yes.setMessage("RESERVEYES");
		}else {
			yes.setMessage("RESERVENO");
		}
		return yes;
	}
}
