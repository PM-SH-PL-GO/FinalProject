package com.shallwe.dao;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.StudyBoard;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.BoardPageBean;
import com.shallwe.vo.StudyBoard;

@Repository(value = "studyBoardDAO")
public class StudyBoardDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	/**
	 * 게시글 전체 조회(+페이징)
	 * @author psw09
	 * @return 조회된 게시글
	 */
	public List<StudyBoard> selectAll(Map<String, Object> map) throws FindException{
		System.out.println("selectAllDAO");
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
	
	/**
	 * 게시글 조건 검색(+페이징)
	 * @author psw09
	 * @return 조건검색된 게시글
	 */
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
	
	/**
	 * 게시글 작성 
	 * @author psw09
	 */
	public void insert(StudyBoard board) throws AddException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
		session.insert("StudyBoardMapper.insert", board);
			if(board.getMember().getMember_id()==null) {
				throw new AddException("로그인 정보가 없습니다.");
			}
		}catch (Exception e) {
			throw new AddException("실패");
		}finally {
			session.close();			
		}
	}
	/**
	 * 게시글 수정 
	 * @author psw09
	 */
	public void update(StudyBoard board) throws ModifyException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
		session.update("StudyBoardMapper.update", board);
			if(board.getMember().getMember_id()==null) {
				throw new ModifyException("수정할 데이터가 없습니다.");
			}
		}catch (Exception e) {
			throw new ModifyException("수정할 데이터가 없습니다.");
		}finally {
			session.close();				
		}
	}
	/**
	 * 게시글 삭제(작성자 & admin)
	 * @author psw09
	 */
	public void delete(int studyBoard_id) throws RemoteException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("StudyBoardMapper.delete", studyBoard_id);
		if(studyBoard_id == 0) {
			throw new RemoteException("삭제할 게시물이 존재하지않습니다.");
		}		
		}catch (Exception e) {
			throw new RemoteException("삭제할 게시물이 존재하지않습니다.");
		}finally {
			session.close();				
		}
	}
	
	/**
	 * 게시글 수 조회
	 * @author psw09
	 * @return 전체 게시글 수
	 */
	public int selectCount() {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int selectcount = session.selectOne("StudyBoardMapper.selectCount");
			return selectcount;
		}finally {
			session.close();	
		}
	}
	
	/**
	 * 검색 게시글 수 조회
	 * @author psw09
	 * @return 검색된 게시글 수
	 */
	public int SearchSelectCount(Map<String, Object> map) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			int selectcount = session.selectOne("StudyBoardMapper.SerachSelectCount",map);
			return selectcount;
		}finally {
			session.close();	
		}
	}
	
	
	/**
	 * 게시글 번호로 조회
	 * @author psw09
	 * @return 검색된 게시글 
	 */
	@Transactional(rollbackFor = FindException.class)
	public StudyBoard selectByNo(int studyBoard_id) throws FindException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
		session.insert("StudyBoardMapper.insertViews", studyBoard_id);
		StudyBoard studBoard = session.selectOne("selectByNo", studyBoard_id);
		return studBoard;
		}catch (Exception e) {
			throw new FindException("게시글을 찾기못했습니다.");
		}finally {
			session.close();
		}
	}
	
	
}
