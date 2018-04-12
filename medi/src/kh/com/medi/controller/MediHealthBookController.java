package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.model.MediHealthBookDto;
import kh.com.medi.service.MediHeathBookService;
import kh.com.medi.service.impl.MediHealthBookServiceImpl;


@Controller
public class MediHealthBookController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediHealthBookController.class);
	
	
	@Autowired
	private MediHeathBookService mediHealthBookService;

	@RequestMapping(value="healthbook.do", method={RequestMethod.GET, RequestMethod.POST})
	public String Healthmain(Model model) throws Exception{
		logger.info("MediHealthBookController healthbook " + new Date());
		
		return "healthbook.tiles";
	}
	
	@RequestMapping(value = "healthbookAf.do", 
			method = RequestMethod.POST)
	public String bbswriteAf(MediHealthBookDto healthbook, Model model) throws Exception {
		/*if(healthbook.getBirth().equals("")){
			return "healthbook";
		}*/
		
		logger.info("Welcome MediHealthBookController healthbookeAf! "+ new Date());
		System.out.println(healthbook.toString());
		mediHealthBookService.Healthmain(healthbook);
		return "healthbook.tiles";
	}
	

}
