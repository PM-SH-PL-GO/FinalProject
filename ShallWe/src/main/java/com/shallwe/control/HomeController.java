package com.shallwe.control;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

	@RequestMapping({"/index", "/"})
	public String admin() {
		return "/index";
	}

	@RequestMapping("/customLogin")
	public void customLogin(String error, String logout, Model model) {
		log.info("error : " + error);
		log.info("logout : " + logout);
		
		if (error != null) 
			model.addAttribute("error", "Login error check your accout");
		
		if (logout != null) 
			model.addAttribute("logout", "Login error check your accout");
	}
	
	
	@RequestMapping(value = "/studyBoardWrite", method = RequestMethod.GET)
	public void studyBoardWrite(Locale locale, Model model) {
		System.out.println("studyBoardWrite coming");
	}
	
	@RequestMapping(value = "/studyBoardDetail", method = RequestMethod.GET)
	public void studyBoardDetail(Locale locale, Model model) {
		System.out.println("studyBoardDetail coming");
	}
	
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET)
	public void uerLogin(Locale locale, Model model) {
		System.out.println("userLogin");
	}
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public void idCheck(Locale locale, Model model) {
		System.out.println("idCheck");
	}
	@RequestMapping(value = "/instructor", method = RequestMethod.GET)
	public void instructor(Locale locale, Model model) {
		System.out.println("instructor");
	}
	@RequestMapping(value = "/topBar", method = RequestMethod.GET)
	public void topBar(Locale locale, Model model) {
		System.out.println("topBar");
	}
	
	@RequestMapping(value = "/wishlist", method = RequestMethod.GET)
	public void wishlist(Locale locale, Model model) {
		System.out.println("wishlist");
	}
	@RequestMapping(value = "/changePwd", method = RequestMethod.GET)
	public void chagePwd(Locale locale, Model model) {
		System.out.println("HOMECONTROL: changePwd");
	}
	
	@RequestMapping(value = "/memberLectureList", method = RequestMethod.GET)
	public void memberLectureList(Locale locale, Model model) {
		System.out.println("HOMECONTROL: memberLectureList");
	}
	
	@RequestMapping(value = "/tutorLectureList", method = RequestMethod.GET)
	public void tutorLectureList(Locale locale, Model model) {
		System.out.println("HOMECONTROL: tutorLectureList");
	}
	@RequestMapping(value="/tutorInfo",method = RequestMethod.GET)
	public void tutorInfo(Locale locale, Model model) {
		
	}
	@RequestMapping(value="/myinfoTutorInfo",method = RequestMethod.GET)
	public void myinfoTutorInfo(Locale locale, Model model) {
		System.out.println("myinfoTutorInfo");
	}
	
	@RequestMapping(value="/foot",method = RequestMethod.GET)
	public void foot(Locale locale, Model model) {
		System.out.println("foot");
	}
}
