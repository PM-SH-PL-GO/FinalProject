package shallwe;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.shallwe.dao.StudyBoardDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.vo.Member;
import com.shallwe.vo.StudyBoard;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	})
@Log4j

public class StudyBoardTest {
	@Autowired
	StudyBoardDAO dao;
	
//	@Test
	void selectAll() throws FindException {
		dao.selectAll();
	}
	
//	@Test
	@DisplayName("제목+내용 검색")
	void selectByTitleAndContent() throws FindException {
		StudyBoard studyboard = new StudyBoard();
		studyboard.setStudyBoard_title("%제목1%");
		studyboard.setStudyBoard_content("%%");
		dao.selectByTitleAndContent(studyboard);
	}
	
	@Test
	@DisplayName("게시판 입력")
	void insertBoard() throws AddException {
		StudyBoard studyboard = new StudyBoard();
		Member member = new Member();
		member.setMember_id("member1");
		studyboard.setStudy_m(member);;
		studyboard.setStudyBoard_content("제목 : 다시성운test");
		studyboard.setStudyBoard_title("내용 : 성운test");
		studyboard.setStudyBoard_fileName("성운.jpg");
		dao.insert(studyboard);
	}
	
}
