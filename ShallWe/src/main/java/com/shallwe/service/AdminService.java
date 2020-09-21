package com.shallwe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.FaqDAO;
import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.MemberDAO;
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.Faq;
import com.shallwe.vo.Lecture;
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
		
		if(!status.equals("승인")){
			// email로 반려 사유보내주기
		}
	}
	
	public List<Lecture> ShowTutorLectureByTutorId(String tutor_id) throws FindException{
		Member member = new Member();
		Tutor tutor = new Tutor();
		member.setMember_id(tutor_id);
		tutor.setMember(member);
		Lecture lecture = new Lecture();
		lecture.setTutor(tutor);
		
		return lectureDAO.tutorMyClassList(lecture);
	}
	
	/**
	 * FAQ 목록 보여주기
	 * @return 전체 FAQ 목록
	 * @throws FindException
	 */
	public List<Faq> showAllFaq() throws FindException{
		return faqDAO.selectAll();
	}
	
}
