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
	
	@RequestMapping(value="login.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login(Model model, MediMemberDto dto) throws Exception{
		logger.info("MediMemberController login " + new Date());
		
		
		return "login.tiles";
	}
	
	@RequestMapping(value="loginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf(Model model, MediMemberDto dto, HttpServletRequest req) throws Exception{
		logger.info("MediMemberController loginAf " + new Date());
		
		MediMemberDto b = mediMemberService.loginAf(dto);
		if(b != null && !b.getId().equals("")) {
			req.getSession().setAttribute("login", b);
			System.out.println("2");
			return "redirect:/main.do";
		}else {
			System.out.println("3");
			return "login.tiles";	//그냥 몸만 감
			//return "forward:/login.do";	//데이터도 가지고 감 
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="idcheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public String idcheck(Model model, String id) throws Exception{
		logger.info("MediMemberController idcheck " + new Date());
		String str = "";
		System.out.println("controller까지 옴");
		MediMemberDto dto = mediMemberService.idCheck(id);
		//System.out.println(dto.getId() + "!!!");
/*		System.out.println("dto.toString() =  " + dto.toString());*/
		if(dto != null) {
			str = "ok";
			
		}else if(dto == null)  {
			str = "no";
		}
		return str;
		
	}
	
	@RequestMapping(value="joinMember.do", method={RequestMethod.GET, RequestMethod.POST})
	public String joinMember(Model model) throws Exception{
		logger.info("MediMemberController joinMember " + new Date());
		
		return "joinMember.tiles";
	}
	
	@RequestMapping(value="joinMemberAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String joinMemberAf(Model model, MediMemberDto dto, HttpServletRequest resq) throws Exception{
		logger.info("MediMemberController joinMemberAf " + new Date());
		
		dto.setPwd(resq.getParameter("password1"));
		dto.setAddress(resq.getParameter("addr1") + " " + resq.getParameter("addr2"));
		
		boolean flag = mediMemberService.insertMember(dto);
		mediMemberService.loginAf(dto);
		resq.getSession().setAttribute("login", dto);
		if(flag) {
			return "redirect:/main.do";
		}else {
			return "redirect:/joinMember.do";
		}
		
	}
	
	@RequestMapping(value="logout.do", method={RequestMethod.GET, RequestMethod.POST})
	public String logout(Model model) throws Exception{
		logger.info("MediMemberController logout " + new Date());
		
		return "logout.tiles";
	}
	
	@RequestMapping(value="memberIdPwFind.do", method={RequestMethod.GET, RequestMethod.POST})
	public String memberIdPwFind(Model model) throws Exception{
		logger.info("MediMemberController memberIdPwFind " + new Date());
		
		return "memberIdPwFind.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="idFind.do", method={RequestMethod.GET, RequestMethod.POST})
	public String idFind(Model model, MediMemberDto dto) throws Exception{
		logger.info("MediMemberController idFind " + new Date());
		dto = mediMemberService.idFind(dto);
		
		if(dto == null) {
			String str = "no";
			return str;
		}else{
			String str = dto.getId();
			System.out.println(str);
			return str;
		}
	}
	
	
	@RequestMapping(value="pwdReset.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwdReset(Model model, MediMemberDto dto) throws Exception{
		logger.info("MediMemberController pwdReset " + new Date());
		dto = mediMemberService.getQuesAns(dto);
		
		if(dto == null) {
			return "redirect:/memberIdPwFind.do";
		}else{
			model.addAttribute("dto", dto);
			return "pwdReset.tiles";
		}
	}
	

}





