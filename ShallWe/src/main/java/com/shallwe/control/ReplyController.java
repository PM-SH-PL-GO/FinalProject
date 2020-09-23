package com.shallwe.control;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.shallwe.exception.FindException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.service.BoardService;
import com.shallwe.service.ReplyService;
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
			System.out.println("pb="+pb.getList().size());
			return (ResponseEntity<BoardPageBean<StudyReply>>)ResponseEntity.status(HttpStatus.OK).body(pb);
		} catch (FindException e) {
			e.printStackTrace();
			return (ResponseEntity<BoardPageBean<StudyReply>>)ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(pb);
		}
		
	}

}
