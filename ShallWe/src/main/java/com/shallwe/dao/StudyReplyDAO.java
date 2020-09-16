package com.shallwe.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "studyReplyDAO")
public class StudyReplyDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 해당 게시글 댓글 전체조회 
	// 댓들 작성
	// 댓글 수정
	// 댓글 삭제
}
