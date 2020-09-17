package com.shallwe.dao;

import java.util.List;
import java.util.Map;

import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Member;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "memberDAO")
public class MemberDAO {
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 회원가입, 로그인, 아이디 찾기, 비밀번호 찾기(비회원) : 경찬	-> 이거 메소드 1개도 아니고 생성, 조회, 수정, 삭제 아닌 애들은 다 서비스에 있어야 합니다 참고해주세요
	
	// 내 정보 보기(수강생) : 상하
	MemberInfoBean selectById(String member_id) throws FindException{
		return null;
	}
	
	// 패스워드 수정 : 상하
	void updatePassword(String member_id, String member_password) throws ModifyException{
		
	}
	
	//이메일수정 : 상하
	void updateEmail(String member_id, String member_email)throws ModifyException{
		
	}
	
	//핸드폰번호수정 :상하
	void updatePhone(String member_id, String member_phone)throws ModifyException{
		
	}
	
	//선호카테고리 수정: 상하
	void updateFavorites(String member_id, List<LectureCategory> favorite_list)throws ModifyException{
		
	}
	
	// 회원 목록 보기(admin) : 영민	
	
	
	//멤버로그인 : 경찬
	public Member memberLogin(String member_id)throws FindException{
		
    	SqlSession session = null;
		
    	try {
    		session =sqlSessionFactory.openSession();
    		Member member = session.selectOne("MemberMapper.memberLogin",member_id);
			if (member == null) {
				
				throw new FindException("예외처리:찾는아이디없음");
			}
			return member;
		} catch (Exception e) {
			throw new FindException("예외처리: 찾는아이디없음");
		}finally {
			session.close();
		}
	}
	
	//멤버아이디 찾기: 경찬
	public String IdCheck(Map<String,Object> member)throws FindException{
		
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		return session.selectOne("MemberMapper.IdCheck",member);
	}
}
