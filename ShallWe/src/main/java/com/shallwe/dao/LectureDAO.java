package com.shallwe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.FindException;
import com.shallwe.model.LectureSearchBean;

@Repository(value = "lectureDAO")
public class LectureDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 강의 검색 (조건별, 전체) : 수정
	public List<LectureSearchBean> selectLectureListBySearch (Map map) throws FindException {
		SqlSession session = null;
		try {
			session  = sqlSessionFactory.openSession();
			List <LectureSearchBean > lecutureList = new ArrayList<>();
			
			lecutureList = session.selectList("LectureMapper.selectLectureListBySearch", map);
			
			if (lecutureList.size() == 0  ) {
				throw new FindException("강의 검색 결과가 없습니다.");
			}
			return lecutureList;
		
		} catch ( Exception e ) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
			
		} finally {
			session.close();
		}
	} // end of selectLectureListBySearch method
	
	
	// 내 강의 목록 보기(강사) : 동일 
}
