package com.shallwe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.FindException;
import com.shallwe.vo.Member;

@Service(value = "memberService")
public class MemberSerivce {
	
	
	@Autowired
	MemberDAO memberDao;
	
	public void memberLogin(String member_id,String member_pwd) throws FindException{
		
		Member member = new Member();
		member = memberDao.memberLogin(member_id);
		
		if (!member.getMember_pwd().equals(member_pwd)) {
			throw new FindException("로그인실패");
		}
	}

}
