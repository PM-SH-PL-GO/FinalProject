package com.shallwe.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "freeBoardDAO")
public class FreeBoardDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 게시글 전체 조회
	// 게시글 조건 검색
	// 게시글 작성
	// 게시글 수정
	// 게시글 삭제(작성자 & admin)
}
