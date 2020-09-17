package com.shallwe.control;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shallwe.dao.FaqDAO;
import com.shallwe.exception.FindException;
import com.shallwe.model.AdminPreTutorListBean;
import com.shallwe.model.FaqBean;
import com.shallwe.service.AdminService;
import com.shallwe.vo.Faq;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	AdminService adminService;

	@RequestMapping(value = "")
	public void admin() {
		System.out.println("야 보이냐?");
	}
	
	/**
	 * FAQ 조회
	 * @return ResponseEntity<List<Faq>>
	 */
	@RequestMapping(value = "/faq")
	public ResponseEntity<FaqBean> faq() {
		
		return null;
	}
	@RequestMapping(value = "/preTutor")
	public void preTutor() {
		System.out.println("pre Tutor");
	}
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public void userList(Locale locale, Model model) {
		System.out.println("userList coming");
	}

	@RequestMapping(value = "/lectureList", method = RequestMethod.GET)
	public void lectureList(Locale locale, Model model) {
		System.out.println("lectureList coming");
	}

	@RequestMapping(value = "/memberLectureHistory", method = RequestMethod.GET)
	public void memberLectureHistory(Locale locale, Model model) {
		System.out.println("memberLectureHistory coming");
	}
}
