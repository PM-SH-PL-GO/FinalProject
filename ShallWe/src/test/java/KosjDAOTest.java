import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.ReviewDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.ReviewBean;
import com.shallwe.vo.Lecture;

import lombok.extern.log4j.Log4j;


@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
	   "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	})

@Log4j
class KosjDAOTest {

	@Autowired
	ReviewDAO reviewDAO;

	@Autowired
	LectureDAO lectureDAO;

	//@Test
	@DisplayName("ReviewDAO TEST : insertReview method")
	void insertReviewDAOTest() {

//		파라미터로 전달 받을 값
		String review_content = "수강후기 내용테스트 1";
		int review_score = 100;
		int lecture_id = 1;
		String lecture_category_id = "SP";
		String member_id = "member1";
		
		ReviewBean reviewBean = new ReviewBean();
		reviewBean.setLectureCategoryId(lecture_category_id);
		reviewBean.setLectureId(lecture_id);
		reviewBean.setReviewScore(review_score);
		reviewBean.setMemberId(member_id);
		reviewBean.setReviewContent(review_content);
		
		try {
			reviewDAO.insertReview(reviewBean);
			
		} catch (AddException e) {
			e.printStackTrace();
		}
		
	} // end of insertReviewDAO TEST()
	
	//@Test
	@DisplayName("ReviewDAO TEST : deleteReviewDAOTest method")
	void deleteReviewDAOTest() {
//		파라미터로 전달 받을 값
		int lecture_id = 1;
		String lecture_category_id = "SP";
		String member_id = "member1";
		
		ReviewBean reviewBean = new ReviewBean();
		reviewBean.setLectureCategoryId(lecture_category_id);
		reviewBean.setLectureId(lecture_id);
		reviewBean.setMemberId(member_id);
		
		try {
			reviewDAO.deleteReivew(reviewBean);
			
		} catch (RemoveException e) {
			e.printStackTrace();
		}
		
	} // end of deleteReviewDAOTest TEST()
	
	
	/**
	 * @author Soojeong
	 * @Param : String searchText
	 * 			String [] searchKey = {"all", "tutor_name", "lecture_title" , "category" };
	 * 			0 , 1 , 2 , 3 보내면 됨.
	 */
	//@Test
	@DisplayName("lectureSearch TEST : 메인->검색조건 : all")
	void selectLectureListTest() throws FindException {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		// 입력 받은 검색어 param null값 처리
		String searchText = "S";
		if ( ("").equals(searchText) ) {
			searchText = " ";
		} 
		
		// 검색조건 요청 잘못 들어온 경우 처리
		int searchCondition = 0;
		if ( searchCondition > 3 ) {
			searchCondition = 0;
		}
		
		String [] searchKey = {"all", "tutor_name", "lecture_title" , "category" };
		map.put("searchKey", searchKey[searchCondition]);
		map.put("searchText", searchText);
		
		List<Lecture> list = new ArrayList<>();
				
		try {
			list = lectureDAO.selectLectureListBySearch(map);
			log.info("lecture 조회결과 : " + list.size());
			
		} catch (FindException e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		}
	}
	
	/**
	 * @author Soojeong
	 * 강의신청 후 결제
	 */
	//@Test
	@DisplayName("insertMemberLectureHistoryDAO TEST ")
	void insertMemberLectureHistory() throws AddException {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String lectureCategoryId = "SP";
		String memberId = "member1";
		int lectureId =1;
		map.put("lectureCategoryId", lectureCategoryId);
		map.put("memberId", memberId);
		map.put("lectureId", lectureId);
		
		try {
			lectureDAO.insertMemberLectureHistory(map);
			
		} catch (AddException e) {
			e.printStackTrace();
			log.info(e.getMessage());
		}
	} // end insertMemberLectureHistory();
	
	/**
	 * @author Soojeong
	 * 강의결제취소
	 */
	@Test
	@DisplayName("updateMemberLectureHistoryDAO TEST ")
	void updateMemberLectureHistory() throws ModifyException {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String lectureCategoryId = "SP";
		String memberId = "member1";
		int lectureId =1;
		map.put("lectureCategoryId", lectureCategoryId);
		map.put("memberId", memberId);
		map.put("lectureId", lectureId);
		
		try {
			lectureDAO.updateMemberLectureHistory(map);
			
		} catch (ModifyException e) {
			e.printStackTrace();
			log.info(e.getMessage());
		}
	} // end insertMemberLectureHistory();
	

}
