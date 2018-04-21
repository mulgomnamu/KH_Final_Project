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

import kh.com.medi.aop.myCal;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.service.MediAppointmentService;
import kh.com.medi.service.MediConsultingService;

@Controller
public class MediConsultingController {
	private static final Logger logger = LoggerFactory.getLogger(MediConsultingController.class);
	
	@Autowired
	private MediConsultingService mediConsultingService;
	
	@RequestMapping(value="consultinglist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String changeplz(Model model,MediConsultingAllDto alldto) throws Exception{
		logger.info("MediAppointmentController consultinglist " + new Date());
		// paging처리
		int sn = alldto.getPageNumber();
		int start = (sn) * alldto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * alldto.getRecordCountPerPage();
		
		alldto.setStart(start);
		alldto.setEnd(end);
		
		int totalRecordCount = mediConsultingService.getBbsCount(alldto);
		List<MediConsultingQuestionDto> questionlist = mediConsultingService.getBbsPagingList(alldto);
		System.out.println("MediConsultingController consultinglist questionlist :" + questionlist.toString());
		model.addAttribute("questionlist", questionlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", alldto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", alldto.getS_category());
		model.addAttribute("s_keyword", alldto.getS_keyword());
				
		return "consultinglist.tiles";
	}
}
