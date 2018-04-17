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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediMember_h_imgDto;
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
	public String join_hAf(MediMember_hDto dto_h, HttpServletRequest req, Model model, @RequestParam(value="upload", required=false)MultipartFile fileload) {
		logger.info("MediMember_hController join_hAf " + new Date());
		
		dto_h.setConfirm_img(fileload.getOriginalFilename());
		
		String fupload = "c:\\upload";
		logger.info("업로드 경로 : " + fupload);
		
		String f = dto_h.getConfirm_img();
		String newFile = FUpUtil.getNewFile(f);
		logger.info("파일 이름 : " + newFile);
		
		dto_h.setConfirm_img(newFile);
		
		try {
			File file = new File(fupload + "/" + newFile);
			
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			mediMember_hService.addMember_h(dto_h);
			
		}catch (IOException e) {
			e.printStackTrace();
		}
		
		return "main.tiles";
	}

	@RequestMapping(value="imgUploads.do", method={RequestMethod.GET, RequestMethod.POST})
	public String imgUploads(MultipartHttpServletRequest mtfReq) {
		logger.info("MediMember_hController imgUploads " + new Date());
		
		List<MultipartFile> flist = mtfReq.getFiles("_upload");
		String src = mtfReq.getParameter("src");
		System.out.println("src in controller" + src);
		
		String path ="c:\\upload\\";
		
		for(MultipartFile mf : flist) {
			String originFileName = mf.getOriginalFilename();	// 원본 파일 명
			long fileSize = mf.getSize();						// 파일 사이즈
			
			System.out.println("originFileName in controller" + originFileName);
			System.out.println("fileSize in controller" + fileSize);
			
			String safeFile = path + System.currentTimeMillis() + originFileName;
			try {
				mf.transferTo(new File(safeFile));
			}catch (IllegalStateException e) {
				e.printStackTrace();
			}catch (IOException e) {
				e.printStackTrace();
			}
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
