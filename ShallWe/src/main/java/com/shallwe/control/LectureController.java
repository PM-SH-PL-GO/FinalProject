package com.shallwe.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.exception.ModifyException;
import com.shallwe.service.LectureService;
import com.shallwe.service.ReviewService;
import com.shallwe.service.TutorService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;
import com.shallwe.vo.Review;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/lectures/*")
public class LectureController {
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	// 회원 : 강의 검색, 강의 세부정보 조회
	// 강사 : 강의 등록/수정/취소, 등록한 강의 조회
	@Autowired
	LectureService service;
	
	@Autowired
	ReviewService reserv;

	@Autowired
	TutorService tutoser;

    @Autowired
    ServletContext context;
    
	public String saveLectFile(MultipartFile file) {
		// 파일 용량은 루트 컨텍스트에서 확인이 가능함
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		String lectUploadPath = context.getRealPath("/files/lecture");
		// 파일 중복 되지 않기 위해 사용함
		File saveFile = new File(lectUploadPath, saveName);
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveName;
	}
	
	public String saveFile(MultipartFile file) {
		// 파일 용량은 루트 컨텍스트에서 확인이 가능함
		UUID uuid = UUID.randomUUID();
		String saveName = uuid + "_" + file.getOriginalFilename();
		String lectUploadPath = context.getRealPath("/files/lectureDetail");
		File saveFile = new File(lectUploadPath, saveName);
		try {
			file.transferTo(saveFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return saveName;
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
		
		String lectDownPath = context.getRealPath("/files/lectureDetail");
		OutputStream os = response.getOutputStream();
		FileInputStream fis = null;
		File f = new File(lectDownPath, fileName);
		fis = new FileInputStream(f);
		byte[] bArr = new byte[8*1024];
		int len = -1;
		while( (len = fis.read(bArr)) != -1){
			os.write(bArr, 0, len);
		}
		fis.close();
		os.close();
	}
	
	// 강사 강의 등록 페이지 : 동일
	@GetMapping(value = "/insert")
	public ModelAndView insertView(HttpSession session) {
		ModelAndView mnv = new ModelAndView();
		List<Tutor> tutorlist = new ArrayList<>();
		String tutor_id = (String) session.getAttribute("loginInfo");
		try {
			tutorlist = tutoser.showTutorInfo(tutor_id);
			mnv.setViewName("/lectureRegistration");
			mnv.addObject("tutorlist", tutorlist);
		} catch (FindException e) {
			e.printStackTrace();
		}
		return mnv;
	}

	// 강사 강의 등록 : 동일
	@PostMapping(value = "/insert")
	public ModelAndView insertLecture(LectureDetail lectDe, MultipartFile lecture_img, MultipartFile lecture_filename) {
		ModelAndView mnv = new ModelAndView();
		String lect_img = saveLectFile(lecture_img);
		String lect_fil = saveFile(lecture_filename);
		lectDe.getLecture().setLecture_img(lect_img);
		lectDe.setLecture_fileName(lect_fil);
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
	
	// 강사 강의 취소 요청 : 동일
		@GetMapping(value = "/tutorcancelLecture")
		public ModelAndView tutorcancelview(HttpSession session, @RequestParam(value = "lecture_id", required = false) Integer lecture_id) {
			ModelAndView mnv = new ModelAndView();
			String id = (String) session.getAttribute("loginInfo");
			Member mem = new Member();
			Tutor tutor = new Tutor();
			Lecture lect = new Lecture();
			LectureDetail lectDetail = new LectureDetail();
			mem.setMember_id(id);
			tutor.setMember(mem);
			lect.setTutor(tutor);
			lect.setLecture_id(lecture_id);
			try {
			lectDetail = service.lectureDetailView(lect);
			mnv.setViewName("/lecturepopup");
			mnv.addObject("lectDetail", lectDetail);
			} catch (FindException e) {
				e.printStackTrace();
				mnv.setViewName("/lecturepopup");
			}
			return mnv;
		}
	
	// 강사 강의 취소 요청 : 동일
		@PostMapping(value = "/tutorcancelLecture")
		public ModelAndView tutorcancelLecture(LectureDetail lectDe) {
			ModelAndView mnv = new ModelAndView();
			try {
				service.tutorcancelLecture(lectDe.getLecture(), lectDe);
				mnv.setViewName("/success");
				mnv.setViewName("/lecturepopup");
			} catch (ModifyException e) {
				e.printStackTrace();
				mnv.setViewName("/fail");
				mnv.setViewName("/lecturepopup");
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
		List<Review> relist = new ArrayList<Review>();
		mem.setMember_id(id);
		mlth.setMember(mem);
		Map<String, String> map = new HashMap<String, String>();
		try {
			mlthlist = service.memberLectureList(mlth);
			mnv.addObject("mlthlist", mlthlist);
			relist = reserv.selectReviewByMemberId(id);
			mnv.addObject("relist", relist);
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
		MemberLectureHistory mlth = new MemberLectureHistory();
		Lecture lect = new Lecture();
		LectureDetail lectDetail = new LectureDetail();
		mem.setMember_id(id);
		List<MemberLectureHistory> mlthlist = new ArrayList<>();
		tuto.setMember(mem);
		List<Tutor> tutorlist = new ArrayList<>();
		lecttuto.setTutor(tuto);
		List<Lecture> lectlist = new ArrayList<>();
		mlth.setMember(mem);
		lect.setLecture_id(lecture_id);
		lectDetail.setLecture(lect);
		List<Lecture> wishlist = new ArrayList<>();
		try {
			lectDetail = service.lectureDetailView(lect);
			mnv.addObject("lectDetail", lectDetail);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e) {
			e.printStackTrace();
			mnv.setViewName("/lectureDetail");
		}
		try {
			mlthlist = service.memberLectureList(mlth);
			mnv.addObject("mlthlist", mlthlist);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e1) {
			e1.printStackTrace();
			mnv.addObject("mlthlist", new ArrayList<MemberLectureHistory>());
			mnv.setViewName("/lectureDetail");
		}
		try {
			wishlist = service.findWishListById(id);
			mnv.addObject("wishlist", wishlist);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e1) {
			e1.printStackTrace();
			mnv.addObject("wishlist", new ArrayList<Lecture>());
			mnv.setViewName("/lectureDetail");
		}
		try {
			lectlist = service.tutorLectureList(lecttuto);
			mnv.addObject("lectlist", lectlist);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e1) {
			e1.printStackTrace();
			mnv.addObject("lectlist", new ArrayList<Lecture>());
			mnv.setViewName("/lectureDetail");
		}
		try {
			tutorlist = tutoser.showTutorInfo(id);
			mnv.addObject("tutorlist", tutorlist);
			System.out.println("강사!"+tutorlist);
			mnv.setViewName("/lectureDetail");
		} catch (FindException e1) {
			e1.printStackTrace();
			mnv.addObject("tutorlist", new ArrayList<Tutor>());
			mnv.setViewName("/lectureDetail");
		}
		return mnv;
	}
	
	@RequestMapping(value = "/searchResult", method = RequestMethod.GET)
	public void searchResult() {
		System.out.println("searchResult.jsp  호출");
	}
	
	@RequestMapping(value = "/search", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView search(@RequestParam(value="searchKey", required=false) String searchKeyParam
							 , @RequestParam(value="searchText", required=false)String searchText
							 , HttpSession session ) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		if ( searchKeyParam == null ) {
			searchKeyParam = "0";
		} else if ( searchText == null )  {
			searchText = " ";
		}
		
		// 검색조건 요청 잘못 들어온 경우 처리
		int searchKey = Integer.parseInt(searchKeyParam);
		String [] searchKeyArr = {"all", "tutor_name", "lecture_title" , "category" };
		map.put("searchKey", searchKeyArr[searchKey]);
		map.put("searchText", searchText);
		
		ModelAndView modelAndView = new ModelAndView();
		String member_id = (String)session.getAttribute("loginInfo");
		modelAndView.addObject("loginUser", member_id);
		
		List<Lecture> list = new ArrayList<Lecture>();
		try {
			list = service.searchLecture(map);
			log.info(modelAndView.getModelMap()); 
			modelAndView.addObject("list", list);
			modelAndView.setViewName("/searchResult");
			
		} catch (FindException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
}
