package com.shallwe.control;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.mail.Multipart;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.service.TutorService;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/tutor")
@RequiredArgsConstructor
@Log4j
public class TutorController {
	// 회원 : 강사 신청
	// 강사 : 내 강사 정보 조회
	
	@Autowired private TutorService service;
	@Autowired
	private static final String DELL_PATH = "/Users/chan/Desktop/Web/FinalProject/ShallWe/src/main/webapp/files/tutorImages";
	
	//강사정보 보기: 경찬
	@GetMapping(value="showTutor")
	public ModelAndView showTutorInfo(HttpSession session) throws FindException {
		
		String member_id = (String)session.getAttribute("loginInfo");
		ModelAndView model = new ModelAndView();
		List<Tutor> tutor = new ArrayList<>();	
		if (member_id == null) {
			
			throw new FindException("예외발생:로그인 안되어 있음");
			
		}
		try {
			
			tutor = service.showTutorInfo(member_id);
			model.setViewName("/tutorInfo");
			model.addObject("tutor", tutor);
			
		} catch (FindException e) {
			
			e.printStackTrace();
		}
		
		return model;
	}
	
	//강사 닉네임 중복체크: 경찬
	@PostMapping(value="checkNickName")
	public ResponseEntity<Integer> checkNickName(String tutor_nickName) throws FindException{
		log.info("닉네임중복확인:"+tutor_nickName);
		
		int nickNameCheck = service.checkNickName(tutor_nickName);
		
		if (nickNameCheck == 0) {
			
			service.checkNickName(tutor_nickName);
			
		}
		ResponseEntity<Integer> responseEntity = ResponseEntity.status(HttpStatus.OK).body(nickNameCheck);
		
		return responseEntity;
	}
	//강사 사진 이력서 지우기 : 경찬
	public String dellFile(MultipartFile file) {
		
		String fileName = file.getOriginalFilename();	
		
		File dellFile = new File(DELL_PATH,fileName);
		if (dellFile.exists()) {
			
			dellFile.delete();
			log.info("파일삭제:" + fileName);
			
		}
		
		return fileName;
	}
	
	//강사신청취소
	@GetMapping(value="dellTutor")
	public ResponseEntity<String> dellTutor(HttpSession session,
											MultipartFile tutor_img,
											MultipartFile tutor_career_file,
											String tutor_id)throws FindException{
//		tutor_id = "championcom";
		tutor_id = (String)session.getAttribute("loginInfo");
		try {
			
			service.dellTutor(tutor_id);
			
		} catch (RemoveException e) {
			
			e.printStackTrace();
		}
		
		ResponseEntity<String> responseEntity = ResponseEntity.status(HttpStatus.OK).body(null);
		return responseEntity;
		
	}

}
