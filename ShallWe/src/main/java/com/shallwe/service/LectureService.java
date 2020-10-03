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
import com.shallwe.dao.WishListDAO;
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
	@Autowired
	WishListDAO wishDAO;

	/**
	 * @author Soojeong
	 * @강의 검색 searchKey = {"0:all", "1:tutor_name", "2:lecture_title" , "3:category"
	 *     };
	 * @Param searchKey, searchText 담은 HashMap<String, Object>
	 * @return List<Lecture>
	 * @throws FindException
	 */
	public List<Lecture> searchLecture(HashMap<String, Object> map) throws FindException {
		List<Lecture> list = new ArrayList<>();
		try {
			list = lectureDAO.selectLectureListBySearch(map);

		} catch (FindException e) {
			throw new FindException(e.getMessage());
		}
		return list;
	}
	
	/**
	 * @author Soojeong
	 * @강의 검색 lecture_Id로 검색
	 * @Param String lecture_Id
	 * @return Lecture
	 * @throws FindException
	 */
	public Lecture searchLectureByLectureId(String lecture_id) throws FindException {
		Lecture lecture = new Lecture();
		try {
			lecture = lectureDAO.selectLectureByLectureId(lecture_id);
		} catch (FindException e) {
			throw new FindException(e.getMessage());
		}
		return lecture;
		
	}

	// 강의 등록 : 동일
	@Transactional
	public void insertLecture(Lecture lect, LectureDetail lectDe) throws AddException {
		try {
			lectureDAO.insert(lect);
			lectureDetailDAO.insertDetail(lectDe);
		} catch (AddException e) {
			e.printStackTrace();
		}
	}

	// 강의 수정 : 동일
	@Transactional
	public void updateLecture(Lecture lect, LectureDetail lectDe) throws ModifyException {
		try {
			lectureDAO.update(lect);
			lectureDetailDAO.updateDetail(lectDe);
		} catch (ModifyException e) {
			e.printStackTrace();
		}
	}

	// 강사 강의 취소 요청: 동일
	@Transactional
	public void tutorcancelLecture(Lecture lect, LectureDetail lectDe) throws ModifyException {
		try {
			lectureDAO.cancelRequest(lect);
			lectureDetailDAO.cancelRequest(lectDe);
		} catch (ModifyException e) {
			e.printStackTrace();
		}
	}

	// 학생 강의 조회 : 동일
	public List<MemberLectureHistory> memberLectureList(MemberLectureHistory mlth) throws FindException {
		return memberLectureHistoryDAO.memberMyClassList(mlth);
	}

	// 교사 강의 조회 : 동일
	public List<Lecture> tutorLectureList(Lecture lect) throws FindException {
		return lectureDAO.tutorMyClassList(lect);
	}

	// 강의 상세 조회 : 동일
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
	public int insertMemberLectureHistory(Map<String, Object> map) throws AddException {
		int result = 0;
		try {
			result = lectureDAO.insertMemberLectureHistory(map);

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
	public int updateMemberLectureHistory(Map<String, Object> map) throws ModifyException {
		int result = 0;
		try {
			result = lectureDAO.updateMemberLectureHistory(map);
		} catch (ModifyException e) {
			throw new ModifyException(e.getMessage());
		}
		return result;
	}

	public List<Lecture> findWishListById(String member_id) throws FindException {

		return wishDAO.selectWishListById(member_id);
	}

}
