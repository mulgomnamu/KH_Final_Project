package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
}
