package kh.com.medi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.model.MediMyPageDto;
import kh.com.medi.service.MediMemberService;
import kh.com.medi.service.MediMyPageService;

@Controller
public class MediMyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMyPageController.class);
	
	@Autowired
	private MediMyPageService medimyPageservice;
	
	private MediMemberService mediMemberService;
	
	/*내예약현황*/
	@RequestMapping(value="MyPageList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String MyPageList(Model model, MediMyListPagingDto paging) throws Exception{
		logger.info("MediMyPageController MyPageList " + new Date());
		System.out.println("++++++++++++++++++++++++++++++++++++++"+paging.toString());
		// paging처리
				int sn = paging.getPageNumber();
				int start = (sn) * paging.getRecordCountPerPage() + 1;
				int end = (sn + 1) * paging.getRecordCountPerPage();
				
				paging.setStart(start);
				paging.setEnd(end);
				
				int totalRecordCount = medimyPageservice.getBbsCount(paging);
				List<MediMemberDto> Mylisy = medimyPageservice.getBbsPagingList(paging);
				
				model.addAttribute("Mylisy", Mylisy);
				model.addAttribute("pageNumber", sn);
				model.addAttribute("pageCountPerScreen", 4);
				model.addAttribute("recordCountPerPage", paging.getRecordCountPerPage());
				model.addAttribute("totalRecordCount", totalRecordCount);
				
				model.addAttribute("s_category", paging.getS_category());
				model.addAttribute("s_keyword", paging.getS_keyword());
				
				
				return "MyPageList.tiles";
	}
	
	
	
	@RequestMapping(value="MyPage.do", method={RequestMethod.GET, RequestMethod.POST})
	public String main(Model model, MediMemberDto dto, HttpServletRequest req) throws Exception{
		logger.info("MediMyPageController main " + new Date());
		
		
		
		
		return "MyPage.tiles";
	}
	
	/*내정보수정*/ 
	@RequestMapping(value="MyPageLogin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String myupdate(Model model, MediMemberDto dto, HttpServletRequest req) throws Exception{
		logger.info("MediMyPageController MyPageLogin " + new Date());
	
		
		return "MyPageLogin.tiles";
		
	}
	/*내정보수정로그인*/
	@RequestMapping(value="MyPageLoginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String MyPageLoginAf(Model model, MediMemberDto my, HttpServletRequest req) throws Exception{
		logger.info("MediMyPageController MyPageLoginAf " + new Date());
		System.out.println(my.toString());
		MediMemberDto dto = medimyPageservice.myup(my);
		if(dto != null && !dto.getId().equals("")) {
			
			System.out.println("2");
			return "redirect:/MyPage.do";
		}else {
			System.out.println("3");
			model.addAttribute("msg", "비밀번호가 틀렸습니다");
			return "MyPageLogin.tiles";	//그냥 몸만 감
			//return "forward:/login.do";	//데이터도 가지고 감 
		}
		
		
	}
	
	
	
	/*내정보 mydetail*/
	@RequestMapping(value="Mydetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mydetail(Model model, MediMemberDto my ) throws Exception{
		logger.info("MediMyPageController Mydetail " + new Date());
		MediMemberDto dto = medimyPageservice.Mydetail(my);
		
		model.addAttribute("my",dto);
		return"Mydetail.tiles";
	}
	/*내정보 수정*/ 
	@RequestMapping(value="mysupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String myupdate(Model model, MediMemberDto my ) throws Exception{
		logger.info("MediMyPageController mysupdateAf " + new Date());
		
		System.out.println("이름"+my.getId());
		
		String id = my.getId();
		String pwd = my.getPwd();
		String email = my.getEmail();
		String phone = my.getPhone();
		int post = my.getPost();
		String address = my.getAddress();
		
		HashMap<String, Object> mep = new HashMap<>();
		mep.put("id", id);
		mep.put("pwd", pwd);
		mep.put("email", email);
		mep.put("phone", phone);
		mep.put("post", post);
		mep.put("address", address);
		
		boolean bbs = medimyPageservice.myUpate(mep);
		
		
		if(bbs == true) {
			System.out.println("성공");
			return "redirect:/MyPage.do";

		}
		else {
			System.out.println("실패");
			return "redirect:/Mydetail.do";

		}
		
	}
	/*회원탈퇴*/
		@RequestMapping(value="mydelete.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mydelete(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController mydelete " + new Date());
			
			
			return "mydelete.tiles";
			
		
		}
		/*회원탈퇴*/
		@RequestMapping(value="MydeleteAf.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mydeleteAf(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController mydelete " + new Date());
			
			String id = my.getId();
			String pwd = my.getPwd();
			
			HashMap<String, Object> mep = new HashMap<>();
			mep.put("id", id);
			mep.put("pwd", pwd);
			
			boolean bbs = medimyPageservice.mydelete(mep);
			
			if(bbs == true) {
				System.out.println("성공");
				model.addAttribute("msg", "탈퇴 성공하셨습니다"); 
				return "redirect:/Mybye.do";
			}else {
				System.out.println("실패");
				return "mydelete.tiles";
			}
		
		}
		
		/*탈퇴후 메인 화면*/
		@RequestMapping(value="Mybye.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mybye(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController mydelete " + new Date());
			
			return "Mybye.tiles";
			
		}
		
		
		
		
		/*비밀번호 수정  페이지로*/
		@RequestMapping(value="Mypwdupdate.do", method={RequestMethod.GET, RequestMethod.POST})
		public String _mypwdupdate(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController Mypwdupdate " + new Date());
			
			model.addAttribute("pwd",my);
			
			return "Mypwdupdate.tiles";
		
		}
		
		@RequestMapping(value="MypwdupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mypwdupdateAf(Model model, MediMemberDto my, HttpServletRequest req) throws Exception{
			logger.info("MediMyPageController Mypwdupdate " + new Date());
			my.setName(req.getParameter("password1"));
			String pwd = my.getPwd();
			System.out.println(pwd);
			
			
			HashMap<String, Object> mep = new HashMap<>();
			mep.put("name", my.getName());
			mep.put("pwd", pwd);
			boolean bbs = medimyPageservice.mypwdupdate(mep);
			
			
			if(bbs == true){
				System.out.println("성공");
				return "redirect:/Mybye.do";
			}else {
				System.out.println("실패");
				return "Mypwdupdate.tiles";
			}
				
		}
		
}
