package kh.com.medi.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

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

import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediDoctor_specialtyDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;
import kh.com.medi.service.MediDoctorService;
import kh.com.medi.util.FUpUtil;

@Controller
public class MediDoctorController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediDoctorController.class);
    
	@Autowired
	MediDoctorService mediDoctorService;
	
	@RequestMapping(value="join_d.do", method={RequestMethod.GET, RequestMethod.POST})
	public String join_d(MediDoctorDto dto_d, Model model) {
		logger.info("MediDoctorController join_d " + new Date());
		
		model.addAttribute("hos_seq", dto_d.getHos_seq());
		
		return "join_d.tiles";
	}
	
	@RequestMapping(value="update_d.do", method={RequestMethod.GET, RequestMethod.POST})
	public String update_d(MediMember_hDto dto_h, MediDoctorDto dto_d, Model model) {
		logger.info("MediDoctorController update_d " + new Date());
		
		List<MediSpecialtyDto> list_spe = mediDoctorService.getHospitalSpecialtyColumns(dto_h);
		
		model.addAttribute("login_d", mediDoctorService.getDoctorColumn(dto_h));
		model.addAttribute("list_dSpe", list_spe);
		model.addAttribute("list_dSch", mediDoctorService.getHospitalSchedulColumns(dto_h));
		
		return "update_d.tiles";
	}
	
	@RequestMapping(value="delete_d.do", method={RequestMethod.GET, RequestMethod.POST})
	public String delete_d(MediDoctorDto dto_d, Model model) {
		logger.info("MediDoctorController delete_d " + new Date());
		
		mediDoctorService.deleteDoctor(dto_d);
		
		return "redirect:/main.do";
	}
	
	@ResponseBody
	@RequestMapping(value="join_dAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public int join_dAf(MediDoctorDto dto_d, MediDoctor_specialtyDto dto_ds, MediDoctorSchedulDto dto_dsc,  
			HttpServletRequest req, Model model, 
			@RequestParam(value="profile", required=false)MultipartFile fileload) {
		logger.info("MediDoctorController join_dAf " + new Date());

		String list_day[] = dto_dsc.getList_day();
		String day_tostring = "";
		
		for(int i = 0; i < list_day.length; i ++) {			
			if(i == list_day.length - 1)
				day_tostring = day_tostring + list_day[i];
			else
				day_tostring = day_tostring + list_day[i] + ",";
		}
		
		dto_d.setDoc_profile(fileload.getOriginalFilename());
		
		String fupload = req.getServletContext().getRealPath("/upload");
		logger.info("업로드 경로 : " + fupload);
		
		String f = dto_d.getDoc_profile();
		String newFile = FUpUtil.getNewFile(f);
		logger.info("파일 이름 : " + newFile);
		
		dto_d.setDoc_profile(newFile);
		dto_d.setDay_tostring(day_tostring);
		System.out.println(day_tostring);
		
		try {
			File file = new File(fupload + "/" + newFile);
			
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			mediDoctorService.addDoctor(dto_d);
			
		}catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		
		String splits[] = dto_d.getSpecialty().split(",");
		
		for(String split : splits) {
			dto_ds.setSpecialty(split);
			
			mediDoctorService.addSpecialty(dto_ds);
		}

		String list_s_time[] = dto_dsc.getS_time();
		String list_e_time[] = dto_dsc.getE_time();
		String list_l_time[] = dto_dsc.getL_time();
		
		System.out.println("dto_dsc" + dto_dsc);
		
		for(int i = 0; i < list_day.length; i ++) {
			dto_dsc.setDay(list_day[i]);
			dto_dsc.setStart_time(list_s_time[i]);
			dto_dsc.setEnd_time(list_e_time[i]);
			dto_dsc.setLunch_time(list_l_time[i]);
			
			mediDoctorService.addSchedul(dto_dsc);
		}
		
		return 1;
	}

}
