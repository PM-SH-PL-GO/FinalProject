import java.util.HashMap;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.MemberDAO;
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;


@Log4j
@ExtendWith(SpringExtension.class)
@ContextConfiguration({"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"})

public class MemberTest {
	
	@Autowired MemberDAO dao;
	@Autowired TutorDAO dao1;
	
	//@Test
	public void 비밀번호변경() {
		
		Member member = new Member();
		HashMap<String,Object>map = new HashMap();
		
		map.put("member_id", "member1");
		map.put("member_pwd", "1111");
		map.put("member_phone", "000-0000-0000");
		
			try {
				
				dao.changePwd(map);
				
			} catch (ModifyException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	
	@Test
	public void 강사등록() {
		
		Member member = new Member();
		Tutor tutor1 = new Tutor();
		Integer score = 89;
		HashMap<String,Object>tutor = new HashMap();
		LectureCategory lectureCategory1 = new LectureCategory();
		LectureCategory lectureCategory2 = new LectureCategory();
		LectureCategory lectureCategory3 = new LectureCategory();
		
		lectureCategory1.setLecture_category_id("KING");
		lectureCategory2.setLecture_category_id("DB");
		lectureCategory3.setLecture_category_id("PB");
		
		member.setMember_id("member2");
		
		tutor1.setMember(member);
		tutor1.setLectureCategory(lectureCategory1);
		tutor1.setLectureCategory(lectureCategory2);
		tutor1.setLectureCategory(lectureCategory3);
		tutor1.setTutor_img("tutor2_test.jpg");
		tutor1.setTutor_career_file("tutor4_test.gif");
		tutor1.setTutor_introduce("hi");
		tutor1.setTutor_link("instagram");
		tutor1.setTutor_nickname("카드값죠체리");
		tutor1.setTutor_score(score);
		
		tutor.put("tutor",tutor1);
		
		
		
		
	}
		
	}
	
