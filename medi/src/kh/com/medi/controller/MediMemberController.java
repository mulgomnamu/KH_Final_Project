package kh.com.medi.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping(value="selectJoin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectJoin() throws Exception{
		logger.info("MediMemberController selectJoin " + new Date());
		
		return "selectJoin.tiles";
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
		//System.out.println(dto.getId() + "!!!");
/*		System.out.println("dto.toString() =  " + dto.toString());*/
		if(dto.getId() != null) {
			String str = "ok";
			return str;
		}else {
			String str = "no";
			return str;
		}
		
		
	}
	
	@RequestMapping(value="joinMember.do", method={RequestMethod.GET, RequestMethod.POST})
	public String joinMember(Model model) throws Exception{
		logger.info("MediMemberController joinMember " + new Date());
		
		return "joinMember.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="memberMail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String memberMail(Model model, HttpServletRequest req) throws Exception{
		logger.info("MediMemberController memberMail " + new Date());
		
		String email = req.getParameter("email");
		System.out.println("mail!!:" + email);
		return email;
	}

}
