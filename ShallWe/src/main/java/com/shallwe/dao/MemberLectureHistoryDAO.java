package com.shallwe.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.FindException;
import com.shallwe.vo.Member;
import com.shallwe.vo.MemberLectureHistory;

@Repository(value = "memberLectureHistoryDAO")
public class MemberLectureHistoryDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	// 수강 신청하기(수강생) : 수정
	// 수강 목록보기(수강생) : 동일
	public List<MemberLectureHistory> memberMyClassList(MemberLectureHistory mlth) throws FindException {
		List<MemberLectureHistory> memberList = new ArrayList<>();
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			memberList = session.selectList("MemberLectureHistoryMapper.memberMyClassList", mlth);
			if (memberList.size() == 0) {
				throw new FindException("조회 결과가 없습니다.");
			}
		} catch (DataAccessException e) {
			throw new FindException("조회 과정에 오류가 있습니다.");
		} finally {
			session.close();
		}

		return memberList;
	}
	
	/**
	 * 강의별 수강생 목록 반환하기
	 * @author jun6
	 * @param lecture_id
	 * @return
	 * @throws FindException
	 */
	public List<MemberLectureHistory> selectMemberHistoryByLectureId(String lecture_id) throws FindException{
		SqlSession session = null;
		List<MemberLectureHistory> historyList = null;
		try {
			session = sqlSessionFactory.openSession();
			historyList = session.selectList("MemberLectureHistoryMapper.selectMemberHistoryByLectureId", lecture_id);
		}catch(DataAccessException e) {
			throw new FindException("수강생 목록 반환 실패");
		}finally {
			session.close();
		}
		
		return historyList;
	}
	
	/**
	 * 특정 회원의 수강 목록 조회
	 * @param member_id
	 * @return
	 * @throws FindException
	 */
	public List<MemberLectureHistory> selectHistroyByMemberId(String member_id) throws FindException{
		SqlSession session = null;
		List<MemberLectureHistory> historyList = new ArrayList<>();
		
		try {
			session = sqlSessionFactory.openSession();
			historyList = session.selectList("MemberLectureHistoryMapper.selectHistroyByMemberId", member_id);
		}catch(DataAccessException e) {
			e.printStackTrace();
			throw new FindException("조회 중 에러가 발생했습니다");
		}finally {
			session.close();
		}
		
		return historyList;
	}
}
