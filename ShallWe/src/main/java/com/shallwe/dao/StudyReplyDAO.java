package com.shallwe.dao;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.StudyReply;

@Repository(value = "studyReplyDAO")
public class StudyReplyDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 해당 게시글 댓글 전체조회 
	public List<StudyReply> selectAll(Map<String, Object> map) {
		SqlSession session = sqlSessionFactory.openSession();
		List<StudyReply> list = session.selectList("StudyReplyMapper.selectAll", map);
		session.close();
		return list;
	}
	// 댓글 작성
	public void insert(StudyReply reply) throws AddException {
		SqlSession session = sqlSessionFactory.openSession();	
		try {
		session.insert("StudyReplyMapper.insert", reply);
		}catch (Exception e) {
			throw new AddException("댓글 작성에 실패했습니다.");
		}finally {
			session.close();
		}
	}
	// 댓글 수정
	public void update(StudyReply reply) throws ModifyException {
		SqlSession session = sqlSessionFactory.openSession();	
		try {
		session.update("StudyReplyMapper.update", reply);
		}catch (Exception e) {
			throw new ModifyException("댓글 수정에 실패했습니다.");
		}
	}
	// 댓글 삭제
	public void delete(int reply_id) throws RemoteException {
		SqlSession session = sqlSessionFactory.openSession();	
		try {
		session.selectOne("StudyReplyMapper.delete", reply_id);
		}catch (Exception e) {
			throw new RemoteException("댓글 삭제에 실패했습니다.");
		}
	}
}
