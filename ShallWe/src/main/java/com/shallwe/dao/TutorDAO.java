package com.shallwe.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

@Repository(value = "tutorDAO")
public class TutorDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 강사 정보보기(비회원) : 경찬
	// 강사 등록 : 경찬
	// 강사 정보 조회 : 경찬
	// 강사 정보 수정 : 경찬
	// 강사/예비강사 목록 보기(admin) : 준식
	public List<Tutor> selectAllTutor(String YN) throws FindException{
		List<Tutor> tutorList = new ArrayList<>();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			tutorList = session.selectList("TutorMapper.selectAllTutor", YN);
		}catch(DataAccessException e) {
			throw new FindException("검색 과정에 오류가 있습니다");
		}
		
		if (tutorList.size() == 0)
			throw new FindException("검색 결과가 없습니다");
		
		return tutorList;
	}
	
	//강사등록 : 경찬
	public void insertTutor(Tutor tutor,String[]category)throws AddException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		LectureCategory lectureCategory = new LectureCategory();
	
		for(String t: category) {
			
			lectureCategory.setLecture_category_id(t);
			tutor.setLectureCategory(lectureCategory);
			session.insert("TutorMapper.insertTutor",tutor);
			
		}
		
	}
	
	//강의상세보기: 경찬
	public List<Tutor> TutorInfo(Tutor tutor_id) {
		
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		return session.selectList("TutorMapper.selectTutorInfo",tutor_id);
		
	}
}
