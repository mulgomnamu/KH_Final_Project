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

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediHospitalPagingDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.service.MediAdminHospitalService;

@Controller
public class MediAdminHospitalController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAdminHospitalController.class);
	
	@Autowired
	private MediAdminHospitalService mediAdminHospitalService;
	
	@RequestMapping(value="adminHospitalList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String adminHospitalList(Model model, MediHospitalPagingDto dto_h) {
		logger.info("MediAdminHospitalController adminHospitalList " + new Date());

		// paging처리
		int sn = dto_h.getPageNumber();
		int start = (sn) * dto_h.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto_h.getRecordCountPerPage();
		
		dto_h.setStart(start);
		dto_h.setEnd(end);
		
		int totalRecordCount = mediAdminHospitalService.getMemberPagingListCount(dto_h);
		List<MediHospitalPagingDto> loginList = mediAdminHospitalService.getMemberPagingList(dto_h);
		
		model.addAttribute("loginList", loginList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto_h.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", dto_h.getS_category());
		model.addAttribute("s_keyword", dto_h.getS_keyword());
		
		return "adminHospitalList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="updateHospitalByAdmin.do", method={RequestMethod.GET, RequestMethod.POST})
	public MediHospitalPagingDto updateHospitalByAdmin(MediHospitalPagingDto dto_h) {
		logger.info("MediAdminHospitalController updateHospitalByAdmin " + new Date());
		
		if(mediAdminHospitalService.updateMemberByAdmin(dto_h)) {
			return mediAdminHospitalService.getHospitalListatSeq(dto_h);
		}else {
			return null;
		}
	}
	
	@ResponseBody
	@RequestMapping(value="getDoctorColumnsByAdmin.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<MediDoctorDto> getDoctorColumnsByAdmin(MediMember_hDto dto_h) {
		logger.info("MediAdminHospitalController getDoctorColumnsByAdmin " + new Date());
		
		return mediAdminHospitalService.getDoctorColumnsByAdmin(dto_h);
	}

}
