package com.shallwe.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;
import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Member;

@Service(value = "memberService")
public class MemberSerivce {
	
	
	@Autowired
	MemberDAO memberDao;
	
	//멤버 로그인:경찬
	public void memberLogin(String member_id,String member_pwd) throws FindException{
		
		Member member = new Member();
		member = memberDao.memberLogin(member_id);
		
		if (!member.getMember_pwd().equals(member_pwd)) {
			throw new FindException("로그인실패");
		}
	}
	//멤버 아이디 찾기:경찬
	public String memberIdCheck(Map<String,Object> member)throws FindException{
		//System.out.println("서비스멤버이름:" + member.get("member_email"));
		return memberDao.IdCheck(member);
	
	}
	//멤버비밀번호찾기:경찬
	public String memberpwdCheck(Map<String,Object> member) throws FindException{
		
		return memberDao.pwdCheck(member);
	}

	//멤버비밀번호변경(로그인x):경찬
	public void changePwd(Map<String,Object> member)throws ModifyException{
	
			memberDao.changePwd(member);
	}

	//회원가입 : 상하
	public void memberJoin(MemberInfoBean mib)throws AddException{
			LectureCategory favorite1 = mib.getFavorite1();
			LectureCategory favorite2 = mib.getFavorite2();
			LectureCategory favorite3 = mib.getFavorite3();
			mib.setFavorite1(favorite1);
			mib.setFavorite2(favorite2);
			mib.setFavorite3(favorite3);
			memberDao.joinMember(mib);
	}
	
	//멤버 아이디중복검사 : 상하
	public MemberInfoBean getMemberId(String usertyped,String col) {
		return memberDao.getMemberId(usertyped,col);
	}

	//내 정보 보기:상하 
	public MemberInfoBean findById(String memberId)throws FindException{ 
		return memberDao.selectById(memberId);
	}
	//비밀번호 수정(로그인 된 상태): 상하 
	public void updatePwd(String memberId, String memberPassword)throws ModifyException { 
		memberDao.updatePassword(memberId, memberPassword);

	}
	//비밀번호(임시비밀번호)
	public void randomPassword(Map<String,Object>member1,Member member)throws ModifyException{
		memberDao.randomPassword(member1,member);
		
	}
}
	
