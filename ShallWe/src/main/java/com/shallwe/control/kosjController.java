package com.shallwe.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shallwe.dao.LectureDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.ReviewBean;
import com.shallwe.service.LectureService;
import com.shallwe.service.ReviewService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.Member;
import com.shallwe.vo.Review;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class kosjController {
	
	@Autowired
	LectureService lectureService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	LectureDAO lectureDAO;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test() {
		System.out.println("test.jsp 호출");
	}
	
	@RequestMapping(value = "/reviewAdd", method = RequestMethod.GET)
	public ModelAndView reviewAdd() {
		System.out.println("reviewAdd.jsp  호출");
		ModelAndView modelAndView = new ModelAndView();

		Member member = new Member();
		member.setMember_id("member3");
		Tutor tutor = new Tutor();
		tutor.setMember(member);
		Lecture lecture = new Lecture();
		lecture.setLecture_img("lecture_test3.jpg");
		lecture.setTutor(tutor);
		lecture.setLecture_title("마케링");
		
		modelAndView.addObject("lecture" , lecture);
		modelAndView.setViewName("/reviewAdd");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
	public void searchResult() {
		System.out.println("searchResult.jsp  호출");
	}
	
	@RequestMapping(value = "/search", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView search(@RequestParam(value="searchKey", required=false) String searchKeyParam
							 , @RequestParam(value="searchText", required=false)String searchText) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if ( searchKeyParam == null ) {
			searchKeyParam = "0";
		} else if ( searchText == null )  {
			searchText = " ";
		}
		
		// 검색조건 요청 잘못 들어온 경우 처리
		int searchKey = Integer.parseInt(searchKeyParam);
		String [] searchKeyArr = {"all", "tutor_name", "lecture_title" , "category" };
		map.put("searchKey", searchKeyArr[searchKey]);
		map.put("searchText", searchText);
		
		ModelAndView modelAndView = new ModelAndView();

		try {
			modelAndView = lectureService.searchLecture(map);
			log.info(modelAndView.getModelMap()); 
			modelAndView.setViewName("/searchResult");
			
		} catch (FindException e) {
			modelAndView.setViewName("/fail");
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	@RequestMapping(value="/lecturePaid", method = {RequestMethod.GET, RequestMethod.POST})
	public String lecturePaymentList(Model model) throws FindException {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("searchKey", "all");
		map.put("searchText", "마");
		
		List<Lecture> lectureList = new ArrayList<Lecture>();
		lectureList = lectureDAO.selectLectureListBySearch(map);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("lectureList", lectureList);
		modelAndView.setViewName("/lecturePaid");
		
		ObjectMapper mapper = new ObjectMapper();
		String lectureListJsonValue="";
		try {
			lectureListJsonValue = mapper.writeValueAsString(lectureList);
			System.out.println("in josjController lectureListJsonValue:" + lectureListJsonValue);
			model.addAttribute("lectureListJsonValue", lectureListJsonValue);
			
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "/lecturePaid";
	}
	
	@RequestMapping(value = "/insertMemberLectureHistory", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView insertMemberLectureHistory(@RequestBody List<Lecture> lectureList ) throws AddException {
		
		log.info(" insertMemberLectureHistory 호출했어용~");
		log.info(" lectureList ::: " + lectureList);
		
		ModelAndView modelAndView = new ModelAndView();
		try { 
			lectureService.insertMemberLectureHistory(lectureList);
			modelAndView.setViewName("/success");
		
		} catch (AddException e) {
			modelAndView.addObject("errMsg", e.getMessage());
			modelAndView.setViewName("/fail");
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/updateMemberLectureHistory", method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateMemberLectureHistory(@RequestBody List<Lecture> lectureList ) throws AddException {
		
		log.info(" updateMemberLectureHistory 호출했어용~");
		
		ModelAndView modelAndView = new ModelAndView();
		try { 
			lectureService.insertMemberLectureHistory(lectureList);
			modelAndView.addObject("status", "success");
			modelAndView.setViewName("/success");
			
		} catch (AddException e) {
			modelAndView.addObject("status", "fail");
			modelAndView.addObject("errMsg", e.getMessage());
			modelAndView.setViewName("/fail");
			e.printStackTrace();
		}
		
		return modelAndView;
	}
	
	
	
	//--- review 등록
	@RequestMapping(value = "/reviewAddmethod", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertReview(@RequestBody ReviewBean reviewBean ) throws AddException {
		
		ModelAndView modelAndView = new ModelAndView();
		try {
			reviewService.insertReview(reviewBean);
			modelAndView.addObject("status", "success");
			modelAndView.setViewName("/success");
			
		} catch (AddException e) {
			e.printStackTrace();
			modelAndView.addObject("status", "fail");
			modelAndView.addObject("errMsg", e.getMessage());
			modelAndView.setViewName("/fail");
		}
		return modelAndView;
	}
	
	//--- review 강사별, 카테고리별 후기 조회
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView selectReviewList(String tutor_id , String category_id) throws AddException {
		
		if ( tutor_id == null && "".equals(tutor_id) ) {
			tutor_id = "member3";
		} else if (category_id == null && "".equals(category_id)) {
			category_id = "MA";
		}
		
		List<Review> list = new ArrayList<Review>();
		ModelAndView modelAndView = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("tutor_id", tutor_id);
		map.put("category_id", category_id);
		try {
			list = reviewService.selectReview(map);
			modelAndView.addObject("list", list);
			modelAndView.addObject("status", "success");
			modelAndView.setViewName("/reviewList");
			
		} catch (FindException e) {
			e.printStackTrace();
			modelAndView.addObject("status", "fail");
			modelAndView.addObject("errMsg", e.getMessage());
			modelAndView.setViewName("/fail");
		}
		return modelAndView;
	}
	//--- review 삭제
	@RequestMapping(value = "/removeReview", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView removeReview(
			@RequestParam(value="lectureCategoryId", required=false) String lectureCategoryId , 
			@RequestParam(value="member_id", required=false) String member_id , 
			@RequestParam(value="lecture_id", required=false) String lecture_id ,
			@RequestParam(value="tutor_id", required=false) String tutor_id
			
			) throws RemoveException {
		
		ModelAndView modelAndView = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("lectureCategoryId", lectureCategoryId);
		map.put("member_id", member_id);
		map.put("lecture_id", lecture_id);
		map.put("tutor_id", tutor_id);
		
		try {
			reviewService.removeReview(map);
			modelAndView.setViewName("/success");
			
		} catch (RemoveException e) {
			e.printStackTrace();
			modelAndView.addObject("errMsg", e.getMessage());
			modelAndView.setViewName("/fail");
		}
		return modelAndView;
	}
	
} // end of kosjController
