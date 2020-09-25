package com.shallwe.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.service.BoardService;
import com.shallwe.service.ReplyService;
import com.shallwe.vo.Member;
import com.shallwe.vo.StudyBoard;
import com.shallwe.vo.StudyReply;

@Controller
@RequestMapping(value = "/reply/*")
public class ReplyController {
	private static final long serialVersionUID = 1L;
	@Autowired
	ReplyService service;
	
	@RequestMapping("{studyboardId}")
	@ResponseBody
	public ResponseEntity<BoardPageBean<StudyReply>> list(@PathVariable(value = "studyboardId",required = false) Integer si){
		int page = 1;
		BoardPageBean<StudyReply> pb = null;
		try {
			pb =service.findAll(si, page);
			return (ResponseEntity<BoardPageBean<StudyReply>>)ResponseEntity.status(HttpStatus.OK).body(pb);
		} catch (FindException e) {
			e.printStackTrace();
			return (ResponseEntity<BoardPageBean<StudyReply>>)ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(pb);
		}
		
	}
	
	@RequestMapping(value ="/write" , method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> write(String studyReply_content, int studyBoard_Id, HttpSession session){
		StudyReply sr = new StudyReply();
		Member m = new Member();
		StudyBoard sb = new StudyBoard();
		String memberId =(String)session.getAttribute("loginInfo");
		if(memberId ==null ||memberId =="") {
			System.out.println("아이디없자나 임마");
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("로그인 후 댓글을 작성해주세요");
		}
		m.setMember_id(memberId);
		sb.setStudyBoard_id(studyBoard_Id);
		sr.setMember(m);
		sr.setStudyboard(sb);
		sr.setStudyreply_content(studyReply_content);
		try {
			service.writeReply(sr);
			return  ResponseEntity.status(HttpStatus.OK).body("댓글 작성 완료");
		} catch (AddException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 작성에 실패했습니다.");
		}
	}
		

	
	@RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public ResponseEntity<String> update(int studyreply_id, String studyreply_content, HttpSession session){
		String member_id = (String)session.getAttribute("loginInfo");
		Member m = new Member();
		m.setMember_id(member_id);
		
		StudyReply r = new StudyReply();
		r.setMember(m);
		r.setStudyreply_id(studyreply_id);
		r.setStudyreply_content(studyreply_content);
		try {
			service.updateReply(r);
			return ResponseEntity.status(HttpStatus.OK).body("댓글 작성 완료");
		} catch (ModifyException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("댓글 작성 실패");
		}
		
	}

}
