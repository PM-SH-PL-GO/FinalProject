package com.shallwe.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "memberLectureHistoryDAO")
public class MemberLectureHistoryDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 수강 신청하기(수강생) : 수정
	// 수강 목록보기(수강생) : 동일
	// 수강 취소하기(수강생) : 수정
	// 강의별 수강생 목록보기(강사) : 
	
	// 회원별 수강목록보기(admin) : 영민
}
