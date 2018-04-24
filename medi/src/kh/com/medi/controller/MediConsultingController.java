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
	public String consultinglist(Model model,MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController consultinglist " + new Date());
		// 모든글
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
		//답변처리안된글
		int sn1 = alldto.getPageNumber1();
		int start1 = (sn1) * alldto.getRecordCountPerPage1() + 1;
		int end1 = (sn1 + 1) * alldto.getRecordCountPerPage1();
		
		alldto.setStart(start1);
		alldto.setEnd(end1);
		
		int totalRecordCount1 = mediConsultingService.getqueCount(alldto);
		List<MediConsultingQuestionDto> onlyquestionlist = mediConsultingService.getquePagingList(alldto);
		model.addAttribute("onlyquestionlist", onlyquestionlist);
		model.addAttribute("pageNumber1", sn1);
		model.addAttribute("pageCountPerScreen1", 10);
		model.addAttribute("recordCountPerPage1", alldto.getRecordCountPerPage1());
		model.addAttribute("totalRecordCount1", totalRecordCount1);
		
		model.addAttribute("s_category1", alldto.getS_category1());
		model.addAttribute("s_keyword1", alldto.getS_keyword1());
		//채택완료글
		int sn2 = alldto.getPageNumber2();
		int start2 = (sn2) * alldto.getRecordCountPerPage2() + 1;
		int end2 = (sn2 + 1) * alldto.getRecordCountPerPage2();
		
		alldto.setStart(start2);
		alldto.setEnd(end2);
		
		int totalRecordCount2 = mediConsultingService.getanswerCount(alldto);
		List<MediConsultingQuestionDto> answeredlist = mediConsultingService.getansweredList(alldto);
		model.addAttribute("answeredlist", answeredlist);
		model.addAttribute("pageNumber2", sn2);
		model.addAttribute("pageCountPerScreen2", 10);
		model.addAttribute("recordCountPerPage2", alldto.getRecordCountPerPage2());
		model.addAttribute("totalRecordCount2", totalRecordCount2);
		
		model.addAttribute("s_category2", alldto.getS_category2());
		model.addAttribute("s_keyword2", alldto.getS_keyword2());
		model.addAttribute("tab", alldto.getTab());
		return "consultinglist.tiles";
	}
	@ResponseBody
	@RequestMapping(value="selectaf.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> selectaf(Model model,MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController selectaf " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		
		// 모든글
		int sn = alldto.getPageNumber();
		int start = (sn) * alldto.getRecordCountPerPage() + 1;
		int end = (sn + 1) * alldto.getRecordCountPerPage();
		
		alldto.setStart(start);
		alldto.setEnd(end);
		int totalRecordCount = mediConsultingService.getBbsCount(alldto);
		List<MediConsultingQuestionDto> questionlist = mediConsultingService.getBbsPagingList(alldto);
		int totalPageCount = totalRecordCount / alldto.getRecordCountPerPage();	// 총페이지
		//		1		=		12					10
		
		if ((totalRecordCount % alldto.getRecordCountPerPage()) != 0) {
			//	12					10	
			totalPageCount++;		// 1 -> 2
		}
		
		
		map.put("questionlist", questionlist);
		map.put("pageNumber", sn);
		map.put("pageCountPerScreen", 10);
		map.put("recordCountPerPage", alldto.getRecordCountPerPage());
		map.put("totalRecordCount", totalRecordCount);
		map.put("totalPageCount", totalPageCount);
		map.put("s_category", alldto.getS_category());
		map.put("s_keyword", alldto.getS_keyword());
		String yn="";
		if (questionlist.size()==0||questionlist==null) {
			yn="no";
		}else {
			yn="yes";
		}
		map.put("yn", yn);
		
		//답변처리안된글
		int sn1 = alldto.getPageNumber1();
		int start1 = (sn1) * alldto.getRecordCountPerPage1() + 1;
		int end1 = (sn1 + 1) * alldto.getRecordCountPerPage1();
		
		alldto.setStart(start1);
		alldto.setEnd(end1);
		
		int totalRecordCount1 = mediConsultingService.getqueCount(alldto);
		List<MediConsultingQuestionDto> onlyquestionlist = mediConsultingService.getquePagingList(alldto);
		int totalPageCount1 = totalRecordCount1 / alldto.getRecordCountPerPage1();	// 총페이지
		//		1		=		12					10
		
		if ((totalRecordCount1 % alldto.getRecordCountPerPage1()) != 0) {
			//	12					10	
			totalPageCount1++;		// 1 -> 2
		}
		
		map.put("onlyquestionlist", onlyquestionlist);
		map.put("pageNumber1", sn1);
		map.put("pageCountPerScreen1", 10);
		map.put("recordCountPerPage1", alldto.getRecordCountPerPage1());
		map.put("totalRecordCount1", totalRecordCount1);
		map.put("totalPageCount1", totalPageCount1);
		map.put("s_category1", alldto.getS_category1());
		map.put("s_keyword1", alldto.getS_keyword1());
		String yn1="";
		if (onlyquestionlist.size()==0||onlyquestionlist==null) {
			yn1="no";
		}else {
			yn1="yes";
		}
		map.put("yn1", yn1);
		
		//채택완료글
		int sn2 = alldto.getPageNumber2();
		int start2 = (sn2) * alldto.getRecordCountPerPage2() + 1;
		int end2 = (sn2 + 1) * alldto.getRecordCountPerPage2();
		
		alldto.setStart(start2);
		alldto.setEnd(end2);
		
		int totalRecordCount2 = mediConsultingService.getanswerCount(alldto);
		List<MediConsultingQuestionDto> answeredlist = mediConsultingService.getansweredList(alldto);
		int totalPageCount2 = totalRecordCount2 / alldto.getRecordCountPerPage2();	// 총페이지
		//		1		=		12					10
		
		if ((totalRecordCount2 % alldto.getRecordCountPerPage2()) != 0) {
			//	12					10	
			totalPageCount2++;		// 1 -> 2
		}
		
		map.put("answeredlist", answeredlist);
		map.put("pageNumber2", sn2);
		map.put("pageCountPerScreen2", 10);
		map.put("recordCountPerPage2", alldto.getRecordCountPerPage2());
		map.put("totalRecordCount2", totalRecordCount2);
		map.put("totalPageCount2", totalPageCount2);
		map.put("s_category2", alldto.getS_category2());
		map.put("s_keyword2", alldto.getS_keyword2());
		String yn2="";
		if (answeredlist.size()==0||answeredlist==null) {
			yn2="no";
		}else {
			yn2="yes";
		}
		map.put("yn2", yn2);
		model.addAttribute("tab", alldto.getTab());
		return map;
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
			mediConsultingService.commentcountBbs(alldto);
			return "redirect:/consultingdetail.do?seq="+alldto.getSeq();
		}else {
			model.addAttribute("msg", "글쓰기 실패");
			return "answerwrite.tiles";
		}
		
	}
	@RequestMapping(value="consultingdetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Qnabbsdetail(Model model, MediConsultingAllDto alldto) throws Exception{
		logger.info("MediConsultingController consultingdetail " + new Date());
		mediConsultingService.readcountBbs(alldto);
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
	//답글수정해주기
	@ResponseBody
	@RequestMapping(value="answerupdate.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> answerupdate(MediConsultingAllDto alldto,Model model) throws Exception{
		logger.info("MediConsultingController answerupdate " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		boolean isS=mediConsultingService.answerupdate(alldto);
		String yn="";
		if (isS) {
			yn="yes";
		}else {
			yn="no";
		}
		map.put("yn",yn);
		return map;
	}
	//답글삭제하기
	@ResponseBody
	@RequestMapping(value="answerdelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> answerdelete(MediConsultingAllDto alldto,Model model) throws Exception{
		logger.info("MediConsultingController answerdelete " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		boolean isS=mediConsultingService.answerdelete(alldto);
		String yn="";
		if (isS) {
			yn="yes";
		}else {
			yn="no";
		}
		map.put("yn",yn);
		return map;
	}
}
