package com.shallwe.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.service.LectureService;
import com.shallwe.vo.Lecture;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping(value = "/member/*")
public class WishListController {
	private static final Logger Logger = LoggerFactory.getLogger(MemberController.class);

	// 회원 : 강의 검색, 강의 세부정보 조회
	// 강사 : 강의 등록/수정/취소, 등록한 강의 조회
	@Autowired
	LectureService service;
	
    @Autowired
    ServletContext context;
    
	// 장바구니 보기 : 상하

	@RequestMapping(value = "wishlist")
	public String WishView(HttpSession session, Model model) throws FindException {
//		String member_id = (String) session.getAttribute("loginInfo");
		String member_id = "member2"; 
		List<Lecture> wishall = new ArrayList<>();
		try {
			 wishall = service.findWishListById(member_id);
			model.addAttribute("wishListVal", wishall);
			return "/wishlist";
		} catch (FindException e) {
			e.printStackTrace();
			Logger.info("error");
			return "fail";
		}

	}
	
	// 장바구니 담기 : 상하
	@RequestMapping(value="wishlist/addWish")
	public String addWish(@RequestParam(value="lecture_id")String lecture_id, HttpSession session, Model model) throws AddException{
//		String member_id = (String)sessoin.getAttribute("loginInfo");
		String member_id ="member1";
		if(member_id!=null) {
			Map<String, Object>map = new HashMap<String,Object>();
			map.put("member_id",member_id);
			map.put("lecture_id",lecture_id);
			service.addWishOne(map);
		}
		return "wishlist";
	}
	
	// 장바구니 개별 삭제 : 상하
	@RequestMapping(value="wishlist/deleteOne", method=RequestMethod.GET)
	public String delete(@RequestParam(value="lecture_id")String lecture_id, HttpSession session)throws RemoveException{
//		String member_id = (String)session.getAttribute("loginInfo");
		String member_id = "member2";
		if(member_id!=null) {
			Map<String, Object>map = new HashMap<String, Object>();
			map.put("member_id", member_id);
			map.put("lecture_id", lecture_id);
			service.deleteOneWishList(map);
		}
		return "wishlist";
	}
	
	
	// 장바구니 전체 삭제 : 상하
	@RequestMapping(value="wishlist/deleteAll", method=RequestMethod.GET)
		public String deleteAllWishList(HttpSession session) throws RemoveException {
//		String member_id = (String)session.getAttribute("loginInfo");
		String member_id = "member2"; 
		if(member_id!=null) {
			service.deleteAllWishList(member_id);
		}
		return "wishlist";
	}
}