package com.shallwe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.vo.Faq;

@Repository(value = "faqDAO")
public class FaqDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	// FAQ 조회 (전부) : 성운
	public List<Faq> selectAll() throws FindException {
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			List<Faq> list = session.selectList("FaqMapper.selectAll");
			if(list==null) 
				throw new FindException("faq가 없습니다.");
		 
		return list;
		}catch (DataAccessException e) {
			throw new FindException(e.getMessage());
		}finally {
			session.close();
		}
	}
	
	public Faq selectFaqById(String faq_id) throws FindException {
		SqlSession session = null;
		Faq faq = null;
		
		try {
			session = sqlSessionFactory.openSession();
			faq = session.selectOne("FaqMapper.selectById", faq_id);
		}catch(DataAccessException e) {
			throw new FindException("조회에 실패했습니다");
		}finally {
			session.close();
		}
		
		return faq;
	}
	
	// FAQ 작성 (admin) : 준식
	public void insertFaq(Faq faq) throws AddException{
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			session.insert("FaqMapper.insertFaq", faq);
		}catch(DataAccessException e) {
			e.printStackTrace();
			throw new AddException("FAQ 추가 중 서버에서 문제가 발생했습니다");
		}finally {
			session.close();
		}
	}
	
	// FAQ 수정 (admin) : 준식
	public void updateFaq(Faq faq) throws ModifyException{
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			session.update("FaqMapper.updateFaq", faq);
		}catch(DataAccessException e) {
			e.printStackTrace();
			throw new ModifyException("수정 중 문제가 발생했습니다");
		}finally {
			session.close();
		}
	}
	// FAQ 삭제 (admin) : 준식
	public void deleteFaq(String faq_id) throws RemoveException{
		SqlSession session = null;
		
		try {
			session = sqlSessionFactory.openSession();
			session.delete("FaqMapper.deleteFaq", faq_id);
		}catch(DataAccessException e) {
			throw new RemoveException("삭제에 실패하였습니다");
		}finally {
			session.close();
		}
	}
	
}
