package kh.com.medi.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.model.MediMyListPagingDto;

@Controller
public class MediAdminHospitalController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAdminHospitalController.class);
	
	@RequestMapping(value="adminHospitalList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String adminHospitalList() {
		logger.info("MediAdminController adminHospitalList " + new Date());
		
		return "adminHospitalList.tiles";
	}

}
