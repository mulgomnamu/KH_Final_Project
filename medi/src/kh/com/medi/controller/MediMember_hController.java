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

import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediMember_hService;
import kh.com.medi.util.FUpUtil;

@Controller
public class MediMember_hController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMember_hController.class);
	
	@Autowired
	MediMember_hService mediMember_hService;
	
	@RequestMapping(value="join_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String join_h() {
		logger.info("MediMember_hController join_h " + new Date());
		
		return "join_h.tiles";
	}
	
	@RequestMapping(value="join_hAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String join_hAf(MediMember_hDto dto_h, HttpServletRequest req, Model model, @RequestParam(value="fileload", required=false)MultipartFile fileload) {
		logger.info("MediMember_hController join_hAf " + new Date());
		
		dto_h.setConfirm_img(fileload.getOriginalFilename());
		
		String fupload = req.getServletContext().getRealPath("/upload");
		logger.info("업로드 경로 : " + fupload);
		
		String f = dto_h.getConfirm_img();
		String newFile = FUpUtil.getNewFile(f);
		logger.info("파일 이름 : " + newFile);
		
		dto_h.setConfirm_img(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return "main.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="checkId_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String checkId_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController checkId_h " + new Date());
		
		return (mediMember_hService.checkId(dto_h))+"";
	}

}
