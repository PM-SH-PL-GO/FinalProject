package shallwe;

import java.rmi.RemoteException;
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

import com.shallwe.dao.StudyReplyDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.Member;
import com.shallwe.vo.StudyBoard;
import com.shallwe.vo.StudyReply;

import lombok.extern.log4j.Log4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src\\main\\webapp\\WEB-INF\\spring\\root-context.xml"
	})
@Log4j
public class StudyReplyTest {
	@Autowired
	StudyReplyDAO dao;
	
//	@Test
	@DisplayName("댓글 전체조회")
	void selectAll() {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("boardNo", 1);
		map.put("startRow", 1);
		map.put("endRow", 10);
		List<StudyReply> list = dao.selectAll(map);
		for(StudyReply r : list) {
			System.out.println(r);
		}
	}
	
//	@Test
	@DisplayName("댓글 작성")
	void insert() throws AddException {
		StudyReply reply = new StudyReply();
		StudyBoard board = new StudyBoard();
		Member member = new Member();
		board.setStudyBoard_id(9);
		member.setMember_id("member1");
		reply.setStudyreply_content("내용이에요22");
		reply.setStudyreply_b(board);
		reply.setStudyreply_m(member);
		dao.insert(reply);
	}
	
	@Test
	@DisplayName("댓글 수정")
	void update() throws ModifyException {
		StudyReply reply = new StudyReply();
		StudyBoard board = new StudyBoard();
		Member member = new Member();
		board.setStudyBoard_id(9);
		member.setMember_id("member1");
		reply.setStudyreply_id(8);
		reply.setStudyreply_content("수정222");
		reply.setStudyreply_b(board);
		reply.setStudyreply_m(member);
		dao.update(reply);		
	}
	@Test
	@DisplayName("댓글 삭제")
	void delete() throws RemoteException {
		StudyReply reply = new StudyReply();
		reply.setStudyreply_id(8);
		dao.delete(reply);				
	}
}
