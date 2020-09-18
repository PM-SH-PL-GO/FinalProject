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
import com.shallwe.model.LectureSearchBean;
import com.shallwe.vo.Lecture;

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
	
	/**
	 * @author Soojeong
	 * @param map
	 * @return
	 * @throws FindException
	 */
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
	
} // end of LectureDAO class
