package com.shallwe.control;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.AdminPreTutorBean;
//import com.shallwe.model.FaqBean;
import com.shallwe.service.AdminService;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	AdminService adminService;

	@RequestMapping(value = "")
	public void admin() {
		System.out.println("Admin Index");
	}
	
	/**
	 * FAQ 조회
	 * @return ResponseEntity<List<Faq>>
	 */
//	@RequestMapping(value = "/faq")
//	public ResponseEntity<FaqBean> faq() {
//		
//		return null;
//	}
	@RequestMapping(value = "/preTutor")
	public ModelAndView preTutor() {
		ModelAndView mnv = new ModelAndView();
		List<AdminPreTutorBean> adminTutorBeanList = new ArrayList<>();
		System.out.println("pre Tutor");
		try {
			adminTutorBeanList = adminService.showAllPreTutor();
			mnv.addObject("preTutorList", adminTutorBeanList);
		} catch (FindException e) {
			e.printStackTrace();
		}
		mnv.setViewName("/preTutor");
		
		return mnv;
	}
	
	@PatchMapping(value = "/status/{tutorId}")
	public ResponseEntity<String> statusChange(@PathVariable(value = "tutorId")String id, String status){
		try{
			adminService.approvePreTutor(id, status);
			return (ResponseEntity<String>) ResponseEntity.status(HttpStatus.OK).body("정상적으로 설정되었습니다");
		}catch(ModifyException e) {
			e.printStackTrace();
			return (ResponseEntity<String>) ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("설정에 실패하였습니다");
		}
		
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
