package com.shallwe.control;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.service.BoardService;
import com.shallwe.vo.Member;
import com.shallwe.vo.StudyBoard;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	private static final long serialVersionUID = 1L;
	@Autowired
	BoardService service;
	
	@RequestMapping(value = "/studyBoard", method = RequestMethod.GET)
	public void studyBoard(Locale locale, Model model) {
		System.out.println("studyBoard coming");
	}
	
	@RequestMapping(value = "/faq", method = RequestMethod.GET)
	public void faq(Locale locale, Model model) {
		System.out.println("studyBoard coming");
	}
	
	@RequestMapping("/list/{currentPage}")
	@ResponseBody
	public ResponseEntity<BoardPageBean<StudyBoard>> list(@PathVariable(value = "currentPage",required = false) Integer cp, HttpSession session){
		int currentPage = 1;
		if(cp != null) {
			currentPage = cp;
		}
		BoardPageBean<StudyBoard> pb = null;
		try {
			pb = service.findAll(currentPage);
			session.setAttribute("pb", pb);
			return (ResponseEntity<BoardPageBean<StudyBoard>>)ResponseEntity.status(HttpStatus.OK).body(pb);
		} catch (FindException e) {
			e.printStackTrace();
			return (ResponseEntity<BoardPageBean<StudyBoard>>)ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(pb);
		}
		
	}
	
	@RequestMapping("/search/{searchVal}")
	@ResponseBody
	public ResponseEntity<BoardPageBean<StudyBoard>> searchList(@PathVariable(value = "searchVal",required = false) String sv){
		BoardPageBean<StudyBoard> pb = null;
		System.out.println("sv="+sv);
		try {
			 pb = service.search(sv, 1);
			return (ResponseEntity<BoardPageBean<StudyBoard>>)ResponseEntity.status(HttpStatus.OK).body(pb);
		} catch (FindException e) {
			e.printStackTrace();
			return (ResponseEntity<BoardPageBean<StudyBoard>>)ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(pb);
		}
	}
	
	@RequestMapping("/detail/{boardIdVal}")
//	@ResponseBody
	public ModelAndView detail(@PathVariable int boardIdVal) {
		ModelAndView mnv = new ModelAndView();
		StudyBoard board;
		try {
			board = service.FindByNo(boardIdVal);
			System.out.println("board="+board);
			mnv.addObject("studyBoard", board);
			mnv.setViewName("/studyBoardDetail");

		} catch (FindException e) {
			e.printStackTrace();
			mnv.setViewName("/fail");
			mnv.addObject("errorMsg", e.getMessage());
		}
		return mnv;
	}
	
	@RequestMapping(value = "/write")
	public String studyBoardWrite() {
		return "studyBoardWrite";
	}
	
	@RequestMapping("writeBoard")
	public String writeBoard(@RequestBody StudyBoard sb) {
		System.out.println("sb="+sb);
		try {
			service.writeBoard(sb);
			return "success";
		} catch (AddException e) {
			e.printStackTrace();
			return "fail";
		}
		
	}
	
}

