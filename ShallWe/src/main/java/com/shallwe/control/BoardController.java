package com.shallwe.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.rmi.RemoteException;
import java.util.List;
import java.util.Locale;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
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

	/**
	 * 전체 faq 목록 조회
	 * @author psw09
	 * @return 전체faq 목록
	 */
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
	
	/**
	 * 게시글  조회
	 * @author psw09
	 * @return 게시글 목록
	 */
	@RequestMapping("/list/{currentPage}")
	@ResponseBody
	public ResponseEntity<BoardPageBean<StudyBoard>> list(@PathVariable(value = "currentPage",required = false) Integer cp, HttpSession session){
		int currentPage = 1;
		if(cp != null) 
			currentPage = cp;
		
		BoardPageBean<StudyBoard> pb = null;
		try {
			BoardPageBean<StudyBoard> oldPb=(BoardPageBean<StudyBoard>)session.getAttribute("pb");
			if(oldPb !=null) {
				session.removeAttribute("pb");
				
			}
			pb = service.findAll(currentPage);
			session.setAttribute("pb", pb);
			BoardPageBean<StudyBoard> od=(BoardPageBean<StudyBoard>)session.getAttribute("pb");
			for(StudyBoard s:od.getList()) {
			}
			
			return (ResponseEntity<BoardPageBean<StudyBoard>>)ResponseEntity.status(HttpStatus.OK).body(pb);
		} catch (FindException e) {
			e.printStackTrace();
			return (ResponseEntity<BoardPageBean<StudyBoard>>)ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(pb);
		}
		
	}
	
	/**
	 * 게시글  검색
	 * @author psw09
	 * @return 검색된 게시글 목록
	 */	
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

	/**
	 * 게시글  상세보기
	 * @author psw09
	 * @return 게시글 상세페이지
	 */	
	@RequestMapping("/detail/{boardIdVal}")
	public ModelAndView detail(@PathVariable int boardIdVal) {
		ModelAndView mnv = new ModelAndView();
		StudyBoard board;
		try {
			board = service.FindByNo(boardIdVal);
			mnv.addObject("studyBoard", board);
			mnv.setViewName("/studyBoardDetail");

		} catch (FindException e) {
			e.printStackTrace();
			mnv.setViewName("/fail");
			mnv.addObject("errorMsg", e.getMessage());
		}
		return mnv;
	}

	/**
	 * 글쓰기 이동
	 * @author psw09
	 * @return 글쓰기 이동
	 */	
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
	
	/**
	 * 저장된 파일 UUID값 추가
	 * @author psw09
	 * @return UUID값 추가된 파일
	 */	
	public String saveFile(MultipartFile file) {
		String UPLOAD_PATH = realPath;
		UUID uuid = UUID.randomUUID();
		String saveName = uuid+"_"+file.getOriginalFilename();
		File saveFile = new File(UPLOAD_PATH,saveName);
		try {
			file.transferTo(saveFile);
			
		} catch (IllegalStateException e) {
			//즉 브라우져에 보낼 데이터를 버퍼에 쓴 이후로는 redirect나 forward를 할수 없을떄 일어난다(forward나 redirect)
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveName;
	}
	
	/**
	 * 게시글 쓰기
	 * @author psw09
	 * @return 작성된 게시글 번호
	 */	
	@RequestMapping(value = "/writeBoard", method = RequestMethod.POST)
	@Transactional
	public ResponseEntity<Integer> writeBoard(String studyBoard_title, HttpSession session, MultipartFile boardUpload, String studyBoard_content) {
		StudyBoard sb = new StudyBoard();
		Member member = new Member();
		String studyBoard_fileName ="";
		String memberId = (String)session.getAttribute("loginInfo");
		member.setMember_id(memberId);
		if(boardUpload !=null) {
			studyBoard_fileName = saveFile(boardUpload);
		}
		
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
	
	/**
	 * 게시글 삭제
	 * @author psw09
	 */	
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
	
	/**
	 * 게시글 수정
	 * @author psw09
	 * @return 수정된 게시글 번호
	 */	
	@RequestMapping(value = "/updateBoard", method = RequestMethod.POST)
	@Transactional
	public ResponseEntity<Integer> updateBoard(StudyBoard sb, HttpSession session, MultipartFile boardUpload, String studyBoard_content) {
		Member member = new Member();
		String studyBoard_fileName =null;
		String memberId = (String)session.getAttribute("loginInfo");
		member.setMember_id(memberId);
		if(boardUpload !=null) {
			studyBoard_fileName = saveFile(boardUpload);
		}
		try {
			sb.setMember(member);
			sb.setStudyBoard_fileName(studyBoard_fileName);
			sb.setStudyBoard_content(studyBoard_content);
			service.updateBoard(sb);
			int board_id = sb.getStudyBoard_id();
			return ResponseEntity.status(HttpStatus.OK).body(board_id);
		} catch (ModifyException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(0);
		}
		
	}
	
	/**
	 * 파일 다운로드
	 * @author psw09
	 */	
	@RequestMapping(value = "/download")
	public void downloadBoard(String fileName, HttpServletResponse response) throws IOException{
		response.setContentType("application/octet-stream; charset=UTF-8");
		//응답헤더 설정: Download할 파일이름 결정
		String result = fileName.substring(fileName.lastIndexOf("_")+1);
		result = new String(result.getBytes("UTF-8"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename=\""+result+"\"");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Pragma", "no-cache;");
		response.setHeader("Expires", "-1;");
		
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = null;
		File f = new File(realPath, fileName);
		fis = new FileInputStream(f);
		byte[] bArr = new byte[8*1024];
		int len = -1;
		while( (len = fis.read(bArr)) != -1){
			os.write(bArr, 0, len);
		}
		fis.close();
		os.close();
	}
	
	// FreeBoard Controller Start 
	
	// 게시글 등록 페이지로 이동
	@RequestMapping(value="/freewrite", method=RequestMethod.GET)
	public String freeWriteGET() {
		return "board/freeBoardWrite";
	}
	
	// 게시글 등록 처리
	@RequestMapping(value="/freewrite", method=RequestMethod.POST)
	public String freeWritePOST(FreeBoard freeboard, RedirectAttributes redirectAttributes)throws AddException {
		service.insertFreeBoard(freeboard);
		redirectAttributes.addFlashAttribute("msg", "registrySuccess");
		return "redirect:/board/freeboard";
	}
	
	// 목록 페이지로 이동
	@RequestMapping(value="freeboard", method=RequestMethod.GET)
	public String freeList(Model model) throws Exception{
		model.addAttribute("freeboard", service.listAll());
		return "board/freeBoard";
	}
	
	// 게시글 읽기 페이지로 이동
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String freeRead(@RequestParam("freeboard_id")int freeboard_id, Model model)throws FindException{
		model.addAttribute("freeboard", service.read(freeboard_id));
		return "board/freeBoardRead";
	}
	
	// 게시글 수정 페이지 이동
	@RequestMapping(value="freemodify", method=RequestMethod.GET)
	public String freeModifyGET(@RequestParam("freeboard_id")int freeboard_id, Model model)throws FindException{
		model.addAttribute("freeboard",service.read(freeboard_id));
		return "board/freeBoardModi";
	}
	
	// 게시글 수정 처리
	@RequestMapping(value="freemodify", method=RequestMethod.POST)
	public String freeModifyPOST(FreeBoard freeboard, RedirectAttributes redirectAttributes)throws ModifyException{
		service.updateFreeBoard(freeboard);
		redirectAttributes.addFlashAttribute("msg", "modifySuccess");
		return "redirect:/board/freeboard";
	}
	
	// 게시글 삭제 처리
	@RequestMapping(value="freedelete", method=RequestMethod.GET)
	public String freeDelete(@RequestParam("freeboard_id")int freeboard_id, RedirectAttributes redirectAttributes)throws Exception{
		service.deleteFreeBoard(freeboard_id);
		redirectAttributes.addFlashAttribute("msg", "deleteSuccess");
		return "redirect:/board/freeboard";
	
	}
}

