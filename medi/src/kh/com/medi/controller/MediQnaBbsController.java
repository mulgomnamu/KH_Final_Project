package kh.com.medi.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediHbbsService;
import kh.com.medi.service.MediQnaBbsService;

@Controller
public class MediQnaBbsController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediQnaBbsController.class);

	@Autowired
	private MediQnaBbsService mediQnaBbsService;
	
	@RequestMapping(value="QnAbblist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String QnAbblist(Model model, MediHbbsParamDto hbbs) throws Exception{
		logger.info("MediHbbsController QnAbblist " + new Date());
		
		
		return "QnAbblist.tiles";
	}
}
