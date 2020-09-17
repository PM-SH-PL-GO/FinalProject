package com.shallwe.dao;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.vo.StudyBoard;

@Repository(value = "studyBoardDAO")
public class StudyBoardDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 게시글 전체 조회(+페이징) : 성운
	public List<StudyBoard> selectAll(Map<String, Object> map) throws FindException{
		SqlSession session = sqlSessionFactory.openSession();
		try {
		List<StudyBoard> list = session.selectList("StudyBoardMapper.selectAll", map);
		if(list==null || list.size()==0) {
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
	public List<StudyBoard> selectByTitleAndContent(Map<String, Object> map) throws FindException{
		SqlSession session = sqlSessionFactory.openSession();
		try {
			List<StudyBoard> list = session.selectList("StudyBoardMapper.selectByTitleAndContent",map);
			if(list==null || list.size()==0) {
				throw new FindException("게시글이 없습니다.");
			}
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
		try {
		session.selectOne("StudyBoardMapper.insert", board);
			if(board.getStudy_m().getMember_id()==null) {
				throw new AddException("해당하는 주문이 없습니다.");
			}
		}catch (Exception e) {
			throw new AddException("해당하는 주문이 없습니다.");
		}finally {
			session.close();			
		}
	}
	// 게시글 수정 : 성운
	public void update(StudyBoard board) throws ModifyException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
		session.update("StudyBoardMapper.update", board);
			if(board.getStudy_m().getMember_id()==null) {
				throw new ModifyException("수정할 데이터가 없습니다.");
			}
		}catch (Exception e) {
			throw new ModifyException("수정할 데이터가 없습니다.");
		}finally {
			session.close();				
		}
	}
	// 게시글 삭제(작성자 & admin) : 성운
	public void delete(int studyBoard_id) throws RemoteException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
		session.delete("StudyBoardMapper.delete", studyBoard_id);
		if(studyBoard_id == 0) {
			throw new RemoteException("삭제할 게시물이 존재하지않습니다.");
		}		
		}catch (Exception e) {
			throw new RemoteException("삭제할 게시물이 존재하지않습니다.");
		}finally {
			session.close();				
		}
	}
	
	//게시글 수 조회 : 성운
	public int selectCount() {
		SqlSession session = sqlSessionFactory.openSession();
		int selectcount = session.selectOne("StudyBoardMapper.selectCount");
		return selectcount;
	}
	
	//조회수 삽입 : 성운
	public void insertViews(int studyBoard_id) {
		SqlSession session = sqlSessionFactory.openSession();
		session.selectOne("StudyBoardMapper.insertViews", studyBoard_id);
	}
	
	
}
