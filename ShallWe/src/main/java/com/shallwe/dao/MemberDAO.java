package com.shallwe.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Member;


@Repository
@Qualifier(value = "memberDAO")

public class MemberDAO {
	
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	// 회원가입, 로그인, 아이디 찾기, 비밀번호 찾기(비회원) : 경찬	-> 이거 메소드 1개도 아니고 생성, 조회, 수정, 삭제 아닌 애들은 다 서비스에 있어야 합니다 참고해주세요
	

	// 회원가입 : 상하
	public void joinMember(MemberInfoBean mib) throws AddException{
		SqlSession session=null;
		try {
			session = sqlSessionFactory.openSession();
			session.insert("MemberMapper.joinMember", mib);
		}catch(Exception e){
			throw new AddException(e.getMessage());
		}
	}
	// 내 정보 보기(수강생) : 상하
	public MemberInfoBean selectById(String memberId) throws FindException
	{
		SqlSession session = null;
		try {
		session = sqlSessionFactory.openSession();
		MemberInfoBean m = session.selectOne("MemberMapper.selectById", memberId);
		if(m==null) {
			throw new FindException("조회된 회원이 없습니다");
		}
		return m;
		}catch(DataAccessException e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		}finally {
			session.close();
		}
	}
	
	// 패스워드 수정 : 상하
	public void updatePassword(String memberId, String memberPwd) throws ModifyException{
		SqlSession session = null;
		Map<String,String>memIdPwd = new HashMap<String, String>();
		memIdPwd.put("memberId", memberId);
		memIdPwd.put("memberPwd", memberPwd);
			
		int i = 0;
		try {
			session = sqlSessionFactory.openSession();
			i = session.update("MemberMapper.updatePassword",memIdPwd);
			if(i==0) {
			 throw new ModifyException("비밀번호 수정에 실패하였습니다");
			}
			
		}catch(Exception e){
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
		}finally{
			session.close();
		}
	
	}
	
	//이메일수정 : 상하
	public void updateEmail(String memberId, String memberEmail)throws ModifyException{
		SqlSession session=null;
		Map<String,String>memEmail = new HashMap<String, String>();
		memEmail.put("memberId", memberId);
		memEmail.put("memberEmail", memberEmail);
		
		int i = 0;
		try {
			session = sqlSessionFactory.openSession();
			i = session.update("MemberMapper.updateEmail", memEmail);
			if(i==0) {
				throw new ModifyException("이메일 수정에 실패하였습니다");
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
		}finally {
			session.close();
		}
		
	}
	
	//핸드폰번호수정 :상하
	public void updatePhone(String memberId, String memberPhone)throws ModifyException{
		SqlSession session=null;
		Map<String,String>memPhone = new HashMap<String,String>();
		memPhone.put("memberId", memberId);
		memPhone.put("memberPhone", memberPhone);
		
		int i = 0;
		try {
			session = sqlSessionFactory.openSession();
			i = session.update("MemberMapper.updatePhone", memPhone);
			if(i==0) {
				throw new ModifyException("핸드폰번호 수정에 실패하였습니다.");
			}
		}catch(Exception e){
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
		}finally {
			session.close();
		}
	}
	
	//선호카테고리 수정: 상하
	public void updateFavorites(String memberId, List<LectureCategory> favoritelist)throws ModifyException{
		SqlSession session = null;
		Map<String, Object>memFav = new HashMap<String, Object>();
		memFav.put(memberId, favoritelist);
		System.out.println("이건 멤바아이디,카테고리"+memberId+","+favoritelist);
		System.out.println("이건 멤페브다 " + memFav);
		int i = 0;
		try {
			session = sqlSessionFactory.openSession();
			i = session.update("MemberMapper.updateFavorites", memFav);
			if(i==0) {
				throw new ModifyException("카테고리 수정에 실패하였습니다.");
			}
		}catch(Exception e) {
			e.printStackTrace();
			throw new ModifyException(e.getMessage());
		}finally {
			session.close();
		}
	
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
	
	//멤버비밀번호 찾기: 경찬
	public String pwdCheck(Map<String,Object> member)throws FindException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		return session.selectOne("MemberMapper.pwdCheck",member);
		
	}
	
	public void changePwd(Map<String,Object> member)throws ModifyException{
		SqlSession session = null;
		session = sqlSessionFactory.openSession();
		session.selectOne("MemberMapper.changePwd",member);
	}
	
	// 강사 승인/반려(admin) : 준식
	public void updateTutorState(Map<String, String> map) throws ModifyException{
		SqlSession session = null;
		try {
			session = sqlSessionFactory.openSession();
			session.update("MemberMapper.updateTutorState", map);
		}catch(DataAccessException e) {
			throw new ModifyException();
		}
	}
}
