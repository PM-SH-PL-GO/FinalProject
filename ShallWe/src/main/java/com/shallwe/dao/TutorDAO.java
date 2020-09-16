package com.shallwe.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "TutorDAO")
public class TutorDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 강사 정보보기(비회원) : 경찬
	// 강사 등록 : 경찬
	// 강사 정보 조회 : 경찬
	// 강사 정보 수정 : 경찬
	
	// 강사/예비강사 목록 보기(admin) : 영민
	// 강사 승인/반려(admin) : 영민
}
