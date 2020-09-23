package shallwe;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.FindException;
import com.shallwe.vo.Lecture;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration({           //테스트할 설정파일들
	   "file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	})
@Log4j
public class jun6Test {
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private LectureDAO lectureDAO;
	
//	@Test
	@DisplayName("memberdao")
	void a() throws FindException {
		memberDAO.selectAllMember();
	}
	
	@Test
	@DisplayName("lectureDAO")
	void b() throws FindException{
		for (Lecture lec : lectureDAO.selectAllLectures())
			log.info(lec.getLecture_start_dt());
	}
}
