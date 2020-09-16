package com.shallwe.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.service.MemberSerivce;

@Controller(value = "/member")
public class MemberController {
	// 회원 : 내 정보 조회/수정, 강의 조회/신청/삭제
	// 
	
	@Autowired
	MemberSerivce service;
	
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(HttpSession session, @RequestParam(value="member_id")String member_id,
														 @RequestParam(value="member_pwd")String member_pwd
												   ) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		try {
			
			service.memberLogin(member_id, member_pwd);
			session.setAttribute("loginInfo", member_id);
			modelAndView.setViewName("/index");
			modelAndView.addObject("status","success");
			
		} catch (FindException e) {
			
			modelAndView.setViewName("/userLogin");
			modelAndView.addObject("errMsg",e.getMessage());
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	//멤버로그아웃
	@RequestMapping(value="/memberLogout")
	public ModelAndView memberLogout(HttpSession session,@RequestParam(value="member_id")String member_id) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		session.removeAttribute("loginInfo");
		modelAndView.addObject("status","success");
		modelAndView.setViewName("/userLogin");
		
		return modelAndView;
	
		
	}
	
	
}
