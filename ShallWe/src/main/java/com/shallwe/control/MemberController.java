package com.shallwe.control;

import java.util.Locale;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.service.MemberSerivce;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/member/*")
@Log4j
public class MemberController {
	
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	// 회원 : 내 정보 조회/수정, 강의 조회/신청/삭제
	@Autowired
	MemberSerivce service;

	//회원가입get방식 : 상하
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String getSignup(Locale locale, Model model)throws Exception {
		System.out.println("get signup controller connected");
		
		return "/signup";
	}
	// 회원가입post방식: 상하
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	@ResponseBody
	public String postSignup(MemberInfoBean mib) throws AddException {
		Logger.info("post sign up controller connected");
		service.memberJoin(mib);
		return "success";
	}

//	//아이디 중복체크: 상하
//	public int memberChkId(MemberInfoBean mib) {
//		int result = 0;
//		String col = null;
//		col="memberId";
//		MemberInfoBean userIdCheck = service.getMemberId(mib.getMemberId(), col);
//		if(userIdCheck != null) {
//			result=2;
//		}
////		if(result<2) {
////			result=service.memberJoin(mib);
////		}
//		return result;
//	}
	@ResponseBody
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
	public ModelAndView memberLogout(HttpSession session) {
		
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
