package com.shallwe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.dao.MemberLectureHistoryDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.MemberLectureHistory;


@Service(value = "lectureService")
public class LectureService {

	@Autowired
	LectureDAO lectureDAO;
	@Autowired
	LectureDetailDAO lectureDetailDAO;
	@Autowired
	MemberLectureHistoryDAO memberLectureHistoryDAO;

	/**
	 * @author Soojeong
	 * @강의 검색 searchKey = {"0:all", "1:tutor_name", "2:lecture_title" , "3:category"
	 *     };
	 * @Param searchKey, searchText 담은 HashMap<String, Object>
	 * @return List<Lecture>
	 * @throws FindException
	 */
	public ModelAndView searchLecture(HashMap<String, Object> map) throws FindException {
		List<Lecture> list = new ArrayList<>();
		ModelAndView modelAndView = new ModelAndView();

		try {
			list = lectureDAO.selectLectureListBySearch(map);

			modelAndView.addObject("list", list);
			modelAndView.addObject("status", "success");

		} catch (FindException e) {
			modelAndView.addObject("status", "fail");
			modelAndView.addObject("errMsg", e.getMessage());
		}

		return modelAndView;
		
	}
	
	//강의 등록 : 동일
	@Transactional
	public void insertLecture(Lecture lect, LectureDetail lectDe) throws AddException {
		try {
			lectureDAO.insert(lect);
			lectureDetailDAO.insertDetail(lectDe);
		} catch (AddException e) {
			e.printStackTrace();
		}
	}
	
	//수강 강의 조회 : 동일
	public List<MemberLectureHistory> memberLectureList(MemberLectureHistory mlth) throws FindException{
		return memberLectureHistoryDAO.memberMyClassList(mlth);
	}
	
	//강의 상세 조회 : 동일
	public LectureDetail lectureDetailView(Lecture lect) throws FindException {
		return lectureDetailDAO.lectureDetailView(lect);
	}
	
	/**
	 * 강의신청 후 결제
	 * 
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws AddException
	 */
	public ModelAndView insertMemberLectureHistory(HashMap<String, Object> map) throws AddException {
		ModelAndView modelAndView = new ModelAndView();

		try {
			lectureDAO.insertMemberLectureHistory(map);
			modelAndView.addObject("status", "success");

		} catch (AddException e) {
			modelAndView.addObject("status", "fail");
			modelAndView.addObject("errMsg", e.getMessage());
		}

		return modelAndView;
	}

	/**
	 * 강의결제취소
	 * 
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws ModifyException
	 */
	public ModelAndView updateMemberLectureHistory(HashMap<String, Object> map) throws ModifyException {
		ModelAndView modelAndView = new ModelAndView();

		try {
			lectureDAO.updateMemberLectureHistory(map);
			modelAndView.addObject("status", "success");

		} catch (ModifyException e) {
			modelAndView.addObject("status", "fail");
			modelAndView.addObject("errMsg", e.getMessage());
		}

		return modelAndView;
	}
	

}
