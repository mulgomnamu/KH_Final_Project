package kh.com.medi.controller;

import java.util.Calendar;
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
import org.springframework.web.bind.annotation.ResponseBody;

import kh.com.medi.aop.CalendarUtil;
import kh.com.medi.aop.myCal;
import kh.com.medi.model.MediAppointmentDto;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediDoctorSchedulDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediSpecialtyDto;
import kh.com.medi.model.MediSubjectDto;
import kh.com.medi.service.MediAppointmentService;
import kh.com.medi.service.MediMemberService;

@Controller
public class MediAppointmentController {
	
	private static final Logger logger = LoggerFactory.getLogger(MediAppointmentController.class);
	
	@Autowired
	private MediAppointmentService mediAppointmentService;
	
	
	@RequestMapping(value="appointment.do", method={RequestMethod.GET, RequestMethod.POST})
	public String changeplz(myCal jcal,Model model,MediAppointmentNeedDto alldto) throws Exception{
		logger.info("MediAppointmentController appointment " + new Date());
		jcal.calculate();
		model.addAttribute("todetail", alldto.getName());
		model.addAttribute("jcal", jcal);
		return "appointment.tiles";
	}
	//병원명으로검색해서가져오는곳
	@ResponseBody
	@RequestMapping(value="serchhospital.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> serchhospital(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController serchhospital " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		List<MediMember_hDto> hospitallist=mediAppointmentService.getserchhospitalList(alldto);
		
		String yn="";
		if (hospitallist.size()==0||hospitallist==null) {
			yn="no";
		}else {
			yn="yes";
		}
		map.put("hospitallist",hospitallist);
		map.put("yn",yn);
		return map;
	}		
	//병원 seq로 그병원에 의사들데이터가져오기
	@ResponseBody
	@RequestMapping(value="getdoctor.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getdoclist(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController getdoclist " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		
		MediMember_hDto selecthos=mediAppointmentService.gethospitaldetail(alldto);
		List<MediDoctorDto> getdoclist=mediAppointmentService.getdoclist(alldto);
		map.put("getdoclist",getdoclist);
		map.put("name",selecthos.getName());
		map.put("tel",selecthos.getTel());	//메인사진은나중다른dto에서받아와야한다
		map.put("address",selecthos.getAddress());
		return map;
	}
	//의사seq로 그의사의 스케쥴가져오기
	@ResponseBody
	@RequestMapping(value="getscadule.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> getscadule(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController getscadule " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		myCal jcal=new myCal();
		jcal.calculate();
		int dayOfWeek = jcal.getDayOfWeek();
		int lastDayOfMonth = jcal.getLastDay();
		int year = jcal.getYear();
		int month =jcal.getMonth();
		Calendar cal = Calendar.getInstance();
		int today=cal.get(Calendar.DATE);
		int nowmon=cal.get(Calendar.MONTH)+1;
		cal.set(year, month-1, 1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<MediDoctorSchedulDto> canlist=mediAppointmentService.getdocscedulelist(alldto);
		MediDoctorDto selectdoc=mediAppointmentService.getdocdetail(alldto);
		String months=CalendarUtil.two(jcal.getMonth());
		for (int i = 0; i < canlist.size(); i++) {
		System.out.println(canlist.get(i).toString());	
		}
		
		map.put("dayOfWeek",dayOfWeek);
		map.put("lastDayOfMonth",lastDayOfMonth);
		map.put("year",year);
		map.put("month",months);
		map.put("today",today);
		map.put("nowmon",nowmon);
		map.put("lastDay",lastDay);
		map.put("canlist",canlist);
		map.put("name",selectdoc.getName());
		map.put("specialty",selectdoc.getSpecialty());
		map.put("doc_profile",selectdoc.getDoc_profile());
		return map;
	}
	//캘린더에서다음달이나 저번달갈때
	@ResponseBody
	@RequestMapping(value="monnext.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> monnext(MediAppointmentNeedDto alldto,myCal chcal,Model model) throws Exception{
		logger.info("MediAppointmentControll monnext " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		chcal.calculate();
		int dayOfWeek = chcal.getDayOfWeek();
		int lastDayOfMonth = chcal.getLastDay();
		int year = chcal.getYear();
		int month =chcal.getMonth()+1;
		Calendar cal = Calendar.getInstance();
		int today=cal.get(Calendar.DATE);
		int nowmon=cal.get(Calendar.MONTH)+1;
		cal.set(year, month-1, 1);
		int lastDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
		List<MediDoctorSchedulDto> canlist=mediAppointmentService.getdocscedulelist(alldto);
		MediDoctorDto selectdoc=mediAppointmentService.getdocdetail(alldto);
		String months=CalendarUtil.two(chcal.getMonth());
		map.put("dayOfWeek",dayOfWeek);
		map.put("lastDayOfMonth",lastDayOfMonth);
		map.put("year",year);
		map.put("month",months);
		map.put("nowmon",nowmon);
		map.put("today",today);
		map.put("lastDay",lastDay);
		map.put("canlist",canlist);
		map.put("name",selectdoc.getName());
		map.put("specialty",selectdoc.getSpecialty());
		map.put("doc_profile",selectdoc.getDoc_profile());
		return map;
	}	
	//실질적으로 예약되는곳
	@ResponseBody		
	@RequestMapping(value="reserve.do", method= {RequestMethod.POST,RequestMethod.GET})
	public Map<String, Object> checkreserve(MediAppointmentNeedDto alldto,HttpServletRequest req,Model model)throws Exception {
		logger.info("MediAppointmentController checkreserve" + new Date());
		MediAppointmentNeedDto yes=new MediAppointmentNeedDto();
		
		String _day=alldto.getDay().substring(0, 8);
		String _time=alldto.getDay().substring(8, 12)+"00";
		alldto.setDay(_day);
		alldto.setTime(_time);
	
		//mem_seq취득 
		int seq=((MediMemberDto)req.getSession().getAttribute("login")).getSeq();
		alldto.setMem_seq(seq);
		//hos_seq취득
		MediDoctorDto docdto=mediAppointmentService.getdocdetail(alldto);
		alldto.setHos_seq(docdto.getHos_seq());
		
		boolean canreserve=mediAppointmentService.reserve(alldto);
		if (canreserve) {	//저장가능
			yes.setMessage("RESERVEYES");
		}else {
			yes.setMessage("RESERVENO");
		}
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("yes",yes.getMessage());
		map.put("day",alldto.getDay());
		map.put("time",alldto.getTime());
		map.put("mem_seq",alldto.getMem_seq());
		map.put("hos_seq",alldto.getHos_seq());
		map.put("doc_seq",alldto.getDoc_seq());
		return map;
	}
	//의사의 가능시간에서 예약된시간빼주는곳
	@ResponseBody
	@RequestMapping(value="cantime.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> cantime(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentControll cantime " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		String canttimes=mediAppointmentService.canttime(alldto);
		map.put("canttimes",canttimes);
		map.put("day",alldto.getDay());
		map.put("doc_seq",alldto.getDoc_seq());
		map.put("dayofweek",alldto.getMessage());
		return map;
	}	
	//디테일창으로넘어갈때
	@RequestMapping(value="reservedetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String reservedetail(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController reservedetail " + new Date());
		MediMember_hDto hosdto=mediAppointmentService.gethospitaldetail(alldto);
		MediDoctorDto docdto=mediAppointmentService.getdocdetail(alldto);
		MediAppointmentDto reservedto=mediAppointmentService.reservedetail(alldto);
		model.addAttribute("hosdto", hosdto);
		model.addAttribute("docdto", docdto);
		model.addAttribute("reservedto", reservedto);
		return "reservedetail.tiles";
	}
	//진료과목으로병원리스트검색하는곳
	@ResponseBody
	@RequestMapping(value="byspecialty.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> byspecialty(MediSubjectDto spedto,Model model) throws Exception{
		logger.info("MediAppointmentController byspecialty " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		System.out.println(spedto.toString());
		List<MediSubjectDto> hospitallist=mediAppointmentService.byspecialty(spedto);
		for (int i = 0; i < hospitallist.size(); i++) {
		System.out.println(hospitallist.get(i).getMedimember_hdto().toString());	
		}
		String yn="";
		if (hospitallist.size()==0||hospitallist==null) {
			yn="no";
		}else {
			yn="yes";
		}
		map.put("hospitallist",hospitallist);
		map.put("yn",yn);
		return map;
	}		
	//의사명으로검색해서가져오는곳
	@ResponseBody
	@RequestMapping(value="doclist.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> doclist(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController doclist " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		List<MediDoctorDto> doclist=mediAppointmentService.doclist(alldto);
		
		String yn="";
		if (doclist.size()==0||doclist==null) {
			yn="no";
		}else {
			yn="yes";
		}
		map.put("doclist",doclist);
		map.put("yn",yn);
		return map;
	}
	//의사명으로검색해서가져오는곳
	@ResponseBody
	@RequestMapping(value="hosdto.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> hosdto(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController hosdto " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		
		MediMember_hDto hosdto=mediAppointmentService.gethospitaldetail(alldto);
		
		map.put("hosdto",hosdto);
		return map;
	}
	//예약취소
	@ResponseBody
	@RequestMapping(value="resevecancel.do", method={RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> resevecancel(MediAppointmentNeedDto alldto,Model model) throws Exception{
		logger.info("MediAppointmentController resevecancel " + new Date());
		Map<String, Object> map=new HashMap<String, Object>();
		MediAppointmentNeedDto yes=new MediAppointmentNeedDto();
		
		boolean isS=mediAppointmentService.resevecancel(alldto);
		if (isS) {
			yes.setMessage("yes");
		}else {
			yes.setMessage("no");
		}
		map.put("yes",yes.getMessage());
		return map;
	}
}
