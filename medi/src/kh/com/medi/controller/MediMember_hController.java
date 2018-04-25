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
import kh.com.medi.model.MediSubjectDto;
import kh.com.medi.service.MediMember_hService;
import kh.com.medi.util.FUpUtil;

@Controller
public class MediMember_hController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMember_hController.class);

    private static final long LIMIT_SIZE = 10 * 1024 * 1024;
    
	@Autowired
	private MediMember_hService mediMember_hService;
	
	@RequestMapping(value="join_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String join_h() {
		logger.info("MediMember_hController join_h " + new Date());
		
		return "join_h.tiles";
	}
	
	@RequestMapping(value="update_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String update_h(Model model, MediMember_hDto dto_h) {
		logger.info("MediMember_hController update_h " + new Date());
		
		mediMember_hService.getHospitalColumn(dto_h.getId());
		List<MediSubjectDto> list_hs = mediMember_hService.getHospitalSubjectColumns(dto_h);
		
		model.addAttribute("dto_h", dto_h);
		model.addAttribute("list_hs", list_hs);
		
		return "update_h.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value="updateAf_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public int updateAf_h(Model model, MediMember_hDto dto_h, MediHospital_subject dto_s) {
		logger.info("MediMember_hController updateAf_h " + new Date());
		
//		hospital 수정
		mediMember_hService.updateMember_h(dto_h);
		
//		subject 삭제
		dto_s.setHos_seq(dto_h.getSeq());
		mediMember_hService.deleteHospitalSubject(dto_s);
		
//		subject 저장
		
		String splits[] = dto_s.getCl_sjt_list().split(",");
		
		for(String split : splits) {
			dto_s.setSubject(split);
			
			mediMember_hService.addHospitalSubject(dto_s);
		}
		
		return 1;
	}
	
	@RequestMapping(value="delete_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String delete_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController delete_h " + new Date());
		
		mediMember_hService.deleteMember_h(dto_h);
		
		return "redirect:/main.do";
	}
	
	@RequestMapping(value="myPage_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String myPage_h() {
		logger.info("MediMember_hController myPage_h " + new Date());
		
		return "myPage_h.tiles";
	}
	
	@RequestMapping(value="change_pwd_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String change_pwd_h() {
		logger.info("MediMember_hController change_pwd_h " + new Date());
		
		return "change_pwd_h.tiles";
	}
	
	@RequestMapping(value="login_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login_h() {
		logger.info("MediMember_hController login_h " + new Date());
		
		return "login_h.tiles";
	}
	
	@RequestMapping(value="login_hAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String login_hAf(MediMember_hDto dto_h, Model model, HttpServletRequest req) {
		logger.info("MediMember_hController login_hAf " + new Date());
		
		MediMember_hDto dto_login_h = mediMember_hService.login(dto_h);
		
		if(dto_login_h == null) {
			System.out.println("아이디 비밀번호 틀림");
			model.addAttribute("msg", "아이디나 비밀번호를 확인하세요");
			return "login_h.tiles";
		}else if(dto_login_h.getAuth() == 3) {
			System.out.println("dto_login_h.getAuth() : " + dto_login_h.getAuth());
			model.addAttribute("msg", "관리자 가입 승인을 기다려주세요.");
			return "login_h.tiles";
		}
		
		req.getSession().setAttribute("login", dto_login_h);
		
		return "redirect:/main.do";
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
		}
		
		long sizeSum = 0;
		for(MultipartFile image : images) {
            String originalName = image.getOriginalFilename();
            // 확장자 검사
            if(!isValidExtension(originalName)){
            }
            
            // 용량 검사
            sizeSum += image.getSize();
            if(sizeSum >= LIMIT_SIZE) {
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
		
		dto_s.setHos_seq(mediMember_hService.getHospitalColumn(dto_h.getId()).getSeq());
		
		String splits[] = dto_s.getCl_sjt_list().split(",");
		
		for(String split : splits) {
			dto_s.setSubject(split);
			
			mediMember_hService.addHospitalSubject(dto_s);
		}

		return dto_hi.getHos_seq();
	}
	
	@ResponseBody
	@RequestMapping(value="checkId_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String checkId_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController checkId_h " + new Date());
		
		return (mediMember_hService.checkId(dto_h))+"";
	}
	
	@ResponseBody
	@RequestMapping(value="checkTel_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String checkTel_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController checkTel_h " + new Date());
		
		return (mediMember_hService.checkTel(dto_h))+"";
	}
	
	@ResponseBody
	@RequestMapping(value="checkAddress_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String checkAddress_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController checkAddress_h " + new Date());
		
		return (mediMember_hService.checkAddress(dto_h))+"";
	}
	
	@ResponseBody
	@RequestMapping(value="checkEmail_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public String checkEmail_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController checkEmail_h " + new Date());
		
		return (mediMember_hService.checkEmail(dto_h))+"";
	}
	
	@ResponseBody
	@RequestMapping(value="changePwd_h.do", method={RequestMethod.GET, RequestMethod.POST})
	public int changePwd_h(MediMember_hDto dto_h) {
		logger.info("MediMember_hController changePwd_h " + new Date());
		
		if(mediMember_hService.login(dto_h) == null) {
// 현재 비밀번호 입력 틀림
			return 0;
		}
// 비번 변경
		mediMember_hService.changePwd(dto_h);
		
		return 1;
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
