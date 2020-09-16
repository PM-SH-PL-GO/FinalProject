package com.shallwe.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "studyBoardDAO")
public class StudyBoardDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 게시글 전체 조회(+페이징) : 성운
	// 게시글 조건 검색(+페이징) : 성운
	// 게시글 작성 : 성운
	// 게시글 수정 : 성운
	// 게시글 삭제(작성자 & admin) : 성운
}
