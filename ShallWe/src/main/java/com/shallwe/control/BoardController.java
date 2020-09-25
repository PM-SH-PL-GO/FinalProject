package com.shallwe.control;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
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
import com.shallwe.service.FaqService;
import com.shallwe.vo.Faq;
import com.shallwe.vo.Member;
import com.shallwe.vo.StudyBoard;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	private static final long serialVersionUID = 1L;
	@Autowired
	BoardService service;
	@Autowired
	FaqService faqService;
	
	@RequestMapping(value = "/studyBoard", method = RequestMethod.GET)
	public String studyBoard(Locale locale, Model model) {
		return "studyBoard";
		
	}
	
	@RequestMapping(value = "/faqList")
	public ModelAndView faqList() {
		ModelAndView mnv = new ModelAndView();
		try {
			List<Faq> list= faqService.findAll();
			mnv.addObject("faqList", list);
			mnv.setViewName("/faq");
		} catch (FindException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mnv;
		
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
			System.out.println("board="+board.getStudyBoard_view_count());
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
		try {
			service.writeBoard(sb);
			return "success";
		} catch (AddException e) {
			e.printStackTrace();
			return "fail";
		}
		
	}
	@DeleteMapping(value = "/delete/{studyBoard_id}")
	public ResponseEntity<String> delete(@PathVariable(value = "studyBoard_id",required = false) Integer id) {
		try {
			service.deleteBoard(id);
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.OK).body("");
	}
	
	@RequestMapping("/updateBoard/{studyBoard_id}")
	public ModelAndView updateBoard(@PathVariable(value = "studyBoard_id",required = false) Integer id) {
		ModelAndView mnv = new ModelAndView();
		try {
			StudyBoard sb = service.FindByNo(id);
			mnv.addObject("sb", sb);
			mnv.setViewName("/studyBoardWrite");
		} catch (FindException e) {
			e.printStackTrace();
		}
		return mnv;
		
	}
}

