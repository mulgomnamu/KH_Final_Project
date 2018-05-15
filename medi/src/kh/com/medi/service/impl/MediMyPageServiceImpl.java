package kh.com.medi.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.medi.dao.MediMyPageDao;
import kh.com.medi.model.MediAppointmentDto;
import kh.com.medi.model.MediAppointmentNeedDto;
import kh.com.medi.model.MediConsultingAllDto;
import kh.com.medi.model.MediConsultingAnswerDto;
import kh.com.medi.model.MediConsultingQuestionDto;
import kh.com.medi.model.MediDoctorDto;
import kh.com.medi.model.MediMemberDto;
import kh.com.medi.model.MediMember_hDto;
import kh.com.medi.model.MediMyListPagingDto;
import kh.com.medi.model.MediQnaBbsDto;
import kh.com.medi.model.MediQnaBbsParamDto;
import kh.com.medi.service.MediMyPageService;

@Service
public class MediMyPageServiceImpl implements MediMyPageService {
	
	@Autowired
	private MediMyPageDao mediMyPageDao;
	
	@Override
	public MediMemberDto Mydetail(MediMemberDto my) throws Exception {
		return mediMyPageDao.Mydetail(my);
	}

	@Override
	public boolean myUpate(HashMap<String, Object> mep) throws Exception {
		return mediMyPageDao.myUpate(mep);
	}

	@Override
	public MediMemberDto myup(MediMemberDto my) throws Exception {
		return mediMyPageDao.myup(my);
	}

	@Override
	public boolean mypwdupdate(HashMap<String, Object> mep) throws Exception {
		return mediMyPageDao.mypwdupdate(mep);
	}

	@Override
	public boolean mydelete(HashMap<String, Object> mep) throws Exception {
		
		return mediMyPageDao.mydelete(mep);
	}
	
	@Override
	public int getBbsCount(MediQnaBbsParamDto mylist) throws Exception {
		return mediMyPageDao.getBbsCount(mylist);
	}

	@Override
	public List<MediQnaBbsDto> getBbsPagingList(MediQnaBbsParamDto mylist) throws Exception {
	    return mediMyPageDao.getBbsPagingList(mylist);
	}

	@Override

	public List<MediConsultingQuestionDto> getconPagingList(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.getconPagingList(alldto);
	}

	@Override
	public int getBbsCount1(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.getBbsCount1(alldto);
	}

	@Override
	public MediConsultingQuestionDto getBbsDetail(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.getBbsDetail(dto);
	}

	@Override
	public List<MediConsultingAnswerDto> answerlist(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.answerlist(alldto);
	}

	@Override
	public void readcountBbs(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		mediMyPageDao.readcountBbs(dto);
	}

	public boolean checkPhone(MediMemberDto my) throws Exception {
		return mediMyPageDao.checkPhone(my);
	}

	@Override
	public boolean checkEmail(MediMemberDto my) throws Exception {
		return mediMyPageDao.checkEmail(my);
	}

	@Override
	public List<MediAppointmentDto> relist(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.relist(dto);
	}

	@Override
	public int getanswerlistCount(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.getanswerlistCount(alldto);
	}

	@Override
	public MediAppointmentDto myreservedetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.myreservedetail(alldto);
	}

	@Override
	public MediDoctorDto mygetdocdetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.mygetdocdetail(alldto);
	}

	@Override
	public MediMember_hDto mygethospitaldetail(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.mygethospitaldetail(alldto);
	}

	@Override
	public boolean myresevecancel(MediAppointmentNeedDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.myresevecancel(alldto);
	}

	@Override
	public boolean mybbsDelete(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.mybbsDelete(dto);
	}
	@Override
	public boolean updateBbs(MediConsultingAllDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.updateBbs(dto);
	}
	@Override
	public boolean selected(MediConsultingAnswerDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.selected(dto);
	}

	@Override
	public boolean selectyn(MediConsultingAnswerDto dto) throws Exception {
		return mediMyPageDao.selectyn(dto);
	}
	
	@Override
	public void plusscore(MediConsultingAllDto dto) throws Exception {
		mediMyPageDao.plusscore(dto);
	}
	@Override
	public MediConsultingAnswerDto answerdetail(MediConsultingAllDto alldto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.answerdetail(alldto);
	}
	@Override
	public MediQnaBbsDto getQnADetail(MediQnaBbsDto dto) throws Exception {
		return mediMyPageDao.getQnADetail(dto);
	}
	@Override
	public boolean QnAupdateBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.QnAupdateBbs(dto);
	}
	@Override
	public boolean QnAdeleteBbs(MediQnaBbsDto dto) throws Exception {
		// TODO Auto-generated method stub
		return mediMyPageDao.QnAdeleteBbs(dto);
	}

}
