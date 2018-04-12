package kh.com.medi.controller;

import java.util.Date;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.model.MediMyPageDto;
import kh.com.medi.service.MediMyPageService;

@Controller
public class MediMyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMyPageController.class);
	
	@Autowired
	private MediMyPageService medimyPageservice;
	
	@RequestMapping(value="MyPage.do", method={RequestMethod.GET, RequestMethod.POST})
	public String main(Model model) throws Exception{
		logger.info("MediMyPageController main " + new Date());
		
		return "MyPage.tiles";
	}
	
	@RequestMapping(value="Mydetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mydetail(Model model, MediMyPageDto my ) throws Exception{
		logger.info("MediMyPageController Mydetail " + new Date());
		MediMyPageDto dto = medimyPageservice.Mydetail(my);
		model.addAttribute("my",dto);
		return"Mydetail.tiles";
	}
	
	@RequestMapping(value="mysupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String myupdate(Model model, MediMyPageDto my ) throws Exception{
		logger.info("MediMyPageController mysupdateAf " + new Date());
		
		String seq = my.getSeq()+"";
		String pwd = my.getPwd();
		String email = my.getEmail();
		String phone = my.getPhone();
		String post = my.getPost();
		String address = my.getAddress();
		
		HashMap<String, Object> mep = new HashMap<>();
		mep.put("seq", seq);
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
		
		@RequestMapping(value="mydelete.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mydelete(Model model, MediMyPageDto my) throws Exception{
			logger.info("MediMyPageController mydelete " + new Date());
			
			medimyPageservice.mydelete(my);
			return "redirect:/main.do";
			
		
		}
}
