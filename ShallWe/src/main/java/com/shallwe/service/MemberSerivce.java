package com.shallwe.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;
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
	//회원가입 : 상하
	public void memberJoin(MemberInfoBean mib)throws AddException{
		
	}
	//내 정보 보기:상하 
	public MemberInfoBean findById(String memberId)throws FindException{ 
		return memberDao.selectById(memberId);
	}
	//비밀번호 수정(로그인 된 상태): 상하 
	public void updatePwd(String memberId, String memberPassword)throws ModifyException { //
		memberDao.updatePassword(memberId, memberPassword);
	}
}
