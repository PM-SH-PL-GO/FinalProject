package com.shallwe.control;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {

//	@RequestMapping("/admin")
//	public void admin() {
//		System.out.println("admin 입장");
//	}
	
//	@RequestMapping(value = "/studyBoard", method = RequestMethod.GET)
//	public void studyBoard(Locale locale, Model model) {
//		System.out.println("studyBoard coming11");
//	}
	
	@RequestMapping(value = "/studyBoardWrite", method = RequestMethod.GET)
	public void studyBoardWrite(Locale locale, Model model) {
		System.out.println("studyBoardWrite coming");
	}
	
	@RequestMapping(value = "/studyBoardDetail", method = RequestMethod.GET)
	public void studyBoardDetail(Locale locale, Model model) {
		System.out.println("studyBoardDetail coming");
	}
	
//	@RequestMapping(value = "/faq", method = RequestMethod.GET)
//	public void faq(Locale locale, Model model) {
//		System.out.println("faq coming");
//	}
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
	@RequestMapping(value = "/freeboard", method = RequestMethod.GET)
	public void freeboard(Locale locale, Model model) {
		System.out.println("freeboard");
	}
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public void myinfo(Locale locale, Model model) {
		System.out.println("myinfo");
	}
	@RequestMapping(value = "/myinfoModi", method = RequestMethod.GET)
	public void myinfoModi(Locale locale, Model model) {
		System.out.println("myinfo");
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
	
}
