package com.shallwe.dao;

import java.util.List;

import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.vo.LectureCategory;

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
}
