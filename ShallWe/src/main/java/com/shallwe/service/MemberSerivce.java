package com.shallwe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.shallwe.dao.MemberDAO;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.model.MemberInfoBean;

@Service(value = "memberService")
public class MemberSerivce {

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
