package com.shallwe.control;

import java.util.ArrayList;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.net.ssl.SSLEngineResult.Status;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.model.ReviewBean;
import com.shallwe.service.LectureService;
import com.shallwe.service.MemberSerivce;
import com.shallwe.service.ReviewService;
import com.shallwe.service.TutorService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Review;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value = "/member/*")
@Log4j
public class MemberController {
	
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);
	
	// 회원 : 내 정보 조회/수정, 강의 조회/신청/삭제
	@Autowired
	MemberSerivce service;
	@Autowired
	TutorService tutorService;
	
	@Autowired
	LectureService lectureService;

	@Autowired
	ReviewService reviewService;
	
	//회원가입get방식 : 상하
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String getSignup(Locale locale, Model model)throws Exception {
		System.out.println("get signup controller connected");
		
		return "/signup";
	}
	// 회원가입post방식: 상하
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	@ResponseBody
	public String postSignup(MemberInfoBean mib) throws AddException {
		Logger.info("post sign up controller connected");
		service.memberJoin(mib);
		return "success";
	}

<<<<<<< Updated upstream
//	//아이디 중복체크: 상하
//	public int memberChkId(MemberInfoBean mib) {
//		int result = 0;
//		String col = null;
//		col="memberId";
//		MemberInfoBean userIdCheck = service.getMemberId(mib.getMemberId(), col);
//		if(userIdCheck != null) {
//			result=2;
//		}
////		if(result<2) {
////			result=service.memberJoin(mib);
////		}
//		return result;
//	}
=======
	@RequestMapping(value = "/userLogin", method = RequestMethod.GET)
	public String uerLogin(Locale locale, Model model) {
		System.out.println("userLogin");
		return "/userLogin";
	}
	
	//아이디 중복체크: 상하
	@RequestMapping(value="checkId", method = RequestMethod.POST)
	@ResponseBody
	public int signUpCheckId(MemberInfoBean mib)throws Exception{
		// null인지 아닌지.
//		MemberInfoBean mib = new MemberInfoBean(); 
		int result = service.signUpCheckId(mib);
		
		return result;
	}
	
>>>>>>> Stashed changes
	@ResponseBody
	//멤버로그인:경찬
	@RequestMapping(value="/memberLogin",method=RequestMethod.POST)
	public ModelAndView memberLogin(HttpSession session, @RequestParam(value="member_id")String member_id,
														 @RequestParam(value="member_pwd")String member_pwd
												   ) {
		ModelAndView modelAndView = new ModelAndView();
		try {
			
			service.memberLogin(member_id, member_pwd);
			session.setAttribute("loginInfo", member_id);
			modelAndView.setViewName("/success");
			modelAndView.addObject("status","success");
			
		} catch (FindException e) {
			
			modelAndView.setViewName("/fail");
			modelAndView.addObject("errMsg",e.getMessage());
			e.printStackTrace();
		}
		return modelAndView;
	}
	//멤버로그아웃:경찬
	@RequestMapping(value="/memberLogout",method=RequestMethod.POST)
	public ResponseEntity<String> memberLogout(HttpSession session) {
		
		ModelAndView modelAndView = new ModelAndView();
		
		session.removeAttribute("loginInfo");
		
		
		return ResponseEntity.status(HttpStatus.OK).body("로그아웃성공");
	
	}
	
	//비밀번호체인지(로그인x)
	@RequestMapping(value="/changePassword",method=RequestMethod.POST)
	public ModelAndView changePassword(@RequestParam Map<String,Object>member,Model model) {
		
		ModelAndView modelAndView = new ModelAndView();
		try {
			
			service.changePwd(member);
			modelAndView.setViewName("/success");
			
		} catch (ModifyException e) {
			modelAndView.setViewName("/fail");
			modelAndView.addObject("errMsg",e.getMessage());
			e.printStackTrace();
		}
		
		return modelAndView;
		
	}
	
	//강사 여부 확인하기
	@RequestMapping("/tutorYN")
	public ResponseEntity<List<Tutor>> tutorYN(HttpSession session){
		String member_id = (String)session.getAttribute("loginInfo");
		List<Tutor> t =null;
		try {
			 t = tutorService.showTutorInfo(member_id);
				return ResponseEntity.status(HttpStatus.OK).body(t);
		} catch (FindException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(t);
		}
		
	}
	
	// myInfo 정보 조회
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public ModelAndView myinfo(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		String member_id = (String)session.getAttribute("loginInfo");
		modelAndView.addObject("member_id", member_id);
		
		// 나의 강의 목록 조회
		List<Lecture> lectureList = new ArrayList<>();
		try {
			lectureList = lectureService.selectLectureListByMemberId(member_id);
			modelAndView.addObject("lectureList", lectureList);
		} catch (FindException e) {
			e.printStackTrace();
		}
		
		// myInfo
		MemberInfoBean myInfo = new MemberInfoBean();
		try {
			myInfo = service.findById(member_id);
			modelAndView.addObject("myInfo", myInfo);
			log.info(myInfo);
			
		} catch (FindException e) {
			e.printStackTrace();
		} finally {
			modelAndView.setViewName("/myinfo");
		}
		return modelAndView;
	}
	
	// member 정보 수정 화면 정보에 데이터 보내기
	@RequestMapping(value = "/myinfoModi", method = RequestMethod.GET)
	public ModelAndView myinfoModi(HttpSession session) {
		ModelAndView modelAndView = new ModelAndView();
		String member_id = (String)session.getAttribute("loginInfo");
		modelAndView.addObject("member_id", member_id);
		
		// myInfo
		MemberInfoBean myInfo = new MemberInfoBean();
		try {
			myInfo = service.findById(member_id);
			modelAndView.addObject("myInfo", myInfo);
			log.info(myInfo);
			
		} catch (FindException e) {
			e.printStackTrace();
		} finally {
			modelAndView.setViewName("/myinfoModi");
		}
		return modelAndView;
	}
	
	// member 정보 수정 비즈니스로직 처리
	@RequestMapping(value = "/myinfoModify", method = RequestMethod.GET)
	public ModelAndView myinfoModify(HttpSession session , @RequestParam (value="memberPhone", required=false) String memberPhone
			, @RequestParam (value="memberEmail" , required=false) String memberEmail
			, @RequestParam (value="memberPassword" , required=false) String memberPassword
			, @RequestParam (value="favorite_list" , required=false) Map<String, String> favorite_list) {
		
		String memberId = (String)session.getAttribute("loginInfo");

		try {
			if (memberPhone != null) {
				service.updatePhone(memberId, memberPhone);
			} else if (memberEmail != null) {
				service.updatePhone(memberId, memberEmail);
			} else if (memberPassword != null) {
				service.updatePhone(memberId, memberPassword);
			} else if (favorite_list.size() > 0 ) {
				service.updateFavorites(memberId, favorite_list);
			}
		} catch (ModifyException e) {
			e.printStackTrace();
		}
			
		ModelAndView modelAndView = new ModelAndView();

		return modelAndView;
	}
	
	
	// 강의 후기 등록 화면 요청
	// 고수정 : 후기 등록
	@RequestMapping(value = "/reviewAdd", method = RequestMethod.GET)
	public ModelAndView reviewAdd(HttpSession session, @RequestParam (value="lecture_id") String lecture_id) throws FindException {
		String member_id = (String)session.getAttribute("loginInfo");
		Lecture lecture = new Lecture();

		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		
		} catch (FindException e) {
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("lecture", lecture);
		modelAndView.addObject("member_id", member_id);
		modelAndView.setViewName("/reviewAdd");
		
		return modelAndView;
	}
	
	// 강의 후기 등록 비즈니스 로직
	// 고수정 : 후기 등록
	@RequestMapping(value = "/reviewAddmethod", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertReview(HttpSession session, @RequestBody ReviewBean reviewBean ) throws AddException {
		if ( reviewBean.getMemberId() == null ) {
			String memberId = (String)session.getAttribute("loginInfo");
			reviewBean.setMemberId(memberId);
		} 
		
		ModelAndView modelAndView = new ModelAndView();
		try {
			reviewService.insertReview(reviewBean);
			modelAndView.setViewName("/reviewAdd");
			
		} catch (AddException e) {
			e.printStackTrace();
			modelAndView.addObject("errMsg", e.getMessage());
		}
		return modelAndView;
	}
	
	
	//--- review 강사별, 카테고리별 후기 조회
	@RequestMapping(value = "/reviewList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView selectReviewList(String tutor_id , String category_id) throws AddException {
		if ( tutor_id == null && "".equals(tutor_id) ) {
			tutor_id = "member3";
		} else if (category_id == null && "".equals(category_id)) {
			category_id = "MA";
		}
		List<Review> list = new ArrayList<Review>();
		ModelAndView modelAndView = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("tutor_id", tutor_id);
		map.put("category_id", category_id);
		try {
			list = reviewService.selectReview(map);
			modelAndView.addObject("list", list);
			modelAndView.setViewName("/reviewList");
			
		} catch (FindException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	//--- member별 review 조회
	@RequestMapping(value = "/memberReviewList", method = RequestMethod.GET)
	@ResponseBody
	public ModelAndView selectMemberReviewLsist(HttpSession session) throws AddException {

		String member_id = (String)session.getAttribute("loginInfo");
		List<Review> list = new ArrayList<Review>();
		ModelAndView modelAndView = new ModelAndView();
	
		try {
			list = reviewService.selectReviewByMemberId(member_id);
			modelAndView.addObject("list", list);
			modelAndView.setViewName("/reviewList");
			
		} catch (FindException e) {
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	//--- review 삭제
	@RequestMapping(value = "/removeReview", method = RequestMethod.GET)
//	public ModelAndView removeReview(
	public ResponseEntity<String> removeReview(HttpSession session, @RequestParam(value="lecture_id") String lecture_id	) throws RemoveException {
		Lecture lecture = null;
		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		} catch (FindException e1) {
			e1.printStackTrace();
		}
		String member_id = (String)session.getAttribute("loginInfo");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("lectureCategoryId", lecture.getLectureCategory().getLecture_category_id());
		map.put("member_id", member_id);
		map.put("lecture_id", lecture_id);
		map.put("tutor_id", lecture.getTutor().getMember().getMember_id());
		
		try {
			reviewService.removeReview(map);
			return ResponseEntity.status(HttpStatus.OK).body("success");
			
		} catch (RemoveException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("fail : "+e.getMessage());
		}
		//return modelAndView;
	}
	
	
	// 강의결제 등록
	// 고수정
	@RequestMapping(value = "/insertMemberLectureHistory", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView insertMemberLectureHistory( HttpSession session, @RequestParam(value="lecture_id") String lecture_id
	) throws AddException {
		
		log.info(" insertMemberLectureHistory 호출했어용~");
		String member_id = (String)session.getAttribute("loginInfo");
		Lecture lecture = new Lecture();
		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		} catch (FindException e1) {
			e1.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("lecture_category_id", lecture.getLectureCategory().getLecture_category_id());
		map.put("lecture_id", lecture_id);
		map.put("member_id", member_id);
		
		ModelAndView modelAndView = new ModelAndView();
		try { 
			lectureService.insertMemberLectureHistory(map);
			modelAndView.setViewName("/success");
		
		} catch (AddException e) {
			modelAndView.addObject("errMsg", e.getMessage());
			modelAndView.setViewName("/fail");
			e.printStackTrace();
		}
		return modelAndView;
	}
	
	// 강의결제 취소
	// 고수정
	@RequestMapping(value = "/updateMemberLectureHistory", method = RequestMethod.GET)
	public ResponseEntity<String> updateMemberLectureHistory( HttpSession session, @RequestParam(value="lecture_id") String lecture_id
	) throws ModifyException {
		//ModelAndView modelAndView = new ModelAndView();

		String member_id = (String)session.getAttribute("loginInfo");
		Lecture lecture = new Lecture();
		try {
			lecture = lectureService.searchLectureByLectureId(lecture_id);
		} catch (FindException e1) {
			e1.printStackTrace();
		}
		
		Map <String, Object> map = new HashMap<String, Object>();
		map.put("lecture_category_id", lecture.getLectureCategory().getLecture_category_id());
		map.put("memberId", member_id);
		map.put("lectureId", lecture_id);
		
		try { 
			lectureService.updateMemberLectureHistory(map);
			return ResponseEntity.status(HttpStatus.OK).body("success");
			
		} catch (ModifyException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("fail : "+e.getMessage());
		}
	}
	
	
	
	
}
