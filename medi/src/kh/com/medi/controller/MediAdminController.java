package kh.com.medi.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.service.MediAdminService;

@Controller
public class MediAdminController {

	private static final Logger logger = LoggerFactory.getLogger(MediDoctorController.class);
	
	@Autowired
	private MediAdminService mediAdminService;
	
	@RequestMapping(value="adminMemberList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String adminMemberList(Model model) {
		logger.info("MediAdminController adminMemberList " + new Date());
		
		MediMyListPagingDto dto_m = null;
		
		List<MediMyListPagingDto> loginList = mediAdminService.getMemberList(dto_m);
		
		model.addAttribute("loginList", loginList);
		
		return "adminMemberList.tiles";
	}
	
}
