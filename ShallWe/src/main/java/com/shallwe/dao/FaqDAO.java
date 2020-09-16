package com.shallwe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.FindException;
import com.shallwe.vo.Faq;

@Repository(value = "faqDAO")
public class FaqDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	// FAQ 조회 (전부) : 성운
	public List<Faq> selectAll() throws FindException {
		System.out.println(1);
		SqlSession session = sqlSessionFactory.openSession();
		try {
		 List<Faq> list = session.selectList("FaqMapper.selectAll");
		 if(list==null) {
			 throw new FindException("faq가 없습니다.");
		 }
		return list;
		}catch (DataAccessException e) {
			throw new FindException(e.getMessage());
		}finally {
			session.close();
		}
	}
	

	// FAQ 작성 (admin) : 준식
	// FAQ 수정 (admin) : 준식
	// FAQ 삭제 (admin) : 준식

	
}
