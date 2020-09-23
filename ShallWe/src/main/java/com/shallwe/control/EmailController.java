package com.shallwe.control;

import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSendException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.Email.Email;
import com.shallwe.Email.EmailSender;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.service.MemberSerivce;
import com.shallwe.vo.Member;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/email")
public class EmailController {
	
	@Autowired private EmailSender emailSender;
	@Autowired private Email email;
	@Autowired private MemberSerivce service;
	
	
	//이메일 아이디 찾기 : 경찬
	@RequestMapping(value="/idEmailCheck",method = RequestMethod.POST)
	public ModelAndView idCheck(@RequestParam Map<String, Object> member, ModelMap model){
		
		ModelAndView modelAndView = new ModelAndView();
		
		String member_email = (String)member.get("member_email");
		String member_name =(String) member.get("member_name");
			
		try {
			
			String checkId = service.memberIdCheck(member);
		
			if (checkId != null) {
				
				email.setContent("아이디는" + checkId + " 입니다");
				email.setReceiver(member_email);
				email.setSubject(member_name+"님 비밀번호 찾기 메일입니다.");
				emailSender.SendEmail(email);
				
				modelAndView.setViewName("/success");
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			modelAndView.setViewName("/fail");
			modelAndView.addObject("errorMsg", e.getMessage());
			
		}	
		return modelAndView;
	}
	
	//비밀번호 난수(랜덤):경찬
	@RequestMapping(value="randomPwd",method = RequestMethod.POST)
	public String randomPwd(@RequestParam Map<String,Object>member1,Member member, HttpSession session) {
		
		log.info("비밀번호 난수값:"+member1);
		
		Random random = new Random();
		int randomNumber = random.nextInt(89999)+10000;
		String newPassword = "bapsi" + Integer.toString(randomNumber);
		String member_name = (String)member1.get("member_name");
		String member_email = (String)member1.get("member_email");
		member.setMember_pwd(newPassword);
	
		try {
			service.randomPassword(member1,member);
			
		} catch (ModifyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/success";
	}
	
	//이메일 비밀번호 찾기:경찬
	@RequestMapping(value="pwdEmailCheck",method= RequestMethod.POST)
	public ModelAndView pwdCheck(@RequestParam Map<String,Object>member,ModelMap model) {
		
		ModelAndView modelAndView = new ModelAndView();
		String url = "http://localhost/shallwe/";
		String member_name = (String)member.get("member_name");
		String member_email = (String)member.get("member_email");
		try {
			
			String pwdCheck = service.memberpwdCheck(member);
			
			if (pwdCheck != null) {
				
				email.setContent("임시비밀번호" + pwdCheck + " 입니다" + " 비밀번호를 변경하실려면 링크를 따라가서 로그인 부터해주세요 "+ url);
				email.setReceiver(member_email);
				email.setSubject(member_name+"님 비밀번호 찾기 메일입니다.");
				emailSender.SendEmail(email);
				
				modelAndView.setViewName("/success");
				
			}
		} catch (Exception e) {
			
			e.printStackTrace();
			modelAndView.setViewName("/fail");
			modelAndView.addObject("errorMsg",e.getMessage());
		}
		
		return modelAndView;
		
		}
}
