package com.shallwe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.vo.FreeBoard;

import lombok.extern.log4j.Log4j;
@Log4j
@Repository(value = "freeBoardDAO")
public class FreeBoardDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 게시글 전체 조회
	public List<FreeBoard> listAll()throws FindException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		return session.selectList("FreeBoardMapper.listAll");
	}
	
	// 게시글 선택 보기
	public FreeBoard read(int freeboard_id)throws FindException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession(); 
		return session.selectOne("FreeBoardMapper.readOneBoard", freeboard_id);
	}
	
	// 게시글 조건 검색
	
	// 게시글 작성
	public void insert(FreeBoard freeboard)throws AddException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		session.insert("FreeBoardMapper.writeBoard",freeboard);
	}
	
	// 게시글 수정
	public void update(FreeBoard freeboard) throws ModifyException{
		SqlSession session=null;
		int i =0;
		session = sqlSessionFactory.openSession();
		i = session.update("FreeBoardMapper.updateBoard",freeboard);
		
	}
	// 게시글 삭제(작성자 & admin)
	public void delete(int freeboard_id)throws RemoveException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		session.delete("FreeBoardMapper.deleteBoard", freeboard_id);
	}
}
