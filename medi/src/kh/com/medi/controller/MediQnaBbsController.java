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
import org.springframework.web.bind.annotation.RequestParam;

import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;
import kh.com.medi.service.MediHbbsService;
import kh.com.medi.service.MediQnaBbsService;

@Controller
public class MediQnaBbsController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediQnaBbsController.class);

	@Autowired
	private MediQnaBbsService mediQnaBbsService;
	
	@RequestMapping(value="QnAbblist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnAbblist(Model model, MediQnaBbsParamDto dto) throws Exception{
		logger.info("MediQnaBbsController QnAbblist " + new Date());
		
		// paging처리
		int sn = dto.getPageNumber();
		int start = (sn) * dto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto.getRecordCountPerPage();
		
		dto.setStart(start);
		dto.setEnd(end);
		
		int totalRecordCount = mediQnaBbsService.getBbsCount(dto);
		List<MediQnaBbsDto> hbbslist = mediQnaBbsService.getBbsPagingList(dto);
		System.out.println("MediQnaBbsController QnAbblist hbbslist :" + hbbslist.toString());
		model.addAttribute("hbbslist", hbbslist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", dto.getS_category());
		model.addAttribute("s_keyword", dto.getS_keyword());
				
		return "QnAbblist.tiles";
	}
	
	
	@RequestMapping(value="Qnabbsdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Qnabbsdetail(Model model, MediQnaBbsDto dto, @RequestParam String seq) throws Exception{
		logger.info("MediQnaBbsController Qnabbsdetail " + new Date());
		// paging처리
		System.out.println("1");
		dto.setSeq(Integer.parseInt(seq));
		System.out.println("2" + dto.getSeq());
		dto = mediQnaBbsService.getBbsDetail(dto);
		System.out.println("3 " + dto.toString());
		model.addAttribute("bbs", dto);
		System.out.println("4");
		return "Qnabbsdetail.tiles";
	}
	
		
	@RequestMapping(value="QnabbsWrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsWrite(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsWrite " + new Date());
		
		return "QnabbsWrite.tiles";
	}
	
	@RequestMapping(value="QnabbsWriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsWriteAf(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsWriteAf " + new Date());
		
		boolean flag = mediQnaBbsService.insertBbs(dto);
		
		if(flag) {
			return "redirect:/QnAbblist.do";
		}else {
			model.addAttribute("msg", "글쓰기 실패");
			return "QnabbsWrite.tiles";
		}
		
	}
	
	@RequestMapping(value="QnabbsUpdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsUpdate(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsUpdate " + new Date());
		
		model.addAttribute("bbs", dto);
		return "QnabbsUpdate.tiles";
	}
	
	@RequestMapping(value="QnabbsUpdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsUpdateAf(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsUpdateAf " + new Date());
		
		boolean flag = mediQnaBbsService.updateBbs(dto);
		
		if(flag) {
			return "redirect:/QnAbblist.do";
		}else {
			model.addAttribute("msg", "글수정 실패");
			return "redirect:/QnabbsUpdate.do";
		}
		
	}
	
	@RequestMapping(value="QnabbsDelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsDelete(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsDelete " + new Date());
		
		mediQnaBbsService.deleteBbs(dto);
		return "redirect:/QnAbblist.do";
	
	}
	
	@RequestMapping(value="Qnabbsreply.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Qnabbsreply(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController Qnabbsreply " + new Date());
		System.out.println("MediQnaBbsController Qnabbsreply dto :" + dto.toString());
		model.addAttribute("bbs", dto);
		return "Qnabbsreply.tiles";
	
	}
	
	@RequestMapping(value="QnabbsreplyAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsreplyAf(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsreplyAf " + new Date());
		System.out.println("MediQnaBbsController QnabbsreplyAf dto :" + dto.toString());

		mediQnaBbsService.answerInsert(dto);
		return "redirect:/QnAbblist.do";
	
	}
	
	
}







