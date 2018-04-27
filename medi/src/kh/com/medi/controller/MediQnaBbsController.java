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
	public String QnAbblist(Model model, MediQnaBbsParamDto dto, HttpServletRequest req) throws Exception{
		logger.info("MediQnaBbsController QnAbblist " + new Date());
		
		String loginType = "";
		if((String)req.getSession().getAttribute("loginType") == null) {
			loginType = "111";
		}else {
			loginType = (String)req.getSession().getAttribute("loginType");
		}
		
		// paging처리
		int sn = dto.getPageNumber();
		int start = (sn) * dto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * dto.getRecordCountPerPage();
		
		dto.setStart(start);
		dto.setEnd(end);
		List<MediQnaBbsDto> hbbslist = null;
		System.out.println("!!!!!!!!!!!!!!!loginType : " + loginType);
		int totalRecordCount=0;
		if(loginType.equals("1")) {
			totalRecordCount = mediQnaBbsService.getBbsCount1(dto);
			hbbslist = mediQnaBbsService.getBbsPagingList1(dto);
		}else if(loginType.equals("2")){
			totalRecordCount = mediQnaBbsService.getBbsCount(dto);
		    hbbslist = mediQnaBbsService.getBbsPagingList(dto);
		}else if(loginType.equals("4")){
			totalRecordCount = mediQnaBbsService.getBbsCount4(dto);
		    hbbslist = mediQnaBbsService.getBbsPagingList4(dto);
		}else{
			totalRecordCount = mediQnaBbsService.getBbsCount(dto);
		    hbbslist = mediQnaBbsService.getBbsPagingList(dto);
		}
		
		model.addAttribute("loginType", loginType);
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
	
		dto.setSeq(Integer.parseInt(seq));
		dto = mediQnaBbsService.getBbsDetail(dto);		
		model.addAttribute("bbs", dto);

		return "Qnabbsdetail.tiles";
	}
	
	@RequestMapping(value="QnabbsdetailRock.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsdetailRock(Model model, MediQnaBbsDto dto, @RequestParam String seq) throws Exception{
		logger.info("MediQnaBbsController QnabbsdetailRock " + new Date());
		// paging처리
		model.addAttribute("bbs", dto);
		/*dto.setSeq(Integer.parseInt(seq));
		dto = mediQnaBbsService.getBbsDetail(dto);		
		model.addAttribute("bbs", dto);*/
		System.out.println("dto.getRock !!" + dto.getRock());
		System.out.println("dto.getSeq !!" + dto.getSeq());
		return "QnabbsdetailRock.tiles";
	}
	
	@RequestMapping(value="QnabbsdetailRockAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsdetailRockAf(Model model, MediQnaBbsDto dto, @RequestParam String pwd, @RequestParam String seq) throws Exception{
		logger.info("MediQnaBbsController QnabbsdetailRockAf " + new Date());
		
		System.out.println("pwd " + pwd);
		/*System.out.println("rock " + rock);*/
		System.out.println("dto.getRock !!" + dto.getRock());
		System.out.println("dto.getSeq !!" + dto.getSeq());
		if(pwd.equals(dto.getRock())) {
			dto = mediQnaBbsService.getBbsDetail(dto);		
			model.addAttribute("bbs", dto);

			return "Qnabbsdetail.tiles";
		}else {
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			
			return "redirect:/QnAbblist.do";
		}
		/*dto.setSeq(Integer.parseInt(seq));
		dto = mediQnaBbsService.getBbsDetail(dto);		
		model.addAttribute("bbs", dto);*/

		
	}
	
		
	@RequestMapping(value="QnabbsWrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsWrite(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsWrite " + new Date());
		
		return "QnabbsWrite.tiles";
	}
	
	@RequestMapping(value="QnabbsWriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsWriteAf(Model model, MediQnaBbsDto dto, @RequestParam String loginType) throws Exception{
		logger.info("MediQnaBbsController QnabbsWriteAf " + new Date());
		
		if(dto.getRock() == null) {
			dto.setRock("no");
		}
		System.out.println("loginType = " + loginType);
		boolean flag = false;
		if(loginType.equals("1")) {
			flag = mediQnaBbsService.insertBbs1(dto);
		}else {
			flag = mediQnaBbsService.insertBbs4(dto);
		}
		
		if(flag) {
			model.addAttribute("loginType", loginType);
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
			String loginType = Integer.toString(dto.getMemchoice());
			model.addAttribute("loginType", loginType);
			return "redirect:/QnAbblist.do";
		}else {
			model.addAttribute("msg", "글수정 실패");
			return "redirect:/QnabbsUpdate.do";
		}
		
	}
	
	@RequestMapping(value="QnabbsDelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsDelete(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnabbsDelete " + new Date());
		
		String loginType = Integer.toString(dto.getMemchoice());
		
		mediQnaBbsService.deleteBbs(dto);
		model.addAttribute("loginType", loginType);
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

		if(dto.getRock() == null) {
			dto.setRock("no");
		}
		
		if(dto.getMemchoice() == 1) {
			dto.setMemchoice(1);
		}else {
			dto.setMemchoice(4);
		}
		
		mediQnaBbsService.answerInsert(dto);
		
		model.addAttribute("loginType", "2");
		return "redirect:/QnAbblist.do";
	
	}
	
	@RequestMapping(value="QnAbbsSearch.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnAbbsSearch(Model model, MediQnaBbsDto dto) throws Exception{
		logger.info("MediQnaBbsController QnAbbsSearch " + new Date());
		System.out.println("MediQnaBbsController QnAbbsSearch dto :" + dto.toString());

		mediQnaBbsService.answerInsert(dto);
		return "redirect:/QnAbblist.do";
	
	}
	
	
}