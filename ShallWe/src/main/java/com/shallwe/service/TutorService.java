package com.shallwe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.vo.Tutor;

import lombok.extern.log4j.Log4j;
@Log4j
@Service(value = "tutorService")
public class TutorService {

	
	@Autowired private TutorDAO dao;
	
	//강사등록:경찬
	public void insertTutor(Tutor tutor)throws AddException{
		
		List<String> lec = new ArrayList<>();
		String cate = tutor.getLectureCategory().getLecture_category_id();
		String [] category = cate.split(",");
		dao.insertTutor(tutor,category);
		
	}
	//강사정보 보기: 경찬
	public List<Tutor> showTutorInfo(String tutor_id)throws FindException{
		
		return dao.TutorInfo(tutor_id);
		
	}
	//강사닉네임 중복확인:경찬
	public int checkNickName(String tutor_nickName)throws FindException{
			int NickName =  dao.checkNickName(tutor_nickName);
			if (NickName ==1) {
				throw new FindException("예외발생:중복된아이디");
			} else {
				
				return dao.checkNickName(tutor_nickName);
			}	
	}
	//강사등록취소:경찬
	public void dellTutor(String tutor_id)throws RemoveException{
		dao.dellTutor(tutor_id);
		
	}
	
}
