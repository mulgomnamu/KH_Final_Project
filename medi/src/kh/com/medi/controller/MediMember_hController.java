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

import kh.com.medi.model.MediHospital_imageDto;
import kh.com.medi.model.MediHospital_subject;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.service.MediMember_hService;
import kh.com.medi.util.FUpUtil;

@Controller
public class MediMember_hController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMember_hController.class);
	
	private static final int RESULT_EXCEED_SIZE = -2;
    private static final int RESULT_UNACCEPTED_EXTENSION = -1;
    private static final int RESULT_SUCCESS = 1;
    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
    
	@Autowired
	MediMember_hService mediMember_hService;
	
	@RequestMapping(value="join_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String join_h() {
		logger.info("MediMember_hController join_h " + new Date());
		
		return "join_h.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="join_hAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public int join_hAf(MediHospital_imageDto dto_hi, MediMember_hDto dto_h, MediHospital_subject dto_s, 
			HttpServletRequest req, Model model, 
			@RequestParam(value="upload", required=false)MultipartFile fileload, 
			@RequestParam(value="_upload", required=false)List<MultipartFile> images) {
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
			
			mediMember_hService.addMember_h(dto_h);
			
		}catch (IOException e) {
			e.printStackTrace();
			return -1;
		}
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
            String originalName = image.getOriginalFilename();
            // 확장자 검사
            if(!isValidExtension(originalName)){
                return RESULT_UNACCEPTED_EXTENSION;
            }
            
            // 용량 검사
            sizeSum += image.getSize();
            if(sizeSum >= LIMIT_SIZE) {
                return RESULT_EXCEED_SIZE;
            }
            
            // 저장
            dto_hi.setImage(image.getOriginalFilename());
            
            String _fupload = req.getServletContext().getRealPath("/upload");
    		logger.info("업로드 경로 : " + _fupload);
            
    		String _f = dto_hi.getImage();
    		String _newFile = FUpUtil.getNewFile(_f);
    		logger.info("파일 이름 : " + newFile);
    		
    		dto_hi.setImage(_newFile);
    		
    		try {
    			File file = new File(_fupload + "/" + _newFile);
    			
    			FileUtils.writeByteArrayToFile(file, image.getBytes());
    			
    			dto_hi.setHos_seq(mediMember_hService.getHospitalColumn(dto_h.getId()).getSeq());
    			
    			mediMember_hService.addHospitalImage(dto_hi);
    			
    		}catch (Exception e) {
				e.printStackTrace();
			}
        }

		System.out.println(dto_s);
		
		dto_s.setHos_seq(mediMember_hService.getHospitalColumn(dto_h.getId()).getSeq());
		
		System.out.println(dto_s);
		
		String splits[] = dto_s.getCl_sjt_list().split(",");
		
		for(String split : splits) {
			dto_s.setSubject(split);
			
			mediMember_hService.addHospitalSubject(dto_s);
		}

		return 1;
	}
	
	@ResponseBody
	@RequestMapping(value="imgUploads.do", method={RequestMethod.GET, RequestMethod.POST})
	public int imgUploads(MediHospital_imageDto dto_hi, HttpServletRequest req, @RequestParam(value="_upload", required=false)List<MultipartFile> images) {
		logger.info("MediMember_hController imgUploads " + new Date());
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
            String originalName = image.getOriginalFilename();
            // 확장자 검사
            if(!isValidExtension(originalName)){
                return RESULT_UNACCEPTED_EXTENSION;
            }
            
            // 용량 검사
            sizeSum += image.getSize();
            if(sizeSum >= LIMIT_SIZE) {
                return RESULT_EXCEED_SIZE;
            }
            
            // 저장
            dto_hi.setImage(image.getOriginalFilename());
            
            String fupload = req.getServletContext().getRealPath("/upload");
    		logger.info("업로드 경로 : " + fupload);
            
    		String f = dto_hi.getImage();
    		String newFile = FUpUtil.getNewFile(f);
    		logger.info("파일 이름 : " + newFile);
    		
    		dto_hi.setImage(newFile);
    		
    		try {
    			File file = new File(fupload + "/" + newFile);
    			
    			FileUtils.writeByteArrayToFile(file, image.getBytes());
    			    			
    			mediMember_hService.addHospitalImage(dto_hi);
    			
    		}catch (Exception e) {
				e.printStackTrace();
			}
        }
        
        return RESULT_SUCCESS;
	}

	@ResponseBody
	@RequestMapping(value="checkId_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String checkId_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController checkId_h " + new Date());
		
		return (mediMember_hService.checkId(dto_h))+"";
	}
	
	private boolean isValidExtension(String originalName) {
        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".") + 1);
        switch(originalNameExtension) {
        case "jpg":
        case "png":
        case "gif":
            return true;
        }
        return false;
    }

}
