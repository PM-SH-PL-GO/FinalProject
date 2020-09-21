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
import com.shallwe.model.ReviewBean;
import com.shallwe.service.LectureService;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;


@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {
	   "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	})

@Log4j
class KosjTest {

	@Autowired
	ReviewDAO reviewDAO;

	@Autowired
	LectureDAO lectureDAO;

	//@Test
	@DisplayName("ReviewDAO TEST : insertReview method")
	void insertReviewDAOTest() {
		ReviewBean reviewBean = new ReviewBean();
		reviewBean.setLecture_category_id("MA");
		reviewBean.setLecture_id(3);
		reviewBean.setMember_id("member2");
		reviewBean.setReview_score(55);
		
		try {
			reviewDAO.insertReview(reviewBean);
			
		} catch (AddException e) {
			e.printStackTrace();
		}
		
	} // end of insertReviewDAO TEST()
	
	
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
			if ( list.size() == 0  ) {
				throw new FindException("검색 결과가 없습니다.");
			}
			
		} catch (FindException e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		}
	}
	

}
