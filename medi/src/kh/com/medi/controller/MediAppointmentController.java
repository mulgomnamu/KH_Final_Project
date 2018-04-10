package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.service.MediMemberService;

@Controller
public class MediAppointmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAppointmentController.class);
	
	@Autowired
	private MediAppointmentController mediAppointmentController;
	

	@RequestMapping(value="appointment.do", method={RequestMethod.GET, RequestMethod.POST})
	public String changeplz(Model model) throws Exception{
		logger.info("MediAppointmentController appointment " + new Date());
		
		return "appointment.tiles";
	}
	

}
