package kh.com.medi.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.model.MediHealthBookDto;
import kh.com.medi.service.MediHeathBookService;



@Controller
public class MediHealthBookController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediHealthBookController.class);
	
	
	@Autowired
	private MediHeathBookService mediHealthBookService;

	@RequestMapping(value="healthbooklist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Healthmain(HttpServletRequest req, Model model) throws Exception{

		logger.info("MediHealthBookController healthbook " + new Date());
		
		model.addAttribute("hlist", mediHealthBookService.getHealthBookList());
		
		return "healthbooklist.tiles";
	}
	
/*	@RequestMapping(value = "healthbooklist.do", 
			method = {RequestMethod.GET, RequestMethod.POST})
	public String Healthmain(int mem_seq,Model model) throws Exception {
		logger.info("MediHealthBookController healthbook " + new Date());
		MediHealthBookDto hlist=null;
		System.out.println(hlist.toString());
		

		hlist=mediHealthBookService.getHealthBook(mem_seq);
		model.addAttribute("hlist", hlist);
		return "healthbooklist.tiles";
	}*/
	
	@RequestMapping(value="healthbook.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String healthbookwrite(Model model) {
		logger.info("Welcome MediHealthBookController healthbookwrite! "+ new Date());
		
		model.addAttribute("doc_title", "글 쓰기");
		
		return "healthbook.tiles";
	}
	
	@RequestMapping(value = "healthbookAf.do", 
			method = {RequestMethod.GET,	RequestMethod.POST} )
	public String healthbookwriteAf(MediHealthBookDto healthbookdto, Model model) throws Exception {
		
		logger.info("Welcome MediHealthBookController healthbookeAf! "+ new Date());
		System.out.println(healthbookdto.toString());
		
		
		mediHealthBookService.healthBookWrite(healthbookdto);
		return "redirect:/healthbooklist.do";
	
	}
	

}
