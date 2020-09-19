package com.shallwe.control;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.service.LectureService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class kosjController {
	
	@Autowired
	LectureService lectureService;
	
	@RequestMapping(value = "/lecturePaid", method = RequestMethod.GET)
	public void lecturePaid() {
		System.out.println("lecturePaid.jsp 호출");
	}
	@RequestMapping(value = "/reviewAdd", method = RequestMethod.GET)
	public void reviewAdd() {
		System.out.println("lecturePaid.jsp  호출");
	}
	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
	public void searchResult() {
		System.out.println("searchResult.jsp  호출");
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public ModelAndView search(@RequestParam(value="searchKey")String searchKeyParam
							 , @RequestParam(value="searchText")String searchText) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 입력 받은 검색어 param null값 처리
		if ( ("").equals(searchText) ) {
			searchText = " ";
		} 
		
		// 검색조건 요청 잘못 들어온 경우 처리
		int searchKey = Integer.parseInt(searchKeyParam);
		if ( searchKey > 3 ) {
			searchKey = 0;
		}
		
		String [] searchKeyArr = {"all", "tutor_name", "lecture_title" , "category" };
		map.put("searchKey", searchKeyArr[searchKey]);
		map.put("searchText", searchText);
		
		ModelAndView modelAndView = new ModelAndView();

		try {
			modelAndView = lectureService.searchLecture(map);
			log.info(modelAndView.getModelMap()); 
			modelAndView.setViewName("/searchLectureList");
			
			
		} catch (FindException e) {
			modelAndView.setViewName("/fail");
			e.printStackTrace();
		}
		
		return modelAndView;
	}
//	@RequestMapping(value = "/top", method = RequestMethod.GET)
//	public void top() {
//		System.out.println("top.jsp  호출");
//	}
}
