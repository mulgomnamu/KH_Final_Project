package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.service.MediMemberService;

@Controller
public class MediMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMemberController.class);
	
	@Autowired
	private MediMemberService mediMemberService;
	
	@RequestMapping(value="test.do", method={RequestMethod.GET, RequestMethod.POST})
	public String test(Model model) throws Exception{
		logger.info("MediMemberController test " + new Date());
		
		model.addAttribute("test", mediMemberService.test());
		
		return "home";
	}

}
