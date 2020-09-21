package com.shallwe.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.FaqDAO;
import com.shallwe.dao.MemberDAO;
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.vo.Faq;
import com.shallwe.vo.Tutor;

@Service(value = "adminService")
public class AdminService {
	@Autowired
	private TutorDAO tutorDAO;
	@Autowired
	private FaqDAO faqDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	/**
	 * 예비 강사 목록 보여주기
	 * @author jun6
	 */
	public List<Tutor> showAllTutor(String YN) throws FindException{
		return tutorDAO.selectAllTutor(YN);
	}
	
	/**
	 * 예비강사 승인/반려
	 * @param id
	 * @param status
	 * @throws ModifyException
	 */
	public void approvePreTutor(String id, String status) throws ModifyException{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("status", status);
		memberDAO.updateTutorState(map);
		
		if(!status.equals("승인")){
			// email로 반려 사유보내주기
		}
	}
	
	
	public List<Faq> showAllFaq() throws FindException{
		return faqDAO.selectAll();
	}
	
}
