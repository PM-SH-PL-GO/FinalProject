package com.shallwe.control;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.AdminTutorBean;
import com.shallwe.service.AdminService;
import com.shallwe.vo.Faq;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value="/admin")
public class AdminController {
	@Autowired
	AdminService adminService;

	@RequestMapping(value = "")
	public void admin() {
		System.out.println("Admin Index");
	}
	
	/**
	 * 전체 회원 목록 조회
	 * @author jun6
	 * @return 전체회원 목록
	 */
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> memberList() {
		try {
			List<Member> memberList = adminService.showAllMember();
			if (memberList != null && memberList.size() != 0) {
				System.out.println(memberList);
				return ResponseEntity.status(HttpStatus.OK).body(memberList);
			}else
				return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(null);
		}catch(FindException e) {
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(null);
		}
		
	}

	@DeleteMapping(value = "/member/{memberId}")
	public ResponseEntity<String> deleteMember(@PathVariable(name = "memberId") String member_id){
		
		return ResponseEntity.status(HttpStatus.OK).body("");
	}
	
	/////////////////////////강사 관리////////////////////////////
	
	/**
	 * 전체 회원 목록 조회
	 * @author jun6
	 * @return 전체회원 목록
	 */
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public ResponseEntity<List<Member>> userList() {
		try {
			List<Member> memberList = adminService.showAllMember();
			if (memberList != null && memberList.size() != 0) {
				System.out.println(memberList);
				return ResponseEntity.status(HttpStatus.OK).body(memberList);
			}else
				return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(null);
		}catch(FindException e) {
			System.out.println("ㅈ대따");
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(null);
		}
		
	}
	
	/**
	 * 예비강사/ 전체강사 목록 가져오기
	 * @author jun6
	 * @return
	 */
	@RequestMapping(value = "/tutor/list/{tutorYN}")
	public ResponseEntity<AdminTutorBean> preTutor(@PathVariable(name = "tutorYN")String YN) {
		AdminTutorBean tutorBean = null;
		try {
			tutorBean = adminService.showAllTutor(YN);
			return ResponseEntity.status(HttpStatus.OK).body(tutorBean);
		} catch (FindException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
	}
	
	/**
	 * 예비 강사 승인
	 * @author jun6
	 * @param id
	 * @param status
	 * @return
	 */
	@PatchMapping(value = "/tutor/status/{tutorId}")
	public ResponseEntity<String> tutorStatusChange(@PathVariable(value = "tutorId")String id, @RequestBody Map<String,String> map){
		
		String category = map.get("category");
		
		try {
			adminService.approvePreTutor(id, "승인", category);
			return  ResponseEntity.status(HttpStatus.OK).body("{\"status\" : \"정상적으로 승인 처리되었습니다\"}");
		}catch(Exception e) {
			e.printStackTrace();
			return (ResponseEntity<String>) ResponseEntity.status(HttpStatus.BAD_GATEWAY).body("{\"status\" : \"설정에 실패하였습니다\"}");
		}
	}

	/**
	 * 강사신청 반려시키기
	 * @param tutor_id
	 * @return
	 */
	@PostMapping(value = "/tutor/status/{tutorId}")
	public ResponseEntity<String> rejectTutor(@PathVariable(name = "tutorId") String tutor_id,
												String reject_reason, String reject_category_id, String category){
		try {
			adminService.rejectPreTutor(tutor_id, reject_reason, reject_category_id, category);
			return ResponseEntity.status(HttpStatus.OK).body("{ \"success\" : \"정상적으로 반려 처리되었습니다\"}");
		}catch(Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{ \"errMsg\" : \"" + e.getMessage() + "\"}");
		}
	}
	
	
	/**
	 * 특정 강사의 강의 목록 보여주기
	 * @param 강사의 id
	 * @return 강사의 강의 목록(title, state)
	 */
	@RequestMapping(value = "/tutor/lecture/{tutorId}")
	public ResponseEntity<List<Lecture>> tutorLectureList(@PathVariable(value = "tutorId") String tutor_id){
		List<Lecture> lectureList = new ArrayList<>();
		try {
			lectureList = adminService.showTutorLectureByTutorId(tutor_id);
		}catch(FindException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(lectureList);
		}
		
		return ResponseEntity.status(HttpStatus.OK).body(lectureList);
	}


	/////////////////////////강의 관리////////////////////////////
	
	/**
	 * 전체 강의 목록 조회하기
	 * @author jun6
	 * @return 전체 강의 목록
	 */
	@RequestMapping(value = "/lecture/list", method = RequestMethod.GET)
	public ResponseEntity<List<Lecture>> lectureList() {
		try {
			List<Lecture> lectureList = adminService.showAllLectures();
			return ResponseEntity.status(HttpStatus.OK).body(lectureList);
		}catch(FindException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_GATEWAY).body(null);
		}
	}
	
	
	/**
	 * 특정 강의를 수강중인 수강생 목록 조회
	 * @author jun6
	 * @param lecture_id
	 * @return 수강생 목록(MemberLectureHistory List)
	 */
	@GetMapping(value = "/history/{lectureId}")
	public ResponseEntity<List<MemberLectureHistory>> history(@PathVariable(name = "lectureId") String lecture_id){
		try {
			List<MemberLectureHistory> historyList = adminService.showMemberHistoryByLectureId(lecture_id);
			return ResponseEntity.status(HttpStatus.OK).body(historyList);
		}catch(FindException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
	}
	
	
	
	/**
	 * 강의 승인/반려/취소 하기
	 * @author jun6
	 * @param lecture_id
	 * @param status
	 * @return
	 */
	@PatchMapping(value = "/lecture/status/{lectureId}")
	public ResponseEntity<String> lectureStatusChange(@PathVariable(name = "lectureId") String lecture_id
													,@RequestBody Map<String, String> map){
		map.put("lecture_id", lecture_id);
		
		try {
			adminService.updateLectureStatusByIdAndStatus(map);
			return ResponseEntity.status(HttpStatus.OK).body("{ \"success\" : \"정상적으로 " + map.get("status") + " 처리하였습니다\"}");
		}catch(ModifyException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{\"errMsg\" : \"설정에 실패하였습니다\"}");
		}
	}
	
	/**
	 * 강의 취소/반려 사유 조회
	 * @author jun6
	 * @param 강의 ID
	 * @param 반려인지 취소인지
	 * @return
	 */
	@GetMapping(value = "/reason/{lectureId}")
	public ResponseEntity<LectureDetail> showLectureReason(@PathVariable(name = "lectureId") String lecture_id, String rejectOrCancel){
		try {
			LectureDetail lectureDetail = adminService.showLectureReason(lecture_id, rejectOrCancel);
			return ResponseEntity.status(HttpStatus.OK).body(lectureDetail);
		}catch(FindException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
	}
	
	/////////////////////////FAQ////////////////////////////
	
	/**
	 * FAQ 전체 조회
	 * @author jun6
	 * @return faq 전체 목록
	 */
	@RequestMapping(value = "/faq/list", method = RequestMethod.GET)
	public ResponseEntity<List<Faq>> faq() {
		List<Faq> faqList = null;
		
		try {
			faqList = adminService.showAllFaq();
			return ResponseEntity.status(HttpStatus.OK).body(faqList);
		}catch(FindException e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
	}
	
	/**
	 * FAQ 단일 개체 조회
	 * @param faq_id
	 * @return
	 */
	@GetMapping(value = "/faq/{faqId}")
	public ResponseEntity<Faq> selectFaqById(@PathVariable(name = "faqId") String faq_id){
		Faq faq = null;
		
		try {
			faq = adminService.selectFaqById(faq_id);
			return ResponseEntity.status(HttpStatus.OK).body(faq);
		}catch(FindException e) {
			return ResponseEntity.status(HttpStatus.OK).body(null);
		}
	}
	
	/**
	 * FAQ 추가하기
	 * @param faq
	 * @return
	 */
	@PostMapping(value = "/faq")
	public ResponseEntity<String> addFaq(Faq faq){
		try {
			adminService.addFaq(faq);
			return ResponseEntity.status(HttpStatus.OK).body("{ \"success\" : \"성공적으로 추가했습니다\" }");
		}catch(AddException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{ \"errMsg\" : \"" + e.getMessage() + "\" }");
		}
	}
	
	/**
	 * FAQ 수정하기
	 * @param faq
	 * @return
	 */
	@PutMapping(value = "/faq/{faqId}", consumes = "application/json; charset=utf-8;")
	public ResponseEntity<String> putFaq(@PathVariable(name = "faqId") String faq_id, @RequestBody Faq faq){
		try {
			faq.setFaq_id(Integer.parseInt(faq_id));
			adminService.updateFaq(faq);
			return ResponseEntity.status(HttpStatus.OK).body("{ \"success\" : \"수정에 성공하였습니다\"}");
		}catch(ModifyException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{ \"errMsg\" : \"" + e.getMessage() + "\"}");
		}
	}
	
	/**
	 * FAQ 삭제
	 * @param faq_id
	 * @return
	 */
	@DeleteMapping(value = "/faq/{faqId}")
	public ResponseEntity<String> deleteFaq(@PathVariable(name = "faqId") String faq_id){
		try {
			adminService.deleteFaq(faq_id);
			return ResponseEntity.status(HttpStatus.OK).body("{ \"success\" : \"성공적으로 삭제했습니다\" }");
		}catch(RemoveException e) {
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("{ \"errMsg\" : \"" + e.getMessage() + "\" }");
		}
	}
	
}
