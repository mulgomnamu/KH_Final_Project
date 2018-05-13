package kh.com.medi.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.medi.model.MediAppointmentDto;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.model.MediMyPageDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;
import kh.com.medi.service.MediMemberService;
import kh.com.medi.service.MediMyPageService;

@Controller
public class MediMyPageController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediMyPageController.class);
	
	@Autowired
	private MediMyPageService medimyPageservice;
	

	
	/*Qna게시판*/
	@RequestMapping(value="MyPageList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String MyPageList(Model model, MediQnaBbsParamDto ddt) throws Exception{
		logger.info("MediMyPageController MyPageList " + new Date());
		System.out.println("++++++++++++++++++++++++++++++++++++++"+ddt.toString());
		// paging처리
				int sn = ddt.getPageNumber();
				int start = (sn) * ddt.getRecordCountPerPage() + 1;
				int end = (sn + 1) * ddt.getRecordCountPerPage();
				
				
				ddt.setStart(start);
				ddt.setEnd(end);
				
				int totalRecordCount = medimyPageservice.getBbsCount(ddt);
				
				List<MediQnaBbsDto> Mylisy = medimyPageservice.getBbsPagingList(ddt);
				
				model.addAttribute("Mylisy", Mylisy);
				model.addAttribute("pageNumber", sn);
				model.addAttribute("pageCountPerScreen", 4);
				model.addAttribute("recordCountPerPage", ddt.getRecordCountPerPage());
				model.addAttribute("totalRecordCount", totalRecordCount);
				
				model.addAttribute("s_category", ddt.getS_category());
				model.addAttribute("s_keyword", ddt.getS_keyword());
				
				
				return "MyPageList.tiles";
	}
	
	
	
	@RequestMapping(value="MyPage.do", method={RequestMethod.GET, RequestMethod.POST})
	public String main(Model model, MediMemberDto dto, HttpServletRequest req) throws Exception{
		logger.info("MediMyPageController main " + new Date());
		
		
		
		
		return "MyPage.tiles";
	}
	
	/*내정보수정*/ 
	@RequestMapping(value="MyPageLogin.do", method={RequestMethod.GET, RequestMethod.POST})
	public String myupdate(Model model, MediMemberDto dto, HttpServletRequest req) throws Exception{
		logger.info("MediMyPageController MyPageLogin " + new Date());
	
		
		return "MyPageLogin.tiles";
		
	}
	/*내정보수정로그인*/
	@RequestMapping(value="MyPageLoginAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String MyPageLoginAf(Model model, MediMemberDto my, HttpServletRequest req) throws Exception{
		logger.info("MediMyPageController MyPageLoginAf " + new Date());
		System.out.println(my.toString());
		MediMemberDto dto = medimyPageservice.myup(my);
		if(dto != null && !dto.getId().equals("")) {
			
			System.out.println("2");
			return "redirect:/MyPage.do";
		}else {
			System.out.println("3");
			model.addAttribute("msg", "비밀번호가 틀렸습니다");
			return "MyPageLogin.tiles";	//그냥 몸만 감
			//return "forward:/login.do";	//데이터도 가지고 감 
		}
		
		
	}
	
	
	
	/*내정보 mydetail*/
	@RequestMapping(value="Mydetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String mydetail(Model model, MediMemberDto my ) throws Exception{
		logger.info("MediMyPageController Mydetail " + new Date());
		MediMemberDto dto = medimyPageservice.Mydetail(my);
		
		model.addAttribute("my",dto);
		return"Mydetail.tiles";
	}
	/*내정보 수정*/ 
	@RequestMapping(value="mysupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String myupdate(Model model, MediMemberDto my ) throws Exception{
		logger.info("MediMyPageController mysupdateAf " + new Date());
		
		System.out.println("이름"+my.getId());
		
		String id = my.getId();
		String pwd = my.getPwd();
		String email = my.getEmail();
		String phone = my.getPhone();
		int post = my.getPost();
		String address = my.getAddress();
		
		HashMap<String, Object> mep = new HashMap<>();
		mep.put("id", id);
		mep.put("pwd", pwd);
		mep.put("email", email);
		mep.put("phone", phone);
		mep.put("post", post);
		mep.put("address", address);
		
		boolean bbs = medimyPageservice.myUpate(mep);
		
		
		if(bbs == true) {
			System.out.println("성공");
			return "redirect:/MyPage.do";

		}
		else {
			System.out.println("실패");
			return "redirect:/Mydetail.do";

		}
		
	}
	/*회원탈퇴*/
		@RequestMapping(value="mydelete.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mydelete(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController mydelete " + new Date());
			
			
			return "mydelete.tiles";
			
		
		}
		/*회원탈퇴*/
		@RequestMapping(value="MydeleteAf.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mydeleteAf(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController mydelete " + new Date());
			
			String id = my.getId();
			String pwd = my.getPwd();
			
			HashMap<String, Object> mep = new HashMap<>();
			mep.put("id", id);
			mep.put("pwd", pwd);
			
			boolean bbs = medimyPageservice.mydelete(mep);
			
			if(bbs == true) {
				System.out.println("성공");
				model.addAttribute("msg", "탈퇴 성공하셨습니다"); 
				return "redirect:/Mybye.do";
			}else {
				System.out.println("실패");
				return "mydelete.tiles";
			}
		
		}
		
		/*탈퇴후 메인 화면*/
		@RequestMapping(value="Mybye.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mybye(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController mydelete " + new Date());
			
			return "Mybye.tiles";
			
		}
		
		
		
		
		/*비밀번호 수정  페이지로*/
		@RequestMapping(value="Mypwdupdate.do", method={RequestMethod.GET, RequestMethod.POST})
		public String _mypwdupdate(Model model, MediMemberDto my) throws Exception{
			logger.info("MediMyPageController Mypwdupdate " + new Date());
			
			model.addAttribute("pwd",my);
			
			return "Mypwdupdate.tiles";
		
		}
		/*비밀번호수정*/
		@RequestMapping(value="MypwdupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
		public String mypwdupdateAf(Model model, MediMemberDto my, HttpServletRequest req) throws Exception{
			logger.info("MediMyPageController Mypwdupdate " + new Date());
			my.setName(req.getParameter("password1"));
			String pwd = my.getPwd();
			System.out.println(pwd);
			
			
			HashMap<String, Object> mep = new HashMap<>();
			mep.put("name", my.getName());
			mep.put("pwd", pwd);
			boolean bbs = medimyPageservice.mypwdupdate(mep);
			
			
			if(bbs == true){
				System.out.println("성공");
				return "redirect:/Mybye.do";
			}else {
				System.out.println("실패");
				return "Mypwdupdate.tiles";
			}
				
		}
		/*내가 쓴 건강상담*/
		@RequestMapping(value="Myconsulting.do", method={RequestMethod.GET, RequestMethod.POST})
		public String Myconsulting(Model model, MediConsultingAllDto alldto) throws Exception{
			logger.info("MediMyPageController Myconsulting " + new Date());
			
			// paging처리
			int sn = alldto.getPageNumber();
			int start = (sn) * alldto.getRecordCountPerPage() + 1;
			int end = (sn + 1) * alldto.getRecordCountPerPage();
			
			alldto.setStart(start);
			alldto.setEnd(end);
			
			int totalRecordCount = medimyPageservice.getBbsCount(alldto);
			List<MediConsultingQuestionDto> questionlist = medimyPageservice.getconPagingList(alldto);
			model.addAttribute("questionlist", questionlist);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", alldto.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
			model.addAttribute("s_category", alldto.getS_category());
			model.addAttribute("s_keyword", alldto.getS_keyword());
					
			return "Myconsulting.tiles";
		
		}
		
		/*건상상담 detail*/
		@RequestMapping(value="Myconsultingdetail.do", method={RequestMethod.GET, RequestMethod.POST})
		public String Myconsultingdetail(Model model, MediConsultingAllDto alldto) throws Exception{
			logger.info("MediConsultingController consultingdetail " + new Date());
			medimyPageservice.readcountBbs(alldto);
			MediConsultingQuestionDto dto=medimyPageservice.getBbsDetail(alldto);	//질문의 seq로 그디테일뿌려주고
			List<MediConsultingAnswerDto> answerlist=medimyPageservice.answerlist(alldto);//질문의seq로 parent검색해서뿌려주는리스트
			
			model.addAttribute("answerlist", answerlist);
			model.addAttribute("bbs", dto);
			return "Myconsultingdetail.tiles";
		}
		
		@ResponseBody
		@RequestMapping(value="mysaveselected.do", method={RequestMethod.GET, RequestMethod.POST})
		public Map<String, Object> mysaveselected(MediConsultingAllDto alldto,Model model) throws Exception{
			logger.info("MediConsultingController mysaveselected " + new Date());
			System.out.println("==================================]"+alldto.getAns_seq());
			System.out.println("==================================]"+alldto.getHos_seq());
			Map<String, Object> map=new HashMap<String, Object>();
			MediConsultingAnswerDto ansdto=medimyPageservice.answerdetail(alldto);
			boolean isS=medimyPageservice.selectyn(ansdto);
			boolean isS1=medimyPageservice.selected(ansdto);
			String yn="";
			if (isS) {
				yn="yes";
			}else {
				yn="no";
			}
			if (isS1) {
				yn="yesyes";
				medimyPageservice.plusscore(alldto);
			}else {
				yn="no";
			}
			map.put("yn",yn);
			return map;
		}
		
		
		@ResponseBody
		@RequestMapping(value="checkPhone.do", method={RequestMethod.GET, RequestMethod.POST})
		public String checkPhone(MediMemberDto my) throws Exception {
			logger.info("MediMyPageController checkPhone " + new Date());
			
			return medimyPageservice.checkPhone(my) + "";
		}
		
		@ResponseBody
		@RequestMapping(value="checkEmail.do", method={RequestMethod.GET, RequestMethod.POST})
		public String checkEmail(MediMemberDto my) throws Exception {
			logger.info("MediMyPageController checkEmail " + new Date());
			
			return medimyPageservice.checkEmail(my) + "";
		}
		
		/*예약현황*/
		@RequestMapping(value="Myreserve.do", method={RequestMethod.GET, RequestMethod.POST})
		public String Myreserve(Model model,  MediConsultingAllDto dto) throws Exception{
			logger.info("MediMyPageController Myreserve " + new Date());
			// 모든글
			System.out.println("======================================="+dto.getS_keyword()+dto.getS_keyword1());
		
			
			int sn = dto.getPageNumber();
			int start = (sn) * dto.getRecordCountPerPage() + 1;
			int end = (sn + 1) * dto.getRecordCountPerPage();
			
			dto.setStart(start);
			dto.setEnd(end);
			
			int totalRecordCount = medimyPageservice.getanswerlistCount(dto);
			List<MediAppointmentDto> list = medimyPageservice.relist(dto);
			model.addAttribute("pageNumber", sn);
			model.addAttribute("pageCountPerScreen", 10);
			model.addAttribute("recordCountPerPage", dto.getRecordCountPerPage());
			model.addAttribute("totalRecordCount", totalRecordCount);
			
		
			model.addAttribute("s_keyword", dto.getS_keyword());
			model.addAttribute("s_keyword1", dto.getS_keyword1());
			
			
			
			model.addAttribute("list", list);
		
			
			
			return"Myreserve.tiles";
		}
		
		@RequestMapping(value="myreservedetail.do", method={RequestMethod.GET, RequestMethod.POST})
		public String reservedetail(MediAppointmentNeedDto alldto,Model model) throws Exception{
			logger.info("MediAppointmentController myreservedetail " + new Date());
			MediMember_hDto hosdto=medimyPageservice.mygethospitaldetail(alldto);
			MediDoctorDto docdto=medimyPageservice.mygetdocdetail(alldto);
			MediAppointmentDto reservedto=medimyPageservice.myreservedetail(alldto);
			
			model.addAttribute("hosdto", hosdto);
			model.addAttribute("docdto", docdto);
			model.addAttribute("reservedto", reservedto);
			return "myreservedetail.tiles";
		}
		
		//예약취소
		@ResponseBody
		@RequestMapping(value="myresevecancel.do", method={RequestMethod.GET, RequestMethod.POST})
		public Map<String, Object> myresevecancel(MediAppointmentNeedDto alldto,Model model) throws Exception{
			logger.info("MediAppointmentController resevecancel " + new Date());
			Map<String, Object> map=new HashMap<String, Object>();
			MediAppointmentNeedDto yes=new MediAppointmentNeedDto();
			
			boolean isS=medimyPageservice.myresevecancel(alldto);
			if (isS) {
				yes.setMessage("yes");
			}else {
				yes.setMessage("no");
			}
			map.put("yes",yes.getMessage());
			return map;
		}
		/*건강상담 삭제*/
		@ResponseBody
		@RequestMapping(value="myconsultingdelete.do", method={RequestMethod.GET, RequestMethod.POST})
		public int myconsultingdelete(MediConsultingAllDto dto,Model model) throws Exception{
			logger.info("MediAppointmentController myconsultingdelete " + new Date());
			
			System.out.println("=!!!!!!!!!!!!!======================================"+dto.getMem_seq());
			System.out.println("=!!!!!!!!!!!!!======================================"+dto.getSeq());
			
			boolean iss = medimyPageservice.mybbsDelete(dto);
			int isS=0;
			if (iss) {
				isS=1;
			}else {
				isS=2;
			}
			return isS;	
		}
		/*건강상담수정*/
		@RequestMapping(value="Myconsultingupdate.do", method={RequestMethod.GET, RequestMethod.POST})
		public String myconsultingupdate(MediConsultingAllDto dto,Model model) throws Exception{
			logger.info("MediAppointmentController myconsultingupdate " + new Date());
		
			model.addAttribute("bbs", dto);
			return"Myconsultingupdate.tiles";
		}
		
		@ResponseBody
		@RequestMapping(value="MyconsultingupdateAf.do", method={RequestMethod.GET, RequestMethod.POST})
		public int MyconsultingupdateAf(MediConsultingAllDto dto,Model model) throws Exception{
			logger.info("MediAppointmentController MyconsultingupdateAf " + new Date());
			
			boolean flag = medimyPageservice.updateBbs(dto);
			int flag1=0;
			if(flag) {
				flag1=1;
			}else {
				flag1=2;
			}
			
			return flag1;
		}
}
