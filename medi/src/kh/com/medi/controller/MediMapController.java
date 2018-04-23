package kh.com.medi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediHbbsParamDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediHbbsService;

@Controller
public class MediMapController {

	private static final Logger logger = LoggerFactory.getLogger(MediMapController.class);

	@Autowired
	private MediHbbsService mediHbbsService;
	
	@RequestMapping(value="maplist.do", method={RequestMethod.GET, RequestMethod.POST})
	public String maplist(Model model, MediHbbsParamDto hbbs) throws Exception{
		logger.info("MediMemberController maplist " + new Date());

		List<MediMember_hDto> hoslist = mediHbbsService.getHospitalList(hbbs);

		model.addAttribute("hoslist", hoslist);
		model.addAttribute("s_keyword", hbbs.getS_keyword());
		System.out.println("aaaaaaaaaaaaaaaaaa====" + hbbs.getS_keyword());
		
		
		return "maplist.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="getloctation.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getloctation(MediHbbsParamDto hbbs,Model model) throws Exception{
		logger.info("MediMemberController getloctation " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		List<MediMember_hDto> hoslist = mediHbbsService.getHospitalList(hbbs);
		
		System.out.println("aaaaaaaaaaaaaaaaaaaaa " + hoslist.size());
		
		map.put("hoslist",hoslist);
		map.put("size", hoslist.size());
		
		return map;
	}
	
}
