package com.shallwe.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.ReviewBean;
import com.shallwe.vo.Review;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository(value = "reviewDAO")
public class ReviewDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 후기 조회 (수강생/비회원) : 이건 강의 세부정보처럼??
	// 후기 작성 (수강생) : 수정
	public void insertReview ( ReviewBean reviewBean ) throws AddException {
		// DAO 처리결과
		SqlSession session = null;
		int result = 0;
		try {
			// DB와의 연결
			session = sqlSessionFactory.openSession();
			System.out.println("insertReview reviewBean:" + reviewBean);
			result = session.insert("ReviewMapper.insertReivew", reviewBean);
//			session.selectList("LectureMapper.tutorMyClassList", "member1");
			if ( result == 0  ) {
				throw new AddException("강의후기 등록에 실패하였습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new AddException(e.getMessage());
		} finally {
			session.close();
		}
		
	}
	// 후기 삭제 (수강생) : 수정
	public void deleteReivew ( Map<String, String> map ) throws RemoveException {
		SqlSession session = null;
		int result = 0;
		try {
			// DB와의 연결
			session = sqlSessionFactory.openSession();
			result = session.delete("ReviewMapper.deleteReivew", map);
			if ( result == 0 ) {
				log.info("강의 리뷰 삭제에 실패했습니다!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RemoveException(e.getMessage());
		} finally {
			session.close();
		}
		
	}
	
	// 강사별, 카테고리별 후기 목록조회 : 수정
	public List<Review> selectReivew (Map<String,String> map ) throws FindException {
		SqlSession session = null;
		List<Review> list = new ArrayList<Review>();
		try {
			// DB와의 연결
			session = sqlSessionFactory.openSession();
			list = session.selectList("ReviewMapper.selectReivewList", map);
			if ( list.size() == 0 ) {
				log.info("강사별 후기 목록 조회 결과 없습니다.");
			} else {
				for ( Review r : list ) {
					log.info(r);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		} finally {
			session.close();
		}
		return list;
	}

} // end of ReviewDAO
