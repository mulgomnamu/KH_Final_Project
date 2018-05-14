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
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.medi.model.MediAdminReservationDto;
import kh.com.medi.service.MediAdminReservationService;

@Controller
public class MediAdminReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAdminReservationController.class);
	
	@Autowired
	private MediAdminReservationService mediAdminReservationService;
	
	@RequestMapping(value="adminReservationList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String adminReservationList(Model model, MediAdminReservationDto dto_r) {
		logger.info("MediAdminReservationController adminReservationList " + new Date());

		// paging처리
		int sn = dto_r.getPageNumber();
		int start = (sn) * dto_r.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto_r.getRecordCountPerPage();
		
		dto_r.setStart(start);
		dto_r.setEnd(end);
		
		int totalRecordCount = mediAdminReservationService.getAdminReservationListCount(dto_r);
		List<MediAdminReservationDto> loginList = mediAdminReservationService.getAdminReservationList(dto_r);
		
		System.out.println(loginList);
		
		model.addAttribute("loginList", loginList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto_r.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", dto_r.getS_category());
		model.addAttribute("s_keyword", dto_r.getS_keyword());
		
		return "adminReservationList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="deleteAdminReservation.do", method={RequestMethod.GET, RequestMethod.POST})
	public String deleteAdminReservation(MediAdminReservationDto dto_r) {
		logger.info("MediAdminReservationController deleteAdminReservation " + new Date());
		
		if(mediAdminReservationService.deleteAdminReservation(dto_r)) {
			return "true";
		}else {
			return "false";
		}
	}
}
