package com.shallwe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shallwe.Email.Email;
import com.shallwe.Email.EmailSender;
import com.shallwe.dao.FaqDAO;
import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.dao.MemberDAO;
import com.shallwe.dao.MemberLectureHistoryDAO;
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.AdminTutorBean;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.vo.Faq;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;
import com.shallwe.vo.RejectCategory;
import com.shallwe.vo.Tutor;
import com.shallwe.vo.TutorReject;

@Service(value = "adminService")
public class AdminService {
	@Autowired
	private TutorDAO tutorDAO;
	@Autowired
	private FaqDAO faqDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private LectureDAO lectureDAO;
	@Autowired
	private LectureDetailDAO lectureDetailDAO;
	@Autowired
	private MemberLectureHistoryDAO historyDAO;
	
	/**
	 * 전체 회원 목록 보여주기
	 * @return 전체 회원 목록
	 * @throws FindException
	 */
	public List<Member> showAllMember(int enabled) throws FindException{
		return memberDAO.selectAllMember(enabled);
	}
	
	public Member showMemberInfoById(String member_id) throws FindException{
		MemberInfoBean bean = memberDAO.selectById(member_id);
		Member member = new Member();
		member.setMember_email(bean.getMemberEmail());
		member.setMember_id(bean.getMemberId());
		member.setMember_name(bean.getMemberName());
		member.setMember_phone(bean.getMemberPhone());
		member.setMember_sex(bean.getMemberSex());
		if (bean.getTutorYN().equals("Y"))
			member.setTutor_YN("O");
		else
			member.setTutor_YN("X");

		List<LectureCategory> list = new ArrayList<>();
		list.add(bean.getFavorite1());
		list.add(bean.getFavorite2());
		list.add(bean.getFavorite3());
		
		member.setFavorite_list(list);
		
		return member;
	}
	
	/**
	 * 회원 유효성 변동(정지/복구)
	 * @author jun6
	 * @param map
	 * @throws ModifyException
	 */
	public void updateEnalbedMemberById(Map<String, String> map) throws ModifyException{
		memberDAO.updateEnabledById(map);
	}
	
	/**
	 * 특정 회원의 수강 목록 가져오기
	 * @author jun6
	 * @return
	 * @throws FindException
	 */
	public List<MemberLectureHistory> showMemberLectureHistory(String member_id) throws FindException{
		return historyDAO.selectHistroyByMemberId(member_id);
	}
	
	/**
	 * 예비/현 강사 목록 가져오기
	 * @author jun6
	 * @param YN
	 * @param preTutorPage
	 * @return
	 * @throws FindException
	 */
	@Transactional
	public AdminTutorBean showAllTutor(String YN) throws FindException{
		AdminTutorBean preTutorBean = new AdminTutorBean();
		Map<String, List<LectureCategory>> valueMap = new HashMap<>();
		
		List<Tutor> tutorList = new ArrayList<>();
		List<Tutor> list = tutorDAO.selectAllTutor(YN);
		
		for (Tutor tutor : list) {
			String tutor_id = tutor.getMember().getMember_id();
			if (valueMap.containsKey(tutor_id))
				valueMap.get(tutor_id).add(tutor.getLectureCategory());
			else {
				List<LectureCategory> catList = new ArrayList<>();
				catList.add(tutor.getLectureCategory());
				valueMap.put(tutor_id, catList);
				tutorList.add(tutor);
			}
		}
		
		preTutorBean.setTutorKeyList(tutorList);
		preTutorBean.setTutorCategoryMap(valueMap);
		
		return preTutorBean;
	}

	
	/**
	 * 예비강사 승인
	 * @param id
	 * @param status
	 * @throws ModifyException
	 */
	public void approvePreTutor(String id, String status, String category) throws Exception{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("status", "Y");
		memberDAO.updateTutorState(map);
		
		MemberInfoBean bean = memberDAO.selectById(id);
		
		String approveCat = "";
		
		for (String cat : category.split("<br>"))
			approveCat += " • " + cat;
		
		String emailContent = "강사 신청 결과 안내\r\n" + 
				"Shall We에서 새로운 도전을 하신 " + bean.getMemberName() + " 고객님을 응원합니다!\r\n\"" +  
				"신청하신 강사 등록 건이 아래와 같이 처리되었음을 알려드립니다.\r\n" + 
				"\r\n" + 
				"1. 신청내용\r\n" + 
				" - 신규 강사 등록\r\n" + 
				"2. 분야\r\n" + 
				approveCat + "\r\n" + 
				"3. 신청 결과\r\n" + 
				" - 승인";
		String email = bean.getMemberEmail();
		
		sendMail("강사", emailContent, email);
	}
	
	/**
	 * 예비강사 신청 반려하기
	 * @param tutor_id
	 * @param reject_reason
	 * @param reject_category_id
	 * @throws AddException
	 * @throws FindException 
	 */
	@Transactional(rollbackFor = Exception.class)
	public void rejectPreTutor(String tutor_id, String reject_reason, String reject_category_id, String category) throws Exception{
		category = category.replaceAll(" ", "");
		String[] catArr = category.split("<br>");
		
		Tutor tutor = new Tutor();
		Member member = new Member();
		member.setMember_id(tutor_id);

		TutorReject tutorReject = new TutorReject();
		RejectCategory rejectCategory = new RejectCategory();
		rejectCategory.setReject_category_id(reject_category_id);
		tutorReject.setRejectCategory(rejectCategory);
		tutorReject.setReject_reason(reject_reason);
		
		tutor.setMember(member);
		tutor.setTutorReject(tutorReject);
		String cancelCat = "";
		
		for (String cat : catArr) {
			LectureCategory lectureCategory = new LectureCategory();
			lectureCategory.setLecture_category_name(cat);
			tutor.setLectureCategory(lectureCategory);
			
			memberDAO.insertTutorReject(tutor);
			cancelCat += " • " + cat + "\r\n";
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("status", "N");
		map.put("id", tutor_id);
		memberDAO.updateTutorState(map);
		
		MemberInfoBean bean = memberDAO.selectById(tutor_id);
		
		
		String email = bean.getMemberEmail();
		String mailContent = "강사 신청 결과 안내\r\n" + 
				"Shall We에서 새로운 도전을 하신 " + bean.getMemberName() + " 고객님을 응원합니다!\r\n\"" +  
				"신청하신 강사 등록 건이 아래와 같이 처리되었음을 알려드립니다.\r\n" + 
				"\r\n" + 
				"1. 신청내용\r\n" + 
				" • 신규 강사 등록\r\n" + 
				"2. 분야\r\n" + 
				cancelCat + 
				"3. 신청 결과\r\n" + 
				" • 반려\r\n" +
				"4. 반려 사유\r\n" + 
				" • " + reject_reason;
		
		sendMail("강사", mailContent, email);
	}
	
	
	@Autowired
	Email email;
	@Autowired
	EmailSender mailSender;
	
	/**
	 * 강사 승인/반려 정보 메일로 보내주기
	 * @param mailContent
	 * @param mailReceiver
	 * @throws Exception
	 */
	public void sendMail(String tutorOrLecture, String mailContent, String mailReceiver) throws Exception {
		email.setContent(mailContent);
		email.setReceiver(mailReceiver);
		email.setSubject("[Shall We?] " + tutorOrLecture + "신청 결과 안내");
		mailSender.SendEmail(email);
	}
	
	
	/**
	 * 특정 강사의 강의 목록 가져오기
	 * @author jun6
	 * @param 강사 id
	 * @return 그 강사의 강의 목록
	 * @throws FindException
	 */
	public List<Lecture> showTutorLectureByTutorId(String tutor_id) throws FindException{
		Member member = new Member();
		Tutor tutor = new Tutor();
		member.setMember_id(tutor_id);
		tutor.setMember(member);
		Lecture lecture = new Lecture();
		lecture.setTutor(tutor);
		
		return lectureDAO.tutorMyClassList(lecture);
	}
	
	/**
	 * 강의 전체 목록 가져오기
	 * @author jun6
	 * @return 강의 전체 목록
	 * @throws FindException
	 */
	public List<Lecture> showAllLectures() throws FindException{
		return lectureDAO.selectAllLectures();
	}
	
	/**
	 * 강의 승인/반려하기
	 * @author jun6
	 * @param lecture_id
	 * @param status
	 * @throws ModifyException
	 */
	@Transactional
	public void updateLectureStatusByIdAndStatus(Map<String, String> map) throws Exception{
		String status = map.get("status");
		
		String mailReceiver = tutorDAO.selectTutorEmailByLectureId(map.get("lecture_id"));
		String mailContent= "강의 신청 결과 안내\r\n" + 
				"Shall We에서 새로운 도전을 하신  고객님을 응원합니다!\r\n\"" +  
				"신청하신 강의 등록 건이 아래와 같이 처리되었음을 알려드립니다.\r\n" + 
				"\r\n" + 
				"1. 신청내용\r\n" + 
				" • 강의 등록\r\n" + 
				"2. 분야\r\n";
		
		if(status.equals("반려")) {
			String rejectReason = map.get("reject_reason");
			lectureDetailDAO.updateLectureRejectReason(map);
			mailContent += "3. 신청 후 강의 상태\r\n • " + status + "\r\n";
			mailContent += "4. 반려 사유\r\n • " + rejectReason;
		}
		else if(status.equals("복구")) {
			map.put("status", "승인");
			mailContent += "3. 신청 후 강의 상태\r\n • " + status + "\r\n";
		}
		else if (status.equals("취소승인")) {
			map.put("status", "취소");
			mailContent += "3. 신청 후 강의 상태\r\n • " + status + "\r\n";
		}
		else if (status.equals("승인")) {
			map.put("status", "승인");
			mailContent += "3. 신청 후 강의 상태\r\n • " + status + "\r\n";
		}else	
			throw new ModifyException("승인/반려 이외의 글자가 전달되었습니다 : " + status);
		
		lectureDAO.updateLectureStatusByIdAndStatus(map);
		
		sendMail("강의", mailContent, mailReceiver);
	}
	
	/**
	 * 특정 강의 수강 중인 회원 목록 가져오기
	 * @author jun6
	 * @param lecture_id
	 * @return
	 * @throws FindException
	 */
	public List<MemberLectureHistory> showMemberHistoryByLectureId(String lecture_id) throws FindException{
		return historyDAO.selectMemberHistoryByLectureId(lecture_id);
	}
	
	/**
	 * 강의 취소/반려 사유 조회하기
	 * @author jun6
	 * @param lecture_id
	 * @param 취소인지 반려인지
	 * @return 취소/반려된 사유
	 * @throws FindException
	 */
	public LectureDetail showLectureReason(String lecture_id, String rejectOrCancel) throws FindException{
		if (rejectOrCancel.equals("반려사유"))
			rejectOrCancel = "reject_reason";
		else if(rejectOrCancel.equals("취소사유") || rejectOrCancel.equals("취소정보"))
			rejectOrCancel = "cancel_reason";
		
		Map<String, String> map = new HashMap<>();
		map.put("lecture_id", lecture_id);
		map.put("rejectOrCancel", rejectOrCancel);
		
		return lectureDetailDAO.selectLectureReasonById(map);
	}
	
	/**
	 * FAQ 목록 보여주기
	 * @author jun6
	 * @return 전체 FAQ 목록
	 * @throws FindException
	 */
	public List<Faq> showAllFaq() throws FindException{
		return faqDAO.selectAll();
	}
	
	/**
	 * 특정 FAQ 내용 조회
	 * @param faq_id
	 * @return FAQ
	 * @throws FindException
	 */
	public Faq selectFaqById(String faq_id) throws FindException{
		return faqDAO.selectFaqById(faq_id);
	}
	
	/**
	 * FAQ 새로 추가
	 * @param faq
	 * @throws AddException
	 */
	public void addFaq(Faq faq) throws AddException{
		faqDAO.insertFaq(faq);
	}
	
	/**
	 * FAQ 수정
	 * @param faq
	 * @throws ModifyException
	 */
	public void updateFaq(Faq faq) throws ModifyException{
		faqDAO.updateFaq(faq);
	}
	
	/**
	 * FAQ 삭제
	 * @param faq_id
	 * @throws RemoveException
	 */
	public void deleteFaq(String faq_id) throws RemoveException{
		faqDAO.deleteFaq(faq_id);
	}
}
