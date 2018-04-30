package kh.com.medi.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.model.MediMyPageDto;
import kh.com.medi.service.MediAdminService;

@Controller
public class MediAdminController {

	private static final Logger logger = LoggerFactory.getLogger(MediDoctorController.class);
	
	@Autowired
	private MediAdminService mediAdminService;
	
	@RequestMapping(value="adminMemberList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String adminMemberList(Model model, MediMyListPagingDto dto_m) {
		logger.info("MediAdminController adminMemberList " + new Date());
		
		// paging처리
		int sn = dto_m.getPageNumber();
		int start = (sn) * dto_m.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto_m.getRecordCountPerPage();
		
		dto_m.setStart(start);
		dto_m.setEnd(end);
		
		int totalRecordCount = mediAdminService.getMemberPagingListCount(dto_m);
		List<MediMyListPagingDto> loginList = mediAdminService.getMemberPagingList(dto_m);
		
		model.addAttribute("loginList", loginList);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto_m.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("s_category", dto_m.getS_category());
		model.addAttribute("s_keyword", dto_m.getS_keyword());
		
		return "adminMemberList.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="addYellowCard.do", method={RequestMethod.GET, RequestMethod.POST})
	public int addYellowCard(MediMyListPagingDto dto_m) {
		logger.info("MediAdminController addYellowCard " + new Date());
		
		mediAdminService.addYellowCard(dto_m);

		// 갱신된 blacklist return
		return mediAdminService.getMemberListatSeq(dto_m).getBlacklist();
	}
	
	@ResponseBody
	@RequestMapping(value="delYellowCard.do", method={RequestMethod.GET, RequestMethod.POST})
	public int delYellowCard(MediMyListPagingDto dto_m) {
		logger.info("MediAdminController delYellowCard " + new Date());
		
		mediAdminService.delYellowCard(dto_m);
		
		// 갱신된 blacklist return
		return mediAdminService.getMemberListatSeq(dto_m).getBlacklist();
	}
	
	@ResponseBody
	@RequestMapping(value="updateMemberByAdmin.do", method={RequestMethod.GET, RequestMethod.POST})
	public MediMyListPagingDto updateMemberByAdmin(MediMyListPagingDto dto_m) {
		logger.info("MediAdminController updateMemberByAdmin " + new Date());
		
		if(mediAdminService.updateMemberByAdmin(dto_m)) {
			return mediAdminService.getMemberListatSeq(dto_m);
		}else {
			return null;
		}
	}
	
	
}
