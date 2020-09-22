package com.shallwe.control;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

@Controller
@RequestMapping(value = "/Lectures")
public class LectureController {
	// 회원 : 강의 검색, 강의 세부정보 조회
	// 강사 : 강의 등록/수정/취소, 등록한 강의 조회
	@Autowired
	LectureService service;
	
	@GetMapping(value = "/insert")
	public String insertView() {
		return "/lectureRegistration";
	}
	
	@PostMapping(value = "/insert")
	public ModelAndView insertLecture(@ModelAttribute LectureDetail lectDe)
			throws AddException {
		ModelAndView mnv = new ModelAndView();
		try {
			System.out.println(lectDe.getLecture());
			service.insertLecture(lectDe.getLecture(), lectDe);
			mnv.setViewName("/success");
		} catch (AddException e) {
			e.printStackTrace();
			mnv.setViewName("/fail");
			mnv.addObject("errorMsg", e.getMessage());
		}
		return mnv;
	}
}
