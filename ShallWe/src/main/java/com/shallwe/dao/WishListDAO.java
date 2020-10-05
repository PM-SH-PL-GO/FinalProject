package com.shallwe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.vo.Lecture;

import lombok.extern.log4j.Log4j;
@Log4j
@Repository(value = "wishListDAO")
public class WishListDAO {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	// 찜 목록에 추가(수강생) : 상하
	public void addFavLec(Map<String,Object> map)throws AddException{
		SqlSession session = null;
		log.info(map.get("member_id"));
		log.info(map.get("lecture"));
		try {
			session = sqlSessionFactory.openSession();
			session.insert("WishListMapper.addFavLec",map);
		}catch(Exception e) {
			throw new AddException(e.getMessage());
		}finally {
			session.close();
		}
	}
	// 찜 목록 개별 삭제(수강생) : 상하
	public void deleteOneFavLec(Map<String,Object>map)throws RemoveException{
		SqlSession session = null;
		int i = 0;
		log.info(map.get("member_id"));
		log.info(map.get("lecture"));
		try {
			session = sqlSessionFactory.openSession();
			i = session.delete("WishListMapper.deleteOneFavLec",map);
			if(i==0) {
				log.info("삭제처리 안됨");
			}
		}catch(Exception e) {
			throw new RemoveException(e.getMessage());
		}finally {
			session.close();
		}
	}
	// 찜 목록 전체 삭제(수강생) : 상하
	public void deleteAllFavLec(String member_id)throws RemoveException{
		SqlSession session = null;
		int i = 0;
		try {
			session = sqlSessionFactory.openSession();
			i = session.delete("WishListMapper.deleteAllFavLec",member_id);
			if(i==0) {
				log.info("삭제처리 안됨");
			}
		}catch(Exception e) {
			throw new RemoveException(e.getMessage());
		}finally {
			session.close();
		}
		
	}
	// 찜 목록 조회(수강생) : 상하
	public List<Lecture> selectWishListById(String member_id) throws FindException{
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			List<Lecture> wishall= new ArrayList<>();
			wishall=session.selectList("WishListMapper.selectWishListById",member_id);
			
			return wishall;
		}catch(Exception e) {
			throw new FindException(e.getMessage());
		}finally {
			session.close();
		}
		
	}
}
