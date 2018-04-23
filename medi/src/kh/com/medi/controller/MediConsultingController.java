package kh.com.medi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.com.medi.aop.myCal;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediMember_hDto;
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
		logger.info("MediConsultingController consultinglist " + new Date());
		// paging처리
		int sn = alldto.getPageNumber();
		int start = (sn) * alldto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * alldto.getRecordCountPerPage();
		
		alldto.setStart(start);
		alldto.setEnd(end);
		
		int totalRecordCount = mediConsultingService.getBbsCount(alldto);
		List<MediConsultingQuestionDto> questionlist = mediConsultingService.getBbsPagingList(alldto);
		model.addAttribute("questionlist", questionlist);
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", alldto.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("s_category", alldto.getS_category());
		model.addAttribute("s_keyword", alldto.getS_keyword());
				
		return "consultinglist.tiles";
	}
	@RequestMapping(value="consultingwrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsWrite(Model model, MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController consultingwrite " + new Date());
		return "consultingwrite.tiles";
	}
	@RequestMapping(value="consultingwriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsWriteAf(Model model, MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController consultingwriteAf " + new Date());
		
		boolean isS = mediConsultingService.insertBbs(alldto);
		
		if(isS) {
			return "redirect:/consultinglist.do";
		}else {
			model.addAttribute("msg", "글쓰기 실패");
			return "consultingwrite.tiles";
		}
		
	}
	
	@RequestMapping(value="consultingupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsUpdate(Model model, MediConsultingAllDto dto) throws Exception{
		logger.info("MediConsultingController consultingupdate " + new Date());
		
		model.addAttribute("bbs", dto);
		return "consultingupdate.tiles";
	}
	
	@RequestMapping(value="consultingupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsUpdateAf(Model model, MediConsultingAllDto dto) throws Exception{
		logger.info("MediConsultingController consultingupdateAf " + new Date());
		
		boolean flag = mediConsultingService.updateBbs(dto);
		
		if(flag) {
			return "redirect:/consultinglist.do";
		}else {
			model.addAttribute("msg", "글수정 실패");
			return "redirect:/consultingupdate.do";
		}
		
	}
	
	@RequestMapping(value="consultingdelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnabbsDelete(Model model, MediConsultingAllDto dto) throws Exception{
		logger.info("MediConsultingController consultingdelete " + new Date());
		boolean flag = mediConsultingService.deleteBbs(dto);
		
		if(flag) {
			return "redirect:/consultinglist.do";
		}else {
			model.addAttribute("msg", "글삭제 실패");
			return "redirect:/consultingupdate.do";
		}
	}
	@RequestMapping(value="answerwrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String answerwrite(Model model, MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController answerwrite " + new Date());
		MediMember_hDto hdto=mediConsultingService.get();
		
		model.addAttribute("parent", alldto.getSeq());
		model.addAttribute("hdto", hdto);
		return "answerwrite.tiles";
	}
	@RequestMapping(value="answerwriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String answerwriteAf(Model model, MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController answerwriteAf " + new Date());
		boolean isS = mediConsultingService.answerinsert(alldto);
		if(isS) {
			alldto.setSeq(alldto.getParent());
			return "redirect:/consultingdetail.do?seq="+alldto.getSeq();
		}else {
			model.addAttribute("msg", "글쓰기 실패");
			return "answerwrite.tiles";
		}
		
	}
	@RequestMapping(value="consultingdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Qnabbsdetail(Model model, MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController consultingdetail " + new Date());
		System.out.println(alldto.toString());
		MediConsultingQuestionDto dto=mediConsultingService.getBbsDetail(alldto);	//질문의 seq로 그디테일뿌려주고
		List<MediConsultingAnswerDto> answerlist=mediConsultingService.answerlist(alldto);//질문의seq로 parent검색해서뿌려주는리스트
		model.addAttribute("answerlist", answerlist);
		model.addAttribute("bbs", dto);
		return "consultingdetail.tiles";
	}
	//채택해주기
	@ResponseBody
	@RequestMapping(value="saveselected.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> serchhospital(MediConsultingAllDto alldto,Model model) throws Exception{
		logger.info("MediConsultingController saveselected " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		MediConsultingAnswerDto ansdto=mediConsultingService.answerdetail(alldto);
		boolean isS=mediConsultingService.selectyn(ansdto);
		boolean isS1=mediConsultingService.selected(ansdto);
		String yn="";
		if (isS) {
			yn="yes";
		}else {
			yn="no";
		}
		if (isS1) {
			yn="yesyes";
		}else {
			yn="no";
		}
		map.put("yn",yn);
		return map;
	}
}
