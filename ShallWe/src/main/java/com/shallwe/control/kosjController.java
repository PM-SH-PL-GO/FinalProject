package com.shallwe.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shallwe.dao.LectureDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.Lecture;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class kosjController {
	
	@Autowired
	LectureService lectureService;
	
	@Autowired
	LectureDAO lectureDAO;
	
//	@RequestMapping(value = "/lecturePaid", method = RequestMethod.GET)
//	public void lecturePaid() {
//		System.out.println("lecturePaid.jsp 호출");
//	}
	@RequestMapping(value = "/reviewAdd", method = RequestMethod.GET)
	public void reviewAdd() {
		System.out.println("lecturePaid.jsp  호출");
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
		
		log.info("searchKeyParam : " +searchKeyParam);
		log.info("searchText : " +searchText);
		
		// 검색조건 요청 잘못 들어온 경우 처리
		int searchKey = Integer.parseInt(searchKeyParam);
		String [] searchKeyArr = {"all", "tutor_name", "lecture_title" , "category" };
		map.put("searchKey", searchKeyArr[searchKey]);
		map.put("searchText", searchText);
		
		ModelAndView modelAndView = new ModelAndView();

		try {
			modelAndView = lectureService.searchLecture(map);
			log.info(modelAndView.getModelMap()); 
			//modelAndView.setViewName("/searchLectureList");
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
} // end of kosjController
