package com.shallwe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<Member> showAllMember() throws FindException{
		return memberDAO.selectAllMember();
	}
	
	public void removeMemberById(String member_id) throws RemoveException{
		
	}
	
	
	/**
	 * 
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
	public void approvePreTutor(String id, String status) throws ModifyException{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("status", "Y");
		memberDAO.updateTutorState(map);
	}
	
	/**
	 * 예비강사 신청 반려하기
	 * @param tutor_id
	 * @param reject_reason
	 * @param reject_category_id
	 * @throws AddException
	 * @throws FindException 
	 */
	@Transactional(rollbackFor = {AddException.class, FindException.class})
	public void rejectPreTutor(String tutor_id, String reject_reason, String reject_category_id) throws AddException, FindException{
		
		List<LectureCategory> categoryList = tutorDAO.selectPreTutorById(tutor_id);
		
		TutorReject tutorReject = new TutorReject();
		RejectCategory rejectCategory = new RejectCategory();
		rejectCategory.setReject_category_id(reject_category_id);
		Tutor tutor = new Tutor();
		Member member = new Member();
		member.setMember_id(tutor_id);
		tutor.setMember(member);
		tutorReject.setReject_reason(reject_reason);
		tutorReject.setTutor(tutor);

		for (LectureCategory category : categoryList) {
			tutor.setLectureCategory(category);
			tutorReject.setRejectCategory(rejectCategory);
			
			memberDAO.insertTutorReject(tutorReject);
		}
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
//	@Transactional
	public void updateLectureStatusByIdAndStatus(Map<String, String> map) throws ModifyException{
		String status = map.get("status");
		
		if(status.equals("반려"))
			lectureDetailDAO.updateLectureRejectReason(map);
		else if(status.equals("복구"))
			map.put("status", "승인");
		else if (status.equals("취소승인"))
			map.put("status", "취소");
		else
			throw new ModifyException("승인/반려 이외의 글자가 전달되었습니다 : " + status);
		
		lectureDAO.updateLectureStatusByIdAndStatus(map);
	}
	
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
