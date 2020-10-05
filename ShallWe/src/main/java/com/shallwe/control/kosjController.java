package com.shallwe.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.model.ReviewBean;
import com.shallwe.service.LectureService;
import com.shallwe.service.ReviewService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.Review;
import com.shallwe.vo.StudyBoard;

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
	
	@Autowired
	EmailController emailController;
	
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public void test() {
		System.out.println("test.jsp 호출");
	}
	
	
	// 강의 후기 등록 화면 요청
	@RequestMapping(value = "/reviewAdd", method = RequestMethod.GET)
	public ModelAndView reviewAdd(HttpSession session, @RequestParam (value="lecture_id") String lecture_id) throws FindException {
		String member_id = (String)session.getAttribute("loginInfo");
		Lecture lecture = new Lecture();

		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		
		} catch (FindException e) {
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("lecture", lecture);
		modelAndView.addObject("member_id", member_id);
		modelAndView.setViewName("/reviewAdd");
		
		return modelAndView;
	}
	
	
	//--- review 등록
	@RequestMapping(value = "/reviewAddmethod", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertReview(HttpSession session, @RequestBody ReviewBean reviewBean ) throws AddException {
		if ( reviewBean.getMemberId() == null ) {
			String memberId = (String)session.getAttribute("loginInfo");
			reviewBean.setMemberId(memberId);
		} 
		
		ModelAndView modelAndView = new ModelAndView();
		try {
			reviewService.insertReview(reviewBean);
			modelAndView.setViewName("/reviewAdd");
			
		} catch (AddException e) {
			e.printStackTrace();
			modelAndView.addObject("errMsg", e.getMessage());
		}
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

		List<Lecture> list = new ArrayList<Lecture>();
		try {
			list = lectureService.searchLecture(map);
			log.info(modelAndView.getModelMap()); 
			modelAndView.addObject("list", list);
			modelAndView.setViewName("/searchResult");
			
		} catch (FindException e) {
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
	
	@RequestMapping(value = "/insertMemberLectureHistory", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertMemberLectureHistory( HttpSession session, @RequestParam(value="lecture_id") String lecture_id
	) throws AddException {
		
		log.info(" insertMemberLectureHistory 호출했어용~");
		String member_id = (String)session.getAttribute("loginInfo");
		Lecture lecture = new Lecture();
		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		} catch (FindException e1) {
			e1.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecture_category_id", lecture.getLectureCategory().getLecture_category_id());
		map.put("lecture_id", lecture_id);
		map.put("member_id", member_id);
		
		ModelAndView modelAndView = new ModelAndView();
		try { 
			lectureService.insertMemberLectureHistory(map);
			modelAndView.setViewName("/success");
		
		} catch (AddException e) {
			modelAndView.addObject("errMsg", e.getMessage());
			modelAndView.setViewName("/fail");
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	
	@RequestMapping(value = "/updateMemberLectureHistory", method = RequestMethod.GET)
	public ResponseEntity<String> updateMemberLectureHistory( HttpSession session, @RequestParam(value="lecture_id") String lecture_id
	) throws ModifyException {
		//ModelAndView modelAndView = new ModelAndView();

		String member_id = (String)session.getAttribute("loginInfo");
		Lecture lecture = new Lecture();
		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		} catch (FindException e1) {
			e1.printStackTrace();
		}
		
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("lecture_category_id", lecture.getLectureCategory().getLecture_category_id());
		map.put("memberId", member_id);
		map.put("lectureId", lecture_id);
		
		try { 
			lectureService.updateMemberLectureHistory(map);
			return ResponseEntity.status(HttpStatus.OK).body("success");
			
		} catch (ModifyException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("fail : "+e.getMessage());
		}
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
			modelAndView.setViewName("/reviewList");
			
		} catch (FindException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	//--- member별 review 조회
	@RequestMapping(value = "/member/memberReviewList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView selectMemberReviewLsist(HttpSession session) throws AddException {

		String member_id = (String)session.getAttribute("loginInfo");
		List<Review> list = new ArrayList<Review>();
		ModelAndView modelAndView = new ModelAndView();
	
		try {
			list = reviewService.selectReviewByMemberId(member_id);
			modelAndView.addObject("list", list);
			modelAndView.setViewName("/reviewList");
			
		} catch (FindException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	//--- review 삭제
	@RequestMapping(value = "/removeReview", method = RequestMethod.GET)
//	public ModelAndView removeReview(
	public ResponseEntity<String> removeReview(HttpSession session, @RequestParam(value="lecture_id") String lecture_id	) throws RemoveException {
		Lecture lecture = null;
		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		} catch (FindException e1) {
			e1.printStackTrace();
		}
		String member_id = (String)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("lectureCategoryId", lecture.getLectureCategory().getLecture_category_id());
		map.put("member_id", member_id);
		map.put("lecture_id", lecture_id);
		map.put("tutor_id", lecture.getTutor().getMember().getMember_id());
		
		try {
			reviewService.removeReview(map);
			return ResponseEntity.status(HttpStatus.OK).body("success");
			
		} catch (RemoveException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("fail : "+e.getMessage());
		}
		//return modelAndView;
	}
	
} // end of kosjController
