package com.shallwe.control;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

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

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/lectures")
public class LectureController {
	// 회원 : 강의 검색, 강의 세부정보 조회
	// 강사 : 강의 등록/수정/취소, 등록한 강의 조회
	@Autowired
	LectureService service;

	@Autowired
	private static final String LECT_UPLOAD_PATH = "/ShallWe/src/main/webapp/files/lecture";

	public String saveLectFile(MultipartFile file) {
		// 파일 용량은 루트 컨텍스트에서 확인이 가능함
		UUID uuid = UUID.randomUUID();
		
		String saveName = uuid+"_"+ file.getOriginalFilename();
		//파일 중복 되지 않기 위해 사용함
		File saveFile = new File(LECT_UPLOAD_PATH,saveName);
	
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
	
		log.info( "이 업로드한 파일은" +file);
		log.info("이 업로드된 파일이다" + saveName);
		log.info("업로드된 파일의 경로는 " + LECT_UPLOAD_PATH);
		
		return saveName;
		
	}
	
	// 파일 배열로 받아와서 집어넣기: 경찬
		public  ResponseEntity<String> upload(MultipartFile[] uploadFiles) {
			
			String lectFile ="";
			for(MultipartFile f : uploadFiles) {
				
				lectFile += saveLectFile(f);
			}
			ResponseEntity<String> responseEntity = ResponseEntity.status(HttpStatus.OK).body(lectFile);
			return responseEntity;
			
		}
	// 강사 강의 등록 페이지 : 동일
	@GetMapping(value = "/insert")
	public String insertView() {
		return "/lectureRegistration";
	}

	// 강사 강의 등록 : 동일
	@PostMapping(value = "/insert")
	public ModelAndView insertLecture(Tutor tutor, HttpSession session, LectureDetail lectDe, MultipartFile lecture_img) throws AddException {
		ModelAndView mnv = new ModelAndView();
		String tutor_id = (String)session.getAttribute("loginInfo");
		Member m = new Member();
		m.setMember_id(tutor_id);
		String lect_img = saveLectFile(lecture_img);
		tutor.setMember(m);
		Lecture lecture = new Lecture();
		lecture.setTutor(tutor);
		lecture.setLecture_img(lect_img);
		lectDe.setLecture(lecture);
		try {
			service.insertLecture(lectDe.getLecture(), lectDe);
			mnv.setViewName("/success");
		} catch (AddException e) {
			e.printStackTrace();
			mnv.setViewName("/fail");
			mnv.addObject("errorMsg", e.getMessage());
		}
		return mnv;
	}

	// 학생 강의 조회 : 동일
	@RequestMapping(value = "/memberLecture")
	public ModelAndView memberLectureView(HttpSession session, MemberLectureHistory mlth) {
		String id = (String) session.getAttribute("loginInfo");
		List<MemberLectureHistory> mlthlist = new ArrayList<>();
		ModelAndView mnv = new ModelAndView();
		Member mem = new Member();
		mem.setMember_id(id);
		mlth.setMember(mem);
		try {
			mlthlist = service.memberLectureList(mlth);
			mnv.addObject("mlthlist", mlthlist);
			mnv.setViewName("/memberLectureList");
			mnv.addObject("status", "success");
		} catch (FindException e) {
			mnv.addObject("status", "fail");
			mnv.setViewName("/memberLectureList");
			mnv.addObject("errMsg", e.getMessage());
		}
		return mnv;
	}

	// 강사 강의 조회 : 동일
	@RequestMapping(value = "/tutorLecture")
	public ModelAndView tutorLectureView(HttpSession session, Lecture lect) {
		String id = (String) session.getAttribute("loginInfo");
		List<Lecture> lectlist = new ArrayList<>();
		ModelAndView mnv = new ModelAndView();
		Member mem = new Member();
		Tutor tutor = new Tutor();
		mem.setMember_id(id);
		tutor.setMember(mem);
		lect.setTutor(tutor);
		try {
			lectlist = service.tutorLectureList(lect);
			mnv.addObject("lectlist", lectlist);
			mnv.setViewName("/tutorLectureList");
			mnv.addObject("status", "success");
		} catch (FindException e) {
			mnv.addObject("status", "fail");
			mnv.setViewName("/tutorLectureList");
			mnv.addObject("errMsg", e.getMessage());
		}
		return mnv;
	}

	// 강의 상세 조회 : 동일
	@RequestMapping(value = "/detail")
	public ModelAndView detailView(HttpSession session, @RequestParam Integer lecture_id) {
		String id = (String) session.getAttribute("loginInfo");
		ModelAndView mnv = new ModelAndView();
		Member mem = new Member();
		Tutor tuto = new Tutor();
		Lecture lecttuto = new Lecture();
		LectureDetail lectDetuto = new LectureDetail();
		MemberLectureHistory mlth = new MemberLectureHistory();
		Lecture lect = new Lecture();
		LectureDetail lectDetail = new LectureDetail();
		mem.setMember_id(id);
		tuto.setMember(mem);
		lecttuto.setTutor(tuto);
		lectDetuto.setLecture(lecttuto);
		mlth.setMember(mem);
		lect.setLecture_id(lecture_id);
		lectDetail.setLecture(lect);
		try {
			lectDetail = service.lectureDetailView(lect);
			mnv.addObject("lectDetail", lectDetail);
			mnv.addObject("mlth", mlth);
			mnv.addObject("lectDetuto", lectDetuto);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e) {
			e.printStackTrace();
			mnv.setViewName("/lectureDetail");
		}

		return mnv;
	}
}
