package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.service.MediDoctorService;

@Controller
public class MediDoctorController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMember_hController.class);
	
	@Autowired
	MediDoctorService mediDoctorService;
	
	@RequestMapping(value="join_d.do", method={RequestMethod.GET, RequestMethod.POST})
	public String join_d() {
		logger.info("MediMember_hController join_d " + new Date());
		
		return "join_d.tiles";
	}

}
