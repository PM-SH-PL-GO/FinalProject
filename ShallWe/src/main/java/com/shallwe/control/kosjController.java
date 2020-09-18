package com.shallwe.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class kosjController {

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
//	@RequestMapping(value = "/top", method = RequestMethod.GET)
//	public void top() {
//		System.out.println("top.jsp  호출");
//	}
}
