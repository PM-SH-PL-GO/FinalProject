package com.shallwe.dao;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "wishListDAO")
public class WishListDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 찜 목록에 추가(수강생) : 상하
	// 찜 목록에 삭제(수강생) : 상하
	// 찜 목록 조회(수강생) : 상하
}
