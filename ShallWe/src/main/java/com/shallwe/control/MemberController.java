package com.shallwe.control;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.service.MemberSerivce;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member")
public class MemberController {
	// 회원 : 내 정보 조회/수정, 강의 조회/신청/삭제
	// 
	
	@Autowired
	MemberSerivce service;
	
	
	//멤버로그인:경찬
	@RequestMapping(value="/memberLogin")
	public ModelAndView memberLogin(HttpSession session, @RequestParam(value="member_id")String member_id,
														 @RequestParam(value="member_pwd")String member_pwd
												   ) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		try {
			
			service.memberLogin(member_id, member_pwd);
			session.setAttribute("loginInfo", member_id);
			modelAndView.setViewName("/success");
			modelAndView.addObject("status","success");
			
		} catch (FindException e) {
			
			modelAndView.setViewName("/fail");
			modelAndView.addObject("errMsg",e.getMessage());
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	//멤버로그아웃:경찬
	@RequestMapping(value="/memberLogout")
	public ModelAndView memberLogout(HttpSession session,@RequestParam(value="member_id")String member_id) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		session.removeAttribute("loginInfo");
		modelAndView.addObject("status","success");
		modelAndView.setViewName("/success");
		
		return modelAndView;
	
	}
	
	//비밀번호체인지(로그인x)
	@RequestMapping(value="/changePassword")
	public ModelAndView changePassword(@RequestParam Map<String,Object>member,Model model) {
		
		ModelAndView modelAndView = new ModelAndView();
		try {
			
			service.changePwd(member);
			modelAndView.setViewName("/success");
			
		} catch (ModifyException e) {
			modelAndView.setViewName("/fail");
			modelAndView.addObject("errMsg",e.getMessage());
			e.printStackTrace();
		}
		
		return modelAndView;
		
	}
	
	
}
