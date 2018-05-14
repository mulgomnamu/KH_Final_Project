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

import kh.com.medi.model.MediDoctorPagingDto;
import kh.com.medi.model.MediHospitalPagingDto;
import kh.com.medi.service.MediAdminDoctorService;

@Controller
public class MediAdminDoctorController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAdminDoctorController.class);
	
	@Autowired
	private MediAdminDoctorService mediAdminDoctorService;
	
	@RequestMapping(value="adminDoctorList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String adminDoctorList(Model model, MediDoctorPagingDto dto_d) {
		logger.info("MediAdminDoctorController adminDoctorList " + new Date());

		// paging처리
		int sn = dto_d.getPageNumber();
		int start = (sn) * dto_d.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto_d.getRecordCountPerPage();
		
		dto_d.setStart(start);
		dto_d.setEnd(end);
		
		int totalRecordCount = mediAdminDoctorService.getDoctorPagingListCount(dto_d);
		List<MediDoctorPagingDto> loginList = mediAdminDoctorService.getDoctorPagingList(dto_d);
		
		model.addAttribute("loginList", loginList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto_d.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", dto_d.getS_category());
		model.addAttribute("s_keyword", dto_d.getS_keyword());
		
		return "adminDoctorList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="updateDoctorByAdmin.do", method={RequestMethod.GET, RequestMethod.POST})
	public MediDoctorPagingDto updateDoctorByAdmin(MediDoctorPagingDto dto_d) {
		logger.info("MediAdminDoctorController updateDoctorByAdmin " + new Date());
		
		if(mediAdminDoctorService.updateDoctorByAdmin(dto_d)) {
			return mediAdminDoctorService.getDoctorListatSeq(dto_d);
		}else {
			return null;
		}
	}

}
