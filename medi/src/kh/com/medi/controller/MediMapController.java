package kh.com.medi.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MediMapController {

	private static final Logger logger = LoggerFactory.getLogger(MediMapController.class);
	
	
	@RequestMapping(value="maplist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String maplist(Model model) throws Exception{
		logger.info("MediMemberController maplist " + new Date());
		
		return "maplist.tiles";
	}
	
}
