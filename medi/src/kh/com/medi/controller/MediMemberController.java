package kh.com.medi.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.service.MailService;
import kh.com.medi.service.MediMemberService;
import kh.com.medi.util.FUpUtil;

@Controller
public class MediMemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMemberController.class);
	
	private MailService mailService;
	
	@Autowired
	public void setMailService(MailService mailService) {
        this.mailService = mailService;
        
    }

	
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
	
	/*탈퇴회원 사용불가 추가*/
	@RequestMapping(value="loginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String loginAf(Model model, MediMemberDto dto, HttpServletRequest req) throws Exception{
		logger.info("MediMemberController loginAf " + new Date());
		boolean flag = true;
		MediMemberDto b = mediMemberService.loginAf(dto);

		if(b == null) {
			flag = false;
		}else {
			flag = true;
		}

		if(flag) {
			if(b.getAuth() == 0) {
				System.out.println("3");
				model.addAttribute("msg", "이메일 인증을 해주세요"); 
				return "login.tiles";
			}else if(b != null && !b.getId().equals("") && b.getDel() == 0){
				req.getSession().setAttribute("login", b);
				System.out.println("2");
				return "redirect:/main.do";//그냥 몸만 감
				//return "forward:/login.do";	//데이터도 가지고 감 
			}else {
				System.out.println("1");
				model.addAttribute("msg", "id나 pwd를 확인해주세요"); 
				return "login.tiles";
			}
		}else {
			System.out.println("4");
			model.addAttribute("msg", "id나 pwd를 확인해주세요"); 
			return "login.tiles";
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
	
	@ResponseBody
	@RequestMapping(value="emailcheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public String emailcheck(Model model, String email) throws Exception{
		logger.info("MediMemberController emailcheck " + new Date());
		String str = "";
		System.out.println("controller까지 옴");
		MediMemberDto dto = mediMemberService.emailCheck(email);
		//System.out.println(dto.getId() + "!!!");
/*		System.out.println("dto.toString() =  " + dto.toString());*/
		if(dto != null) {
			str = "ok";
		}else if(dto == null)  {
			str = "no";
		}
		return str;
	}
	
	@ResponseBody
	@RequestMapping(value="phonecheck.do", method={RequestMethod.GET, RequestMethod.POST})
	public String phonecheck(Model model, String phone) throws Exception{
		logger.info("MediMemberController phonecheck " + new Date());
		String str = "";
		System.out.println("controller까지 옴");
		MediMemberDto dto = mediMemberService.phoneCheck(phone);
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
	public String joinMemberAf(Model model, MediMemberDto dto, HttpServletRequest req, @RequestParam(value="fileload", required=false)MultipartFile fileload) throws Exception{
		logger.info("MediMemberController joinMemberAf " + new Date());
		
		dto.setPwd(req.getParameter("password1"));
		dto.setAddress(req.getParameter("addr1") + " " + req.getParameter("addr2"));
		String str = req.getParameter("fileload");
		
		/*System.out.println("!!!!!!!!!!fileload.getOriginalFilename() : " +  str);*/
		
		
		dto.setMyimg(fileload.getOriginalFilename());
		String fupload = req.getServletContext().getRealPath("/upload");
		logger.info("업로드경로: " + fupload);
		
		String f = dto.getMyimg();
		String newFile = FUpUtil.getNewFile(f);
		
		dto.setMyimg(newFile);
		try {
			File file = new File(fupload + "/" + newFile);
			
			//실제 업로드 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		boolean flag = mediMemberService.insertMember(dto);
		MediMemberDto IDandEmailDto = mediMemberService.getQuesAns(dto);
		/*//회원가입 후 자동로그인
		mediMemberService.loginAf(dto);
		req.getSession().setAttribute("login", dto);*/
		
		
		if(flag) {
			
            String subject = "[이메일 인증]";
            
            StringBuilder sb = new StringBuilder();
            sb.append("<a href='http://localhost:8090/medi/emailAuthenticationAf.do?id=" + IDandEmailDto.getId() + "&email=" + IDandEmailDto.getEmail())
            .append("' target='_blenk'>이메일 인증 확인</a>");
            mailService.send(subject, sb.toString(), "asdqawsed92@gmail.com", IDandEmailDto.getEmail());
			return "emailAuthentication.tiles";
		}else {
			return "redirect:/joinMember.do";
		}
		
		/*if(flag) {
			return "redirect:/main.do";
		}else {
			return "redirect:/joinMember.do";
		}*/
		
	}
	
	@RequestMapping(value="emailAuthenticationAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String emailAuthenticationAf(Model model, MediMemberDto dto, HttpServletRequest req, @RequestParam String id, @RequestParam String email) throws Exception{
		logger.info("MediMemberController emailAuthenticationAf " + new Date());
		
		//auth 1로 수정
		dto.setId(id);
		mediMemberService.emailAuth(dto);
		
		//email 인증 후 id, email을 가져와서 업데이트
		dto.setEmail(email);
		MediMemberDto login = mediMemberService.emailAuthAf(dto);
		req.getSession().setAttribute("login", login);
		return "emailAuthenticationAf.tiles";
		
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
		System.out.println("getId " + dto.getId());
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
	
	@RequestMapping(value="pwdResetAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String pwdResetAf(Model model, MediMemberDto dto) throws Exception{
		logger.info("MediMemberController pwdResetAf " + new Date());
		MediMemberDto originAnswerDto = mediMemberService.getQuesAns(dto);

		System.out.println("dto.getAnswer() " + dto.getAnswer());
		System.out.println("originAnswerDto.getAnswer() " + originAnswerDto.getAnswer());
		if(dto.getAnswer().equals(originAnswerDto.getAnswer())) {
			System.out.println("답변 일치");
			int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            originAnswerDto.setPwd(password);
            mediMemberService.pwdReset(originAnswerDto); // 해당 유저의 DB정보 변경
            System.out.println("비밀번호 변경완료");
            String subject = "임시 비밀번호 발급 안내 입니다.";
            
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "asdqawsed92@gmail.com", originAnswerDto.getEmail());

            /*ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");*/
            
            return "redirect:/login.do";
		}else {
			return "redirect:/main.do";
		}
	}
	
	/*// 비밀번호 찾기
    @RequestMapping(value = "/sendMail/password", method = RequestMethod.POST)
    public String sendMailPassword( @RequestParam String id, @RequestParam String email, @RequestParam String captcha, RedirectAttributes ra) {
       
        User user = userService.findAccount(email);
        if (user != null) {
            if (!user.getId().equals(id)) {
                ra.addFlashAttribute("resultMsg", "입력하신 이메일의 회원정보와 가입된 아이디가 일치하지 않습니다.");
                return "redirect:/find/password";
            }
            int ran = new Random().nextInt(100000) + 10000; // 10000 ~ 99999
            String password = String.valueOf(ran);
            userService.updateInfo(user.getNo(), "password", password); // 해당 유저의 DB정보 변경
 
            String subject = "임시 비밀번호 발급 안내 입니다.";
            StringBuilder sb = new StringBuilder();
            sb.append("귀하의 임시 비밀번호는 " + password + " 입니다.");
            mailService.send(subject, sb.toString(), "아이디@gmail.com", email, null);
            ra.addFlashAttribute("resultMsg", "귀하의 이메일 주소로 새로운 임시 비밀번호를 발송 하였습니다.");
        } else {
            ra.addFlashAttribute("resultMsg", "귀하의 이메일로 가입된 아이디가 존재하지 않습니다.");
        }
        return "redirect:/find/password";
    }*/
	

}





