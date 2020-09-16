package com.shallwe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.vo.StudyBoard;

@Repository(value = "studyBoardDAO")
public class StudyBoardDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 게시글 전체 조회(+페이징) : 성운
	public List<StudyBoard> selectAll() throws FindException{
		SqlSession session = sqlSessionFactory.openSession();
		try {
		List<StudyBoard> list = session.selectList("StudyBoardMapper.selectAll");
		if(list==null) {
			throw new FindException("게시글이 없습니다.");
		}
		return list;
		}catch (DataAccessException e) {
			throw new FindException(e.getMessage());
		}finally {
			session.close();
		}
		
	}
	// 게시글 조건 검색(+페이징) : 성운
	public List<StudyBoard> selectByTitleAndContent(StudyBoard board) throws FindException{
		SqlSession session = sqlSessionFactory.openSession();
		try {
		List<StudyBoard> list = session.selectList("StudyBoardMapper.selectByTitleAndContent",board);
		return list;
		}catch (DataAccessException e) {
			throw new FindException(e.getMessage());
		}finally {
			session.close();
		}
		
	}
	
	// 게시글 작성 : 성운
	public void insert(StudyBoard board) throws AddException {
		SqlSession session = sqlSessionFactory.openSession();
		session.selectOne("StudyBoardMapper.insert", board);
		if(board.getStudy_m().getMember_id()==null) {
			throw new AddException("해당하는 주문이 없습니다.");
		}
	}
	// 게시글 수정 : 성운
	public void update(StudyBoard board) {
		SqlSession session = sqlSessionFactory.openSession();	
		session.update("StudyBoardMapper.update", board);
	}
	// 게시글 삭제(작성자 & admin) : 성운
}
