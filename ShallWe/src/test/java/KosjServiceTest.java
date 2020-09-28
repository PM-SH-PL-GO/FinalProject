import static org.junit.Assert.assertNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.ReviewBean;
import com.shallwe.service.LectureService;
import com.shallwe.service.ReviewService;
import com.shallwe.vo.Lecture;

import lombok.extern.log4j.Log4j;


@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
	   "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	})

@Log4j
class KosjServiceTest {

	@Autowired
	ReviewService reviewService;

	@Autowired
	LectureService lectureService;

	@Test
	@DisplayName("ReviewService TEST : insertReview method")
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
			reviewService.insertReview(reviewBean);
			
		} catch (AddException e) {
			e.printStackTrace();
		}
		
	} // end of insertReviewService TEST()
	
	
	/**
	 * @author Soojeong
	 * @return 
	 * @Param : String searchText
	 * 			String [] searchKey = {"all", "tutor_name", "lecture_title" , "category" };
	 * 			0 , 1 , 2 , 3 보내면 됨.
	 */
	//@Test
	@DisplayName("lectureSearchService TEST : 메인->검색조건 : all")
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
		
		ModelAndView modelAndView = new ModelAndView();
		try {
			modelAndView = lectureService.searchLecture(map);
			assertNull(modelAndView);
			
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
	@DisplayName("insertMemberLectureHistoryService TEST ")
	void insertMemberLectureHistory() throws AddException {
//		
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		String lectureCategoryId = "SP";
//		String memberId = "member1";
//		int lectureId =3;
//		map.put("lectureCategoryId", lectureCategoryId);
//		map.put("memberId", memberId);
//		map.put("lectureId", lectureId);
		
		List<Lecture> lectureList = new ArrayList<Lecture>();
//		try {
//			int result = lectureService.insertMemberLectureHistory(lectureList);
//			log.info("lectureService : " + result);
//			
//		} catch (AddException e) {
//			e.printStackTrace();
//			log.info(e.getMessage());
//		}
	} // end insertMemberLectureHistory();
	
	/**
	 * @author Soojeong
	 * 강의결제취소
	 */
	//@Test
	@DisplayName("updateMemberLectureHistoryService TEST ")
	void updateMemberLectureHistory() throws ModifyException {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		String lectureCategoryId = "MA";
		String memberId = "member1";
		int lectureId =1;
		map.put("lectureCategoryId", lectureCategoryId);
		map.put("memberId", memberId);
		map.put("lectureId", lectureId);
		
		try {
			lectureService.updateMemberLectureHistory(map);
			
		} catch (ModifyException e) {
			e.printStackTrace();
			log.info(e.getMessage());
		}
	} // end insertMemberLectureHistory();
	

}
