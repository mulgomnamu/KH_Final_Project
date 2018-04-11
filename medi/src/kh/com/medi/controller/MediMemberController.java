package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.service.MediMemberService;

@Controller
public class MediMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMemberController.class);
	
	@Autowired
	private MediMemberService mediMemberService;
	
	@RequestMapping(value="main.do", method={RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) throws Exception{
		logger.info("MediMemberController main " + new Date());
		
		
		return "main.tiles";
	}

	@RequestMapping(value="changeplz.do", method={RequestMethod.GET, RequestMethod.POST})
	public String changeplz(Model model) throws Exception{
		logger.info("MediMemberController changeplz " + new Date());
		
		return "changeplz.tiles";
	}
	
	@RequestMapping(value="test.do", method={RequestMethod.GET, RequestMethod.POST})
	public String test(Model model) throws Exception{
		logger.info("MediMemberController test " + new Date());
		
		model.addAttribute("test", mediMemberService.test());
		
		return "home";
	}
	
	@ResponseBody
	@RequestMapping(value="idcheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public String idcheck(Model model, String id) throws Exception{
		logger.info("MediMemberController idcheck " + new Date());
		System.out.println("controller까지 옴");
		MediMemberDto dto = mediMemberService.idCheck(id);
/*		System.out.println("dto.toString() =  " + dto.toString());*/
		if(dto.getId() != null) {
			String str = "성공";
			return str;
		}else {
			String str = "실패";
			return str;
		}
		
		
	}
	
	@RequestMapping(value="joinMember.do", method={RequestMethod.GET, RequestMethod.POST})
	public String joinMember(Model model) throws Exception{
		logger.info("MediMemberController joinMember " + new Date());
		
		return "joinMember.tiles";
	}

}
