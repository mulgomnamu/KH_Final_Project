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

import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediHbbsService;

@Controller
public class MediHbbsController {

	private static final Logger logger = LoggerFactory.getLogger(MediHbbsController.class);
	
	@Autowired
	private MediHbbsService mediHbbsService;
	
	@RequestMapping(value="hbbslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hbbslist(Model model) throws Exception{
		logger.info("MediHbbsController hbbslist " + new Date());
		
		MediHbbsParamDto hbbs = new MediHbbsParamDto();
		
		System.out.println(hbbs.toString());
		hbbs.setS_category("name");
		hbbs.setS_keyword("홍길동");
		
		
		// paging처리
		int sn = hbbs.getPageNumber();
		int start = (sn) * hbbs.getRecordCounterPage() + 1;
		int end = (sn + 1) * hbbs.getRecordCounterPage();
		
		hbbs.setStart(start);
		hbbs.setEnd(end);
		
		int totalRecordCount = mediHbbsService.getBbsCount(hbbs);
		List<MediMember_hDto> hbbslist = mediHbbsService.getBbsPagingList(hbbs);
		
		model.addAttribute("hbbslist", hbbslist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", hbbs.getRecordCounterPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", hbbs.getS_category());
		model.addAttribute("s_keyword", hbbs.getS_keyword());
		
		return "hbbslist.tiles";
	}
	
}














