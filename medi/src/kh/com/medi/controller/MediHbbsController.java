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

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediHbbsReviews;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediHbbsService;

@Controller
public class MediHbbsController {

	private static final Logger logger = LoggerFactory.getLogger(MediHbbsController.class);
	
	@Autowired
	private MediHbbsService mediHbbsService;
	
	@RequestMapping(value="hbbslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hbbslist(Model model, MediHbbsParamDto hbbs) throws Exception{
		logger.info("MediHbbsController hbbslist " + new Date());
		
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
		model.addAttribute("pageCountPerScreen", 8);
		model.addAttribute("recordCountPerPage", hbbs.getRecordCounterPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", hbbs.getS_category());
		model.addAttribute("s_keyword", hbbs.getS_keyword());
		
		return "hbbslist.tiles";
	}
	
	@RequestMapping(value="hbbsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hbbsdetail(MediHbbsParamDto hbbs, Model model)throws Exception{
		
		logger.info("KhBbsController hbbsdetail " + new Date());

		System.out.println("controller seq : " + hbbs.getSeq());

		MediMember_hDto hdto = mediHbbsService.getBbsDetail(hbbs.getSeq());
		List<MediDoctorDto> doctorlist = mediHbbsService.getDoctorDetail(hbbs.getSeq());
		
		// paging처리
		int sn = hbbs.getPageNumber();
		int start = (sn) * hbbs.getRecordCounterPage() + 1;
		int end = (sn + 1) * hbbs.getRecordCounterPage();
		
		hbbs.setStart(start);
		hbbs.setEnd(end);
		
		int totalRecordCount = mediHbbsService.getReviewsCount(hbbs);
		List<MediHbbsReviews> reviewslist = mediHbbsService.getReviews(hbbs);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", hbbs.getRecordCounterPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("hbbs", hdto);
		model.addAttribute("doctorlist", doctorlist);
		model.addAttribute("reviewslist", reviewslist);
		
		return "hbbsdetail.tiles";
		
	}
	
	@RequestMapping(value="reWrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String reWrite(Model model, MediHbbsReviews redto)throws Exception{
		
		logger.info("KhBbsController reWrite " + new Date());

		boolean b = mediHbbsService.writeReviews(redto);

		model.addAttribute("seq", redto.getHos_seq());
		
		if (b) {
			System.out.println("등록 성공");
			return "redirect:/hbbsdetail.do?seq=" + redto.getHos_seq();
		}else {
			System.out.println("등록 실패");
			return "redirect:/hbbsdetail.do";
		}
	}
	
	
}














