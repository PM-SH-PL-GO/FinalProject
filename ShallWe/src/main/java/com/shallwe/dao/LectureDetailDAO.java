package com.shallwe.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.LectureDetail;

@Repository(value = "lectureDetailDAO")
public class LectureDetailDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 강의 상세보기 (비회원) : 수정

	// 강의 등록(강사) : 동일
	public void insertDetail(LectureDetail lectDe) throws AddException {
		try {
			SqlSession session = sqlSessionFactory.openSession();
			session.insert("LectureDetailMapper.insertDetail", lectDe);
		} catch (DataAccessException e) {
			throw new AddException(e.getMessage());
		}
	}

	// 내 강의 수정 (강사) : 동일
	public void updateDetail(LectureDetail lectDe) throws ModifyException {
		try {
			SqlSession session = sqlSessionFactory.openSession();
			session.update("LectureDetailMapper.updateDetail", lectDe);
		} catch (DataAccessException e) {
			throw new ModifyException(e.getMessage());
		}
	}

	/**
	 * admin - 강의 전체 조회
	 * 
	 * @author Jun6
	 */
	public List<LectureDetail> selectAll() throws FindException {
		SqlSession session = null;
		List<LectureDetail> lectureList = new ArrayList<>();

		try {
			session = sqlSessionFactory.openSession();
			lectureList = session.selectList("LectureDetailMapper.selectAllLectures");
		} catch (DataAccessException e) {
			throw new FindException(e.getMessage());
		}

		if (lectureList.size() == 0)
			throw new FindException("검색 결과가 없습니다");

		return lectureList;
	}

	// 강의 승인/반려(admin) : 준식
	// 강의 취소 승인하기(admin) : 준식
}
