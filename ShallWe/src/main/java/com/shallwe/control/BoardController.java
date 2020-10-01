package com.shallwe.control;

import java.io.File;
import java.io.IOException;
import java.rmi.RemoteException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.ApplicationBufferHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.service.BoardService;
import com.shallwe.service.FaqService;
import com.shallwe.service.MemberSerivce;
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
		System.out.println("보드아이디발??"+boardIdVal);
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
	
	@Autowired
	ServletContext c;
	
	private String realPath;
	
	@PostConstruct
	public void initController() {
		this.realPath = c.getRealPath("/files/studyBoard");
  }
	
	public String saveFile(MultipartFile file) {
		String UPLOAD_PATH = realPath;
		UUID uuid = UUID.randomUUID();
		String saveName = uuid+"_"+file.getOriginalFilename();
		File saveFile = new File(UPLOAD_PATH,saveName);
		try {
			file.transferTo(saveFile);
			//업로드 파일에 saveFile이라는 껍데기 입힘
			System.out.println("파일크기:" + saveFile.length() + "파일사이즈:" + file.getSize());
			
		} catch (IllegalStateException e) {
			//즉 브라우져에 보낼 데이터를 버퍼에 쓴 이후로는 redirect나 forward를 할수 없을떄 일어난다(forward나 redirect)
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return saveName;
	}
	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	@Transactional
	public ResponseEntity<Integer> writeBoard(String studyBoard_title, HttpSession session, MultipartFile boardUpload, String studyBoard_content) {
		StudyBoard sb = new StudyBoard();
		Member member = new Member();
		String memberId = (String)session.getAttribute("loginInfo");
		member.setMember_id(memberId);
		String studyBoard_fileName = saveFile(boardUpload);
		try {
			sb.setMember(member);
			sb.setStudyBoard_fileName(studyBoard_fileName);
			sb.setStudyBoard_title(studyBoard_title);
			sb.setStudyBoard_content(studyBoard_content);
			service.writeBoard(sb);
			BoardPageBean<StudyBoard> studyBoard = service.findAll(1);
			int board_id = studyBoard.getList().get(0).getStudyBoard_id();
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
	
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	@Transactional
	public ResponseEntity<Integer> updateBoard(StudyBoard sb, HttpSession session, MultipartFile boardUpload, String studyBoard_content) {
		System.out.println(1);
		Member member = new Member();
		String memberId = (String)session.getAttribute("loginInfo");
		member.setMember_id(memberId);
		String studyBoard_fileName = saveFile(boardUpload);
		System.out.println(2);
		try {
			sb.setMember(member);
			sb.setStudyBoard_fileName(studyBoard_fileName);
			sb.setStudyBoard_content(studyBoard_content);
			System.out.println(3);
			System.out.println("sbsbsbsbsb========="+sb);
			service.updateBoard(sb);
//			BoardPageBean<StudyBoard> studyBoard = service.findAll(1);
			int board_id = sb.getStudyBoard_id();
			return ResponseEntity.status(HttpStatus.OK).body(board_id);
		} catch (ModifyException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0);
		}
		
	}
}

