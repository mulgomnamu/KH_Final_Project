package kh.com.medi.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;

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
import kh.com.medi.model.MediDoctor_specialtyDto;
import kh.com.medi.service.MediDoctorService;
import kh.com.medi.util.FUpUtil;

@Controller
public class MediDoctorController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediDoctorController.class);
    
	@Autowired
	MediDoctorService mediDoctorService;
	
	@RequestMapping(value="join_d.do", method={RequestMethod.GET, RequestMethod.POST})
	public String join_d() {
		logger.info("MediDoctorController join_d " + new Date());
		
		return "join_d.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="join_dAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public int join_dAf(MediDoctorDto dto_d, MediDoctor_specialtyDto dto_ds, 
			HttpServletRequest req, Model model, 
			@RequestParam(value="profile", required=false)MultipartFile fileload) {
		logger.info("MediDoctorController join_dAf " + new Date());
		
		dto_d.setDoc_profile(fileload.getOriginalFilename());
		
		String fupload = req.getServletContext().getRealPath("/upload");
		logger.info("업로드 경로 : " + fupload);
		
		String f = dto_d.getDoc_profile();
		String newFile = FUpUtil.getNewFile(f);
		logger.info("파일 이름 : " + newFile);
		
		dto_d.setDoc_profile(newFile);
		
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
			// TODO hos_seq 값 넣기
			dto_ds.setHos_seq(1);
			
			mediDoctorService.addSpecialty(dto_ds);
		}
		
		return 1;
	}

}
