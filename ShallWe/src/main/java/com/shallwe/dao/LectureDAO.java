package com.shallwe.dao;

import java.util.ArrayList;
import java.util.HashMap;
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
import com.shallwe.vo.Lecture;

import lombok.extern.log4j.Log4j;

@Log4j
@Repository(value = "lectureDAO")
public class LectureDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	// 강의 등록(강사) : 동일
	public void insert(Lecture lect) throws AddException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("LectureDetailMapper.insert", lect);
		} catch (DataAccessException e) {
			throw new AddException(e.getMessage());
		} finally {
			session.close();
		}
	}

	// 강의 수정(강사) : 동일
	public void update(Lecture lect) throws ModifyException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("LectureDetailMapper.update", lect);
		} catch (DataAccessException e) {
			throw new ModifyException(e.getMessage());
		} finally {
			session.close();
		}
	}

	// 강의 취소 요청(강사) : 동일
	public void cancelRequest(Lecture lect) throws ModifyException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("LectureMapper.cancelRequest", lect);
		} catch (DataAccessException e) {
			throw new ModifyException(e.getMessage());
		} finally {
			session.close();
		}
	}

	// 교사 강의 조회 : 동일
	public List<Lecture> tutorMyClassList(Lecture lect) throws FindException {
		List<Lecture> lectureList = new ArrayList<>();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			lectureList = session.selectList("LectureMapper.tutorMyClassList", lect);
		} catch (DataAccessException e) {
			throw new FindException("조회 과정에 오류가 있습니다.");
		}

		if (lectureList.size() == 0)
			throw new FindException("조회 결과가 없습니다.");

		return lectureList;
	}

	/**
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws FindException
	 */
	public List<Lecture> selectLectureListBySearch(HashMap<String, Object> map) throws FindException {
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			List<Lecture> lecutureList = new ArrayList<>();
			lecutureList = session.selectList("LectureMapper.selectLectureListBySearch", map);
			return lecutureList;

		} catch (Exception e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());

		} finally {
			session.close();
		}
	} // end of selectLectureListBySearch method

	/**
	 * 강의신청 후 결제 
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws AddException
	 */
	public int insertMemberLectureHistory (Map<String, Object> map) throws AddException {
		SqlSession session = null;
		int result = 0;
		try {
			session = sqlSessionFactory.openSession();
			result = session.insert("LectureMapper.insertMemberLectureHistory", map);
			
			if (result == 0 ) {
				log.info("강의신청에 실패하였습니다.");
			}
			log.info("강의결제 갯수 : " + result);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new AddException(e.getMessage());
		} finally {
			session.close();
		}
		return result;
	} // end of selectLectureListBySearch method
	
	/**
	 * 강의결제취소
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws ModifyException
	 */
	public int updateMemberLectureHistory (HashMap<String, Object> map) throws ModifyException {
		SqlSession session = null;
		int result = 0;
		try {
			session = sqlSessionFactory.openSession();
			result= session.update("LectureMapper.updateMemberLectureHistory", map);
			if (result == 0 ) {
				log.info("강의결제취소에 실패하였습니다.");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
			
		} finally {
			session.close();
		}
		return result;
	} // end of selectLectureListBySearch method
	
	// test용
	
	public Lecture selectLectureBytutorId (String tutor_id) {
		SqlSession session = null;
		Lecture lecture = new Lecture();
		try {
			session = sqlSessionFactory.openSession();
			lecture = session.selectOne("LectureMapper.selectLectureBytutorId", tutor_id);
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			session.close();
		}
		return lecture;
	}

	public List<Lecture> selectAllLectures() throws FindException{
		SqlSession session = null;
		List<Lecture> lectureList = new ArrayList<>();
		
		try {
			session = sqlSessionFactory.openSession();
			lectureList = session.selectList("LectureMapper.selectAllLectures");
//			for (Lecture lec : lectureList) {
//				System.out.println("Start = " + lec.getLecture_start_dt());
//			}
		}catch(DataAccessException e) {
			e.printStackTrace();
		}
		
		return lectureList;
	}
	
} // end of LectureDAO class
