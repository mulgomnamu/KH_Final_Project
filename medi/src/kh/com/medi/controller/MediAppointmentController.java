package kh.com.medi.controller;

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

import kh.com.medi.aop.myCal;
import kh.com.medi.model.CalendarDto;
import kh.com.medi.service.MediMemberService;

@Controller
public class MediAppointmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAppointmentController.class);
	
	@Autowired
	private MediAppointmentController mediAppointmentController;
	

	@RequestMapping(value="appointment.do", method={RequestMethod.GET, RequestMethod.POST})
	public String changeplz(myCal jcal,Model model) throws Exception{
		logger.info("MediAppointmentController appointment " + new Date());
		jcal.calculate();
		
		model.addAttribute("jcal", jcal);
		return "appointment.tiles";
	}
	//월별일정
	@RequestMapping(value="calendar2.do", 
			method={RequestMethod.GET, RequestMethod.POST})
	public String calendar2(myCal jcal, Model model)throws Exception{
		logger.info("MediAppointmentController calendar2 " + new Date());		
		
		
		return "calendar2.tiles";
	}
			

}
