package test;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.shallwe.model.LectureSearchBean;
import com.shallwe.model.ReviewBean;

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
	
	
	@Test
	@DisplayName("lectureSearch TEST : insertReview method")
	void selectLectureListTest() throws FindException {
		
		Map map = new HashMap();
		map.put("lecture_tutor_id", "member2");
		
		List<LectureSearchBean> list = new ArrayList<>();
				
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
