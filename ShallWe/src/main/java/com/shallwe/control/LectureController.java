package com.shallwe.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;

@Controller
@RequestMapping(value = "/Lectures")
public class LectureController {
	// 회원 : 강의 검색, 강의 세부정보 조회
	// 강사 : 강의 등록/수정/취소, 등록한 강의 조회
	@Autowired
	LectureService service;

	@RequestMapping(value = "/insert")
	public ModelAndView insertLecture(LectureDetail lectDe)
			throws AddException {
		ModelAndView mnv = new ModelAndView();
		try {
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
