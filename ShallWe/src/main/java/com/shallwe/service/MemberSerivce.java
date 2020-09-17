package com.shallwe.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shallwe.dao.MemberDAO;
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

	private MemberDAO dao;
	
	@Autowired
	@Qualifier(value="memberDAO")
	public MemberDAO getDao() {
		return dao;
	}

	public void setDao(MemberDAO dao) {
		this.dao = dao;
	}
	public MemberInfoBean findById(String memberId)throws FindException{ //상하 : 내 정보 보기 
		return dao.selectById(memberId);
	}
	public void updatePwd(String memberId, String memberPassword)throws ModifyException {
		dao.updatePassword(memberId, memberPassword);
	}
}
