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
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;

import lombok.extern.log4j.Log4j;
@Log4j
@Repository(value = "lectureDetailDAO")
public class LectureDetailDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 강의 상세보기 (비회원) : 수정

	// 강의 등록(강사) : 동일
	public void insertDetail(LectureDetail lectDe) throws AddException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("LectureDetailMapper.insertDetail", lectDe);
		} catch (DataAccessException e) {
			throw new AddException(e.getMessage());
		} finally {
			session.close();
		}
	}

	// 내 강의 수정 (강사) : 동일
	public void updateDetail(LectureDetail lectDe) throws ModifyException {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("LectureDetailMapper.updateDetail", lectDe);
		} catch (DataAccessException e) {
			throw new ModifyException(e.getMessage());
		} finally {
			session.close();
		}
	}
	
	// 강의 취소 요청(강사) : 동일
		public void cancelRequest(LectureDetail lectDe) throws ModifyException {
			SqlSession session = sqlSessionFactory.openSession();
			try {
				session.update("LectureDetailMapper.cancelRequest", lectDe);
			} catch (DataAccessException e) {
				throw new ModifyException(e.getMessage());
			} finally {
				session.close();
			}
		}
	
	// 강의 상세 보기 : 동일
	public LectureDetail lectureDetailView(Lecture lect) throws FindException {
		LectureDetail le = null;
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			le = session.selectOne("LectureDetailMapper.lectureDetailView", lect);
			if (le == null) {
				throw new FindException("조회 결과가 없습니다.");
			}
		} catch (DataAccessException e) {
			throw new FindException("조회 과정에 오류가 있습니다.");
		} finally {
			session.close();
		}

		return le;
	}

	/**
	 * admin - 강의 전체 조회
	 * @author Jun6
	 * @return 전체 강의 목록
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
	
	/**
	 * 반려/취소 이유 조회
	 * @param lecture_id
	 * @param rejectOrCancel
	 * @return 반려/취소 이유
	 * @throws FindException
	 */
	public LectureDetail selectLectureReasonById(Map<String, String> map) throws FindException {
		SqlSession session = null;
		LectureDetail lectureDetail = null;
		
		try {
			session = sqlSessionFactory.openSession();
			lectureDetail = session.selectOne("LectureDetailMapper.selectLectureReasonById", map);
		}catch(DataAccessException e) {
			throw new FindException("You've got Error!^^");
		}finally {
			session.close();
		}
		
		return lectureDetail;
	}
	
	// 강의 취소 승인하기(admin) : 준식
	public void updateLectureRejectReason(Map<String, String> map) throws ModifyException{
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			log.info(map);
			session.update("LectureDetailMapper.updateLectureRejectReason", map);
		}catch(DataAccessException e) {
			throw new ModifyException("뭔가 잘못되었습니다");
		}finally {
			session.close();
		}
	}
}
