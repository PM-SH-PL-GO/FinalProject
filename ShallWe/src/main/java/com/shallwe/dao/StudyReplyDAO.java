package com.shallwe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.vo.StudyReply;

@Repository(value = "studyReplyDAO")
public class StudyReplyDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 해당 게시글 댓글 전체조회 
	public List<StudyReply> selectAll(int studyBoard_id) {
		SqlSession session = sqlSessionFactory.openSession();
		List<StudyReply> list = session.selectList("StudyReplyMapper.selectAll", studyBoard_id);
		return list;
	}
	// 댓글 작성
	public void insert(StudyReply reply) {
		SqlSession session = sqlSessionFactory.openSession();	
		session.selectOne("StudyReplyMapper.insert", reply);
	}
	// 댓글 수정
	public void update(StudyReply reply) {
		SqlSession session = sqlSessionFactory.openSession();	
		session.selectOne("StudyReplyMapper.update", reply);
	}
	// 댓글 삭제
	public void delete(StudyReply reply) {
		SqlSession session = sqlSessionFactory.openSession();	
		session.selectOne("StudyReplyMapper.delete", reply);
	}
}
