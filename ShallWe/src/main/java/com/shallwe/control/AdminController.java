package com.shallwe.control;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
//import com.shallwe.model.FaqBean;
import com.shallwe.service.AdminService;
import com.shallwe.vo.Faq;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.Tutor;

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
	 * 예비강사 목록 가져오기
	 * @author jun6
	 * @return
	 */
	@RequestMapping(value = "/preTutor")
	public ModelAndView preTutor() {
		ModelAndView mnv = new ModelAndView();
		List<Tutor> tutorList = new ArrayList<>();
		try {
			tutorList = adminService.showAllTutor("N");
			mnv.addObject("preTutorList", tutorList);
			mnv.setViewName("/preTutor");
		} catch (FindException e) {
			e.printStackTrace();
		}
		return mnv;
	}
	
	/**
	 * 전체 강사 목록 가져오기
	 * @author jun6
	 * @return
	 */
	@RequestMapping(value = "/tutorList")
	public ModelAndView tutorList() {
		ModelAndView mnv = new ModelAndView();
		List<Tutor> tutorList = new ArrayList<>();
		try {
			tutorList = adminService.showAllTutor("Y");
			mnv.addObject("preTutorList", tutorList);
			mnv.setViewName("/tutorList");
		} catch (FindException e) {
			e.printStackTrace();
		}
		return mnv;
	}
	
	/**
	 * 예비 강사 승인/반려
	 * @author jun6
	 * @param id
	 * @param status
	 * @return
	 */
	@PatchMapping(value = "/status/{tutorId}"
			//,consumes = {"application/json; charset=UTF-8"}
			)
	public ResponseEntity<String> statusChange(@PathVariable(value = "tutorId")String id, @RequestBody String status){
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> map;
		String tutorStatus = "";
		try {
			map = mapper.readValue(status, new TypeReference<Map<String, Object>>() {});
			tutorStatus = map.get("status").toString();
		} catch (JsonMappingException e1) {
			e1.printStackTrace();
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		try{
			adminService.approvePreTutor(id, tutorStatus);
			return (ResponseEntity<String>) ResponseEntity.status(HttpStatus.OK).body("정상적으로 설정되었습니다");
		}catch(ModifyException e) {
			e.printStackTrace();
			return (ResponseEntity<String>) ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("설정에 실패하였습니다");
		}
	}
	
	@RequestMapping(value = "/tutorLecture/{tutorId}")
	public ResponseEntity<List<Lecture>> tutorLectureList(@PathVariable(value = "tutorId") String tutor_id){
		List<Lecture> lectureList = new ArrayList<>();
		try {
			lectureList = adminService.ShowTutorLectureByTutorId(tutor_id);
		}catch(FindException e) {
			e.printStackTrace();
		}
		
		return ResponseEntity.status(HttpStatus.OK).body(lectureList);
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
	
	
	
	
	/////////////////////////FAQ////////////////////////////
	
	/**
	 * FAQ 조회
	 * @author jun6
	 * @return faq 전체 목록
	 */
	@RequestMapping(value = "/faq")
	public ModelAndView faq() {
		ModelAndView mnv = new ModelAndView();
		List<Faq> faqList = new ArrayList<>();
		try {
			faqList = adminService.showAllFaq();
			mnv.addObject("faqList", faqList);
			mnv.setViewName("/adminFaq");
		}catch(FindException e) {
			e.printStackTrace();
		}
		
		return mnv;
	}
	
	
}
