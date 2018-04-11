package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kh.com.medi.service.MediHbbsService;

@Controller
public class MediHbbsController {

	private static final Logger logger = LoggerFactory.getLogger(MediHbbsController.class);
	
	@Autowired
	private MediHbbsService mediHbbsService;
	
	@RequestMapping(value="hbbslist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String hbbslist(Model model) throws Exception{
		logger.info("MediHbbsController hbbslist " + new Date());
		
		return "hbbslist.tiles";
	}
	
}
