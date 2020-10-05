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
	public void dellTutor(Map<String,Object> tutor) throws RemoveException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		
		try {
			session.delete("TutorMapper.deltutor",tutor);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new RemoveException(e.getMessage());
		} finally {
			session.close();
		}
		
	}
	
	//강사수정: 경찬
	public void tutorUpdate(Tutor tutor,String[] category) throws ModifyException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		LectureCategory lectureCategory = new LectureCategory();
		
		try {	
				for(String t:category) {
					
					lectureCategory.setLecture_category_id(t);
					tutor.setLectureCategory(lectureCategory);
			        session.update("TutorMapper.tutorUpdate",tutor);
				}
					
		} catch (Exception e) {
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
		}finally {
			session.close();
		}
		
	}
	//강사사진수정: 경찬
	public void tutorImage(Tutor tutor)throws ModifyException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		
		try {
			
			session.update("TutorMapper.tutorImage",tutor);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
		} finally {
			session.close();
		}
	}
	
	//강사이력서파일변경: 경찬
	public void tutorCareer(Tutor tutor)throws ModifyException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		
		try {
			session.update("TutorMapper.tutorCareer",tutor);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
			
		} finally {
			session.close();
		}
	}
	
}
