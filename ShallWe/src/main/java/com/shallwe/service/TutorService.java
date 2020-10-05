package com.shallwe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
import com.shallwe.exception.RemoveException;
import com.shallwe.vo.Member;
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
		
				return dao.checkNickName(tutor_nickName);
		
	}
	//강사등록취소:경찬
	public void dellTutor(Map<String,Object> tutor)throws RemoveException{
		dao.dellTutor(tutor);
		
	}
	//강사정보 수정: 경찬
	public void tutorUpdate(Tutor tutor1,Map<String,Object> tutor) throws AddException{
		
		HttpSession session = null; 
		String lec = tutor1.getLectureCategory().getLecture_category_id();
		String [] category = lec.split(",");
		
			dao.tutorUpdate(tutor,category,tutor1);
			
	}
	
	//강사사진 수정:경찬
	public void tutorImage(Tutor tutor)throws ModifyException{
		
		dao.tutorImage(tutor);
		
	}
	
	//강사이력서파일 변경: 경찬
	public void tutorCareer(Tutor tutor)throws ModifyException{
		
		dao.tutorCareer(tutor);
	}
	
}
