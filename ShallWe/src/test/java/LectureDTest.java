import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.LectureDAO;
import com.shallwe.exception.AddException;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;
@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
})
@Log4j
public class LectureDTest {
	@Autowired
	private LectureDAO dao;
	
	@Test
	void testInsertD() {
		Lecture lect = new Lecture();
		LectureCategory lectCate = new LectureCategory();
		LectureDetail lectDe = new LectureDetail();
		Tutor tutor = new Tutor();
		Member member = new Member();
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
//		LectureDAO dao = new LectureDAO();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		member.setMember_id("member9");
		tutor.setMember(member);
		lect.setTutor(tutor);
		lectCate.setLecture_category_id("SP");
		lectCate.setLecture_category_name("Sport(스포츠)");
		tutor.setLecture_category(lectCate);
		lect.setLectureCategory(lectCate);
		lect.setLecture_img("TEST_img");
		lect.setLecture_title("TEST_title");
		lect.setLecture_price(0);
		lect.setLecture_state("승인대기");
		
		cal.add(Calendar.MONTH, 2);
		Date d = new Date(cal.getTimeInMillis());
		
		lect.setLecture_start_dt(d);
		lect.setLecture_end_dt(d);
		lect.setLecture_max(10);
		lect.setLecture_min(3);
		try {
			dao.insert(lect);
		} catch (AddException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
