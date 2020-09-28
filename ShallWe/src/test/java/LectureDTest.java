import java.util.Calendar;
import java.util.Date;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.dao.MemberLectureHistoryDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml" })
@Log4j
public class LectureDTest {
	@Autowired
	private LectureDAO dao;
	@Autowired
	private LectureDetailDAO ddao;
	@Autowired
	private MemberLectureHistoryDAO mlhdao;

//	@Test
	void testInsertD() {
		Lecture lect = new Lecture();
		LectureCategory lectCate = new LectureCategory();
		LectureDetail lectDe = new LectureDetail();
		Tutor tutor = new Tutor();
		Member member = new Member();
		Calendar cal = Calendar.getInstance();
		Date d = new Date(cal.getTimeInMillis());

		member.setMember_id("member2");
		tutor.setMember(member);
		lect.setTutor(tutor);
		lectCate.setLecture_category_id("SP");

		tutor.setLectureCategory(lectCate);
		lect.setLectureCategory(lectCate);
		lect.setLecture_img("TEST_img");
		lect.setLecture_title("TEST_title");
		lect.setLecture_price(0);
		lect.setLecture_state("승인대기");

		lect.setLecture_start_dt(d);
		lect.setLecture_end_dt(d);
		lect.setLecture_max(10);
		lect.setLecture_min(3);
		try {
			dao.insert(lect);
		} catch (AddException e) {
			e.printStackTrace();
		}

	}

//	@Test
	void testInsertDetail() {
		Lecture lect = new Lecture();
		LectureCategory lectCate = new LectureCategory();
		LectureDetail lectDe = new LectureDetail();
		lectCate.setLecture_category_id("SP");
		lect.setLectureCategory(lectCate);
		lect.setLecture_id(5);
		lectDe.setLecture(lect);
		lectDe.setLecture_introduce("test_intro");
		lectDe.setLecture_curriculum("test_curriculum");
		lectDe.setLecture_prepared("test_pre");
		lectDe.setLecture_caution("test_caution");
		lectDe.setLecture_fileName("fileName");
		lectDe.setLecture_location("location");
		try {
			ddao.insertDetail(lectDe);
		} catch (AddException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

//	@Test
	void testUpdateD() {
		Lecture lect = new Lecture();
		LectureCategory lectCate = new LectureCategory();
		Calendar cal = Calendar.getInstance();

		lect.setLecture_id(5);
		lectCate.setLecture_category_id("SP");
		lect.setLectureCategory(lectCate);
		lect.setLecture_img("update_img111");
		lect.setLecture_title("update_title1");
		lect.setLecture_price(119);

		Date d = new Date(cal.getTimeInMillis());

		lect.setLecture_start_dt(d);
		lect.setLecture_end_dt(d);
		lect.setLecture_max(11);
		lect.setLecture_min(4);
		try {
			dao.update(lect);
		} catch (ModifyException e) {
			e.printStackTrace();
		}

	}

//	@Test
	void testUpdateDetail() {
		Lecture lect = new Lecture();
		LectureDetail lectDe = new LectureDetail();
		lect.setLecture_id(5);
		lectDe.setLecture(lect);
		lectDe.setLecture_introduce("update_intro145");
		lectDe.setLecture_curriculum("update_curriculum");
		lectDe.setLecture_prepared("update_pre");
		lectDe.setLecture_caution("update_caution");
		lectDe.setLecture_fileName("fileName2");
		lectDe.setLecture_location("location2");

		try {
			ddao.updateDetail(lectDe);
		} catch (ModifyException e) {
			e.printStackTrace();
		}

	}

//	@Test
	void testcancelRequestD() {
		Lecture lect = new Lecture();
		lect.setLecture_state("취소대기");
		lect.setLecture_id(5);
		try {
			dao.cancelRequest(lect);
		} catch (ModifyException e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	void slectTest() {
		try {
			Lecture lect = new Lecture();
			Member mem = new Member();
			MemberLectureHistory mlh = new MemberLectureHistory();
			mem.setMember_id("member2");
			mlh.setMember(mem);
			mlhdao.memberMyClassList(mlh);
//			dao.tutorMyClassList();
		} catch (FindException e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	void slecttutorTest() {
		try {
			Lecture lect = new Lecture();
			Member mem = new Member();
			Tutor tu = new Tutor();
			mem.setMember_id("member3");
			tu.setMember(mem);
			lect.setTutor(tu);
			dao.tutorMyClassList(lect);
		} catch (FindException e) {
			e.printStackTrace();
		}
	}
	
//	@Test
	void leDeview() {
		Lecture lect = new Lecture();
		lect.setLecture_id(2);
		try {
			ddao.lectureDetailView(lect);
		} catch (FindException e) {
			e.printStackTrace();
		}
	}
}
