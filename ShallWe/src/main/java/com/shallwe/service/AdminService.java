package com.shallwe.service;

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
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.vo.Faq;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

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
	 * 예비 강사 목록 보여주기
	 * @author jun6
	 */
	public List<Tutor> showAllTutor(String YN) throws FindException{
		return tutorDAO.selectAllTutor(YN);
	}
	
	/**
	 * 예비강사 승인/반려
	 * @param id
	 * @param status
	 * @throws ModifyException
	 */
	public void approvePreTutor(String id, String status) throws ModifyException{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		if (status.equals("승인"))
			map.put("status", "Y");
		else if(status.equals("반려"))
			map.put("status", "N");
		else
			throw new ModifyException("승인/반려 이외의 글자가 전달되었습니다 : " + status);
		
		memberDAO.updateTutorState(map);
		
		if(status.equals("반려")){
			// email로 반려 사유보내주기
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
	 * 특정 강의 상세정보 가져오기
	 * @author jun6
	 * @param 강의 ID
	 * @return 강의 상세 정보
	 * @throws FindException
	 */
//	public LectureDetail showLectureDetailById(String lecture_id) throws FindException{
//		return lectureDetailDAO.selectLectureDetailById(lecture_id);
//	}
	
	/**
	 * 강의 승인/반려하기
	 * @author jun6
	 * @param lecture_id
	 * @param status
	 * @throws ModifyException
	 */
	@Transactional
	public void updateLectureStatusByIdAndStatus(String lecture_id, String status, String reject_reason) throws ModifyException{
		Map<String, String> map = new HashMap<>();
		map.put("lecture_id", lecture_id);
		
		if (status.equals("승인"))
			map.put("status", status);
		else if(status.equals("반려")) {
			map.put("status", "반려");
			map.put("reject_reason", reject_reason);
			lectureDetailDAO.updateLectureRejectReason(map);
		}
		else if(status.equals("복구"))
			map.put("status", "승인");
		else if (status.equals("취소승인"))
			map.put("status", "취소");
		else
			throw new ModifyException("승인/반려 이외의 글자가 전달되었습니다 : " + status);
		
		lectureDAO.updateLectureStatusByIdAndStatus(map);
	}
	
	/**
	 * 강의 취소/반려 사유 조회하기
	 * @author jun6
	 * @param lecture_id
	 * @param 취소인지 반려인지
	 * @return 취소/반려된 사유
	 * @throws FindException
	 */
	public String showLectureReason(String lecture_id, String rejectOrCancel) throws FindException{
		return lectureDetailDAO.selectLectureReasonById(lecture_id, rejectOrCancel);
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
	
}
