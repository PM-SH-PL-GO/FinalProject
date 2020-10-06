package com.shallwe.control;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.service.TutorService;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/tutor")
@Log4j
public class TutorController {
	// 회원 : 강사 신청
	// 강사 : 내 강사 정보 조회
	
	@Autowired private TutorService service;
	@Autowired private ServletContext c;
			   private String imgrealPath;
			   private String careerrealPath;
	 @PostConstruct
	   public void initController() {
		   
	      this.imgrealPath = c.getRealPath("/files/tutorImages/");
	  }
	 
	 @PostConstruct
	   public void initController2() {
		   
	      this.careerrealPath = c.getRealPath("/files/tutorCareer/");
	  }
	 
	//강사정보 보기: 경찬"
	@RequestMapping(value="/showTutor",method=RequestMethod.GET)
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
	@PostMapping(value= {"/checkNickName","/updateNickName"})
	public ResponseEntity<Integer> checkNickName(String tutor_nickName) throws FindException{
		log.info("닉네임중복확인:"+tutor_nickName);
		
		int nickNameCheck = service.checkNickName(tutor_nickName);
		
		if (nickNameCheck == 0) {
			
			service.checkNickName(tutor_nickName);
			
		}
		ResponseEntity<Integer> responseEntity = ResponseEntity.status(HttpStatus.OK).body(nickNameCheck);
		
		return responseEntity;
	}
	
	//강사 사진 이미지 지우기 : 경찬
	public String dellImageFile(String tutor_img1) {
		
		String path = imgrealPath + tutor_img1;
		 File files = new File(path);
		 if (files.exists()) {
			 
			 File[] deleteFolderList = files.listFiles();
			 for(int i = 0; i<deleteFolderList.length; i++) {
				 deleteFolderList[i].delete();
			 }
		} return path;
	}
	
	//강사 커리어 파일 지우기 : 경찬
	@PostMapping(value="/dellcareer")
	public String dellCareerFile(String tutor_career_file1) {
		
		String path = careerrealPath + tutor_career_file1;
		 File files = new File(path);
		 if (files.exists()) {
			 File[] deleteFolderList = files.listFiles();
			 for(int i = 0; i<deleteFolderList.length; i++) {
				 deleteFolderList[i].delete();
			 }
		} return path;
	}
	
	//강사신청취소:경찬
	@RequestMapping(value="/dellTutor",method= {RequestMethod.POST,RequestMethod.GET})
	public ResponseEntity<String> dellTutor(HttpSession session,
											@RequestParam Map<String,Object> tutor)throws RemoveException{
		
		
		String tutor_id = (String)session.getAttribute("loginInfo");	
		Member member = new Member();
		member.setMember_id(tutor_id);
		Tutor t = new Tutor();
		tutor.put("tutor_id", tutor_id);
		String image = dellImageFile((String) tutor.put("tutor_img", t.getTutor_img()));
		String career = dellCareerFile((String) tutor.put("tutor_career_file",t.getTutor_career_file()));
		tutor.put("tutor_img", image);
		tutor.put("tutor_career_file",career);
		
		try {
			
			service.dellTutor(tutor);
			
		} catch (RemoveException e) {
			
			e.printStackTrace();
		}
		
		ResponseEntity<String> responseEntity = ResponseEntity.status(HttpStatus.OK).body(null);
		return responseEntity;
		
	}
	
	//강사수정할정보보기: 경찬
	@RequestMapping(value="/showUpdateTutor",method = {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView updateTutorInfo(HttpSession session) throws FindException {
		
		String member_id = (String)session.getAttribute("loginInfo");
		ModelAndView model = new ModelAndView();
		List<Tutor> tutor = new ArrayList<>();	
		if (member_id == null) {
			
			throw new FindException("예외발생:로그인 안되어 있음");
			
		}
		try {
		
			tutor = service.showTutorInfo(member_id);
			model.setViewName("/updateTutor");
			model.addObject("tutor", tutor);
			
		} catch (FindException e) {
			
			e.printStackTrace();
		}
		
		return model;
	}
	
	
	
	
}
