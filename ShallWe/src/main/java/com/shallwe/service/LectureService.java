package com.shallwe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.dao.MemberLectureHistoryDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.MemberLectureHistory;

import lombok.extern.log4j.Log4j;

@Log4j
@Service(value = "lectureService")
public class LectureService {

	@Autowired
	LectureDAO lectureDAO;
	@Autowired
	LectureDetailDAO lectureDetailDAO;
	@Autowired
	MemberLectureHistoryDAO memberLectureHistoryDAO;

	/**
	 * @author Soojeong
	 * @강의 검색 searchKey = {"0:all", "1:tutor_name", "2:lecture_title" , "3:category"
	 *     };
	 * @Param searchKey, searchText 담은 HashMap<String, Object>
	 * @return List<Lecture>
	 * @throws FindException
	 */
	public ModelAndView searchLecture(HashMap<String, Object> map) throws FindException {
		List<Lecture> list = new ArrayList<>();
		ModelAndView modelAndView = new ModelAndView();

		try {
			list = lectureDAO.selectLectureListBySearch(map);

			modelAndView.addObject("list", list);
			modelAndView.addObject("status", "success");

		} catch (FindException e) {
			modelAndView.addObject("status", "fail");
			modelAndView.addObject("errMsg", e.getMessage());
		}

		return modelAndView;
		
	}
	
	//강의 등록 : 동일
	@Transactional
	public void insertLecture(Lecture lect, LectureDetail lectDe) throws AddException {
		try {
			lectureDAO.insert(lect);
			lectureDetailDAO.insertDetail(lectDe);
		} catch (AddException e) {
			e.printStackTrace();
		}
	}
	
	//수강 강의 조회 : 동일
	public List<MemberLectureHistory> memberLectureList(MemberLectureHistory mlth) throws FindException{
		return memberLectureHistoryDAO.memberMyClassList(mlth);
	}
	
	//강의 상세 조회 : 동일
	public LectureDetail lectureDetailView(Lecture lect) throws FindException {
		return lectureDetailDAO.lectureDetailView(lect);
	}
	
	/**
	 * 강의신청 후 결제
	 * 
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws AddException
	 */
	public int  insertMemberLectureHistory(List<Lecture> lectureList) throws AddException {
		int result = 0;
		
		String member_id = "member2";
		try {
			if ( lectureList.size() > 0 ) {
				for (Lecture lecture : lectureList ) {
					Map<String, Object> map = new HashMap<String, Object>();
					
					log.info ("memberId : " + member_id + " : lectureCategoryid : " +lecture.getLectureCategory().getLecture_category_id()   ); 
					map.put("memberId", member_id);
					map.put("lectureCategoryId", lecture.getLectureCategory().getLecture_category_id());
					map.put("lectureId", lecture.getLecture_id());
					result+= lectureDAO.insertMemberLectureHistory(map);
				}
			} else { // lectureList 목록이 없을 때  0 값 반환
				return result;
			}
			
		} catch (AddException e) {
			throw new AddException(e.getMessage());
		}
		return result;
	}

	/**
	 * 강의결제취소
	 * 
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws ModifyException
	 */
	public int updateMemberLectureHistory(HashMap<String, Object> map) throws ModifyException {
		int result = 0;
		try {
			result = lectureDAO.updateMemberLectureHistory(map);
		} catch (ModifyException e) {
			throw new ModifyException(e.getMessage());
		}
		return result;
	}
	

}
