package com.shallwe.control;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;

@Controller
@RequestMapping(value = "/Lectures")
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

//	// 멤버 강의 조회 : 동일
//	@GetMapping(value = "/memberLecture")
//	public String memberLectureView() {
//		return "/memberLectureList";
//	}

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
	public ModelAndView memberLectureView(MemberLectureHistory mlth) {
		List<MemberLectureHistory> mlthlist = new ArrayList<>();
		Member mem = new Member();
		mem.setMember_id("member2");
		mlth.setMember(mem);
		ModelAndView mnv = new ModelAndView();
		try {
			mlthlist = service.memberLectureList(mlth);
			System.out.println("테스트" + mlthlist);
			mnv.addObject("mlthlist", mlthlist);
			mnv.setViewName("/memberLectureList");
			mnv.addObject("status", "success");
		} catch (FindException e) {
			mnv.addObject("status", "fail");
			mnv.addObject("errMsg", e.getMessage());
		}
		return mnv;
	}

	// 강의 상세 조회 : 동일
	@GetMapping(value = "/detail")
//	public String detailView() {
//		return "/lectureDetail";
//	}
	public ModelAndView detailView(LectureDetail lectDe) {
		ModelAndView mnv = new ModelAndView();
		try {
			lectDe = service.lectureDetailView(lectDe.getLecture());
			mnv.addObject("lectDe", lectDe);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e) {
			e.printStackTrace();
		}

		return mnv;
	}
}
