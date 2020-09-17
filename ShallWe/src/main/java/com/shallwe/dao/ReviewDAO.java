package com.shallwe.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.model.ReviewBean;

@Repository(value = "reviewDAO")
public class ReviewDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 후기 조회 (수강생/비회원) : 이건 강의 세부정보처럼??
	// 후기 작성 (수강생) : 수정
	public void insertReview ( ReviewBean reviewBean ) throws AddException {
		// DAO 처리결과
		int result = 0;
		try {
			// DB와의 연결
			SqlSession session = sqlSessionFactory.openSession();
			result = session.insert("ReviewMapper.insertReview", reviewBean);
			if ( result == 0  ) {
				throw new AddException("강의후기 등록에 실패하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new AddException(e.getMessage());
		}
		
	}
	// 후기 삭제 (수강생) : 수정

}
