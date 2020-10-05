package com.shallwe.control;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.service.BoardService;
import com.shallwe.service.FaqService;
import com.shallwe.service.MemberSerivce;
import com.shallwe.vo.Faq;
import com.shallwe.vo.FreeBoard;
import com.shallwe.vo.Member;
import com.shallwe.vo.StudyBoard;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {
	private static final long serialVersionUID = 1L;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	BoardService service;
	@Autowired
	FaqService faqService;
	@Autowired
	MemberSerivce memberService;
	
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
		ModelAndView mnv = new ModelAndView();
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
	
	@RequestMapping("/search/{searchVal}/{currentPage}")
	@ResponseBody
	public ResponseEntity<BoardPageBean<StudyBoard>> searchList(@PathVariable(value = "searchVal",required = false) String sv, @PathVariable(value = "currentPage",required = false) Integer cp){
		BoardPageBean<StudyBoard> pb = null;
		try {
			 pb = service.search(sv, cp);
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
	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	@ResponseBody
	@Transactional
	public ResponseEntity<Integer> writeBoard(@RequestBody StudyBoard sb, HttpSession session) {
		Member member = new Member();
		String memberId = (String)session.getAttribute("loginInfo");
		member.setMember_id(memberId);
		try {
			sb.setMember(member);
			service.writeBoard(sb);
			BoardPageBean<StudyBoard> studyBoard = service.findAll(1);
			int board_id = studyBoard.getList().get(0).getStudyBoard_id();
			System.out.println("첫번째 번호!!"+board_id);
			return ResponseEntity.status(HttpStatus.OK).body(board_id);
		} catch (AddException | FindException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0);
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
	
	@RequestMapping("/updateBoard")
	@ResponseBody
	public ResponseEntity<Integer> updateBoard(@RequestBody StudyBoard sb, HttpSession session) {
		Member member = new Member();
		String memberId = (String)session.getAttribute("loginInfo");
		member.setMember_id(memberId);
		try {
			sb.setMember(member);
			service.updateBoard(sb);
			return ResponseEntity.status(HttpStatus.OK).body(sb.getStudyBoard_id());
		} catch (ModifyException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0);
		}
		
	}
	
	// FreeBoard Controller Start 
	
	// 게시글 등록 페이지로 이동
	@RequestMapping(value="/freewrite", method=RequestMethod.GET)
	public String freeWriteGET() {
		logger.info("write GET.....");
		return "board/freeBoardWrite";
	}
	
	// 게시글 등록 처리
	@RequestMapping(value="/freewrite", method=RequestMethod.POST)
	public String freeWritePOST(FreeBoard freeboard, RedirectAttributes redirectAttributes)throws AddException {
		logger.info("write POST.....");
		logger.info(freeboard.toString());
		service.insertFreeBoard(freeboard);
		redirectAttributes.addFlashAttribute("msg", "registrySuccess");
		return "redirect:/board/freeboard";
	}
	
	// 목록 페이지로 이동
	@RequestMapping(value="freeboard", method=RequestMethod.GET)
	public String freeList(Model model) throws Exception{
		logger.info("FreeBoard list.....");
		model.addAttribute("freeboard", service.listAll());
		return "board/freeBoard";
	}
	
	// 게시글 읽기 페이지로 이동
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String freeRead(@RequestParam("freeboard_id")int freeboard_id, Model model)throws FindException{
		logger.info("FreeBoard read.....");
		model.addAttribute("freeboard", service.read(freeboard_id));
		return "board/freeBoardRead";
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping(value="freemodify", method=RequestMethod.GET)
	public String freeModifyGET(@RequestParam("freeboard_id")int freeboard_id, Model model)throws FindException{
		logger.info("FreeBoard modifyGET.....");
		model.addAttribute("freeboard",service.read(freeboard_id));
		return "board/freeBoardModi";
	}
	
	// 게시글 수정 처리
	@RequestMapping(value="freemodify", method=RequestMethod.POST)
	public String freeModifyPOST(FreeBoard freeboard, RedirectAttributes redirectAttributes)throws ModifyException{
		logger.info("FreeBoard modifyPOST......");
		service.updateFreeBoard(freeboard);
		redirectAttributes.addFlashAttribute("msg", "modifySuccess");
		return "redirect:/board/freeboard";
	}
	
	// 게시글 삭제 처리
	@RequestMapping(value="freedelete", method=RequestMethod.GET)
	public String freeDelete(@RequestParam("freeboard_id")int freeboard_id, RedirectAttributes redirectAttributes)throws Exception{
		logger.info("FreeBoard delete......");
		service.deleteFreeBoard(freeboard_id);
		redirectAttributes.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/board/freeboard";
	}
}

