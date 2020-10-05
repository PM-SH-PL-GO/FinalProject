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
import com.shallwe.exception.RemoveException;
import com.shallwe.model.AdminTutorBean;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Member;
import com.shallwe.vo.Tutor;

@Repository(value = "tutorDAO")
public class TutorDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 강사 정보보기(비회원) : 경찬
	// 강사 정보 조회 : 경찬
	// 강사 정보 수정 : 경찬
	
	// 강사/예비강사 목록 보기(admin) : 준식
	public List<Tutor> selectAllTutor(Map<String, String> map) throws FindException{
		List<Tutor> tutorList = new ArrayList<>();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			tutorList = session.selectList("TutorMapper.selectAllTutor", map);
		}catch(DataAccessException e) {
			throw new FindException("검색 과정에 오류가 있습니다");
		}finally {
			session.close();
		}
		
		if (tutorList.size() == 0)
			throw new FindException("검색 결과가 없습니다");
		
		return tutorList;
	}
	
	public int countAllTutor(String YN) throws FindException{
		SqlSession session = null;
		int count = 0;
		try {
			session = sqlSessionFactory.openSession();
			count = session.selectOne("TutorMapper.selectCount", YN);
		}catch(DataAccessException e) {
			e.printStackTrace();
			throw new FindException();
		}
		
		return count;
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
		session.close();
		
	}
	
	//강사상세보기: 경찬
	public List<Tutor> TutorInfo(String tutor_id)throws FindException {
		
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		List<Tutor> list = null;
		try {
			list =session.selectList("TutorMapper.selectTutorInfo",tutor_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		} finally {
		
			session.close();
		}
		
		return list;
	}
	
	//강사닉네임중복체크: 경찬
	public int checkNickName(String tutor_nickName) throws FindException {
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		 int nickNameCheck = 0;
		try {
			
			 nickNameCheck = session.selectOne("TutorMapper.checkNickName",tutor_nickName);
			 
		} catch (Exception e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		}finally {
			
			 session.close();
		}
		return nickNameCheck;
	}
	//강사등록취소: 경찬
	public void dellTutor(String tutor_id) throws RemoveException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		
		try {
			session.delete("TutorMapper.deltutor",tutor_id);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RemoveException(e.getMessage());
		} finally {
			session.close();
		}
		
		
	}
	
}
