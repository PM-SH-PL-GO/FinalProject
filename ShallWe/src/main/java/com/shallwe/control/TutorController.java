package com.shallwe.control;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.service.TutorService;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping(value = "/tutor")
@RequiredArgsConstructor
public class TutorController {
	// 회원 : 강사 신청
	// 강사 : 내 강사 정보 조회
	
	@Autowired private TutorService service;
	
	//강사정보 보가: 경찬
	@GetMapping(value="showTutor")
	public ModelAndView showTutorInfo(HttpSession session) throws FindException {
		
		String member_id = (String)session.getAttribute("loginInfo");
//		String member_id = "championcom";
		Member member  = new Member();
		member.setMember_id(member_id);
		Tutor t = new Tutor();
		t.setMember(member);

		ModelAndView model = new ModelAndView();
		List<Tutor> tutor_id = new ArrayList<>();
		
		
		if (member_id == null) {
			
			throw new FindException("예외발생:로그인 안되어 있음");
			
		}
		try {
			
			tutor_id = service.showTutorInfo(t);
			model.setViewName("/tutorInfo");
			model.addObject("t", tutor_id);
			
		} catch (FindException e) {
			
			e.printStackTrace();
		}
		
		return model;
	}
}
