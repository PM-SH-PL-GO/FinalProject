package com.shallwe.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "reviewDAO")
public class ReviewDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 후기 조회 (수강생/비회원) : 이건 강의 세부정보처럼??
	// 후기 작성 (수강생) : 수정
	// 후기 삭제 (수강생) : 수정
}
