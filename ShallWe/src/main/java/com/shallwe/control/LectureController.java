package com.shallwe.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;
import com.shallwe.vo.Tutor;

@Controller
@RequestMapping(value = "/lectures")
public class LectureController {
	// 회원 : 강의 검색, 강의 세부정보 조회
	// 강사 : 강의 등록/수정/취소, 등록한 강의 조회
	@Autowired
	LectureService service;

	// 강사 강의 등록 페이지 : 동일
	@GetMapping(value = "/insert")
	public String insertView() {
		return "/lectureRegistration";
	}

//	// 강사 강의 등록 : 동일
//	@PostMapping(value = "/insert")
//	public ModelAndView insertLecture(@ModelAttribute LectureDetail lectDe) throws AddException {
//		ModelAndView mnv = new ModelAndView();
//		try {
//			service.insertLecture(lectDe.getLecture(), lectDe);
//			mnv.setViewName("/success");
//		} catch (AddException e) {
//			e.printStackTrace();
//			mnv.setViewName("/fail");
//			mnv.addObject("errorMsg", e.getMessage());
//		}
//		return mnv;
//	}

	// 강의 조회 : 동일
	@RequestMapping(value = "/memberLecture")
	public ModelAndView memberLectureView(HttpSession session, MemberLectureHistory mlth) {
		String id = (String)session.getAttribute("loginInfo");
		List<MemberLectureHistory> mlthlist = new ArrayList<>();
		ModelAndView mnv = new ModelAndView();
		Member mem = new Member();
		mem.setMember_id(id);
		mlth.setMember(mem);
		try {
			mlthlist = service.memberLectureList(mlth);
			mnv.addObject("mlthlist", mlthlist);
			mnv.setViewName("/memberLectureList");
			mnv.addObject("status", "success");
		} catch (FindException e) {
			mnv.addObject("status", "fail");
			mnv.setViewName("/memberLectureList");
			mnv.addObject("errMsg", e.getMessage());
		}
		return mnv;
	}

	// 강의 상세 조회 : 동일
	@RequestMapping(value = "/detail")
	public ModelAndView detailView(HttpSession session, @RequestParam(value="lecture_id")Integer lecture_id) {
		String id = (String)session.getAttribute("loginInfo");
		ModelAndView mnv = new ModelAndView();
		Member mem = new Member();
		Tutor tuto = new Tutor();
		Lecture lect = new Lecture();
		Lecture lecttuto = new Lecture();
		LectureDetail lectDetuto = new LectureDetail();
		LectureDetail lectDetail = new LectureDetail();
		MemberLectureHistory mlth = new MemberLectureHistory();
		mem.setMember_id(id);
		tuto.setMember(mem);
		lecttuto.setTutor(tuto);
		lectDetuto.setLecture(lecttuto);
		mlth.setMember(mem);
		lect.setLecture_id(1);
		lectDetail.setLecture(lect);
		try {
			lectDetail = service.lectureDetailView(lecture_id);
			mnv.addObject("lectDetail", lectDetail);
			mnv.addObject("mlth", mlth);
			mnv.addObject("lectDetuto", lectDetuto);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e) {
			e.printStackTrace();
			mnv.setViewName("/lectureDetail");
		}

		return mnv;
	}
}
