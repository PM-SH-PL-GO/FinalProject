package com.shallwe.control;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.MailSendException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.Email.Email;
import com.shallwe.Email.EmailSender;
import com.shallwe.exception.FindException;
import com.shallwe.service.MemberSerivce;

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
	public ModelAndView newPassword(@RequestParam Map<String, Object> member, ModelMap model){
		
		ModelAndView modelAndView = new ModelAndView();
		
		String member_email = (String)member.get("member_email");
		String member_name =(String) member.get("member_name");
		
		System.out.println("멤버이메일:" + member_email);
		System.out.println("멤버이름:"+ member_name);
		
		try {
			
			String checkId = service.memberIdCheck(member);
			log.info("컨트롤러:" + checkId);
		
			if (checkId != null) {
				
				email.setContent("아이디는" + checkId + " 입니다");
				email.setReceiver(member_email);
				email.setSubject(checkId+"님 비밀번호 찾기 메일입니다.");
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
	
	//이메일 비밀번호 찾기:경찬
}
