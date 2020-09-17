package com.shallwe.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.vo.Lecture;

@Repository(value = "lectureDAO")
public class LectureDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 강의 검색 (조건별, 전체) : 수정? 성운?
	// 내 강의 목록 보기(강사) : 동일 
	// 강의 등록(강사) : 동일
	
	public void insert(Lecture letc) throws AddException {
		try {
			SqlSession session = sqlSessionFactory.openSession();
//			session.selectOne("LectureDetailMapper.insert", letc);
			session.insert("LectureDetailMapper.insert", letc);
		}catch(DataAccessException e){
			throw new AddException(e.getMessage());
		}
	}
}
