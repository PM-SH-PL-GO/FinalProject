package com.shallwe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.vo.LectureCategory;
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
	public List<Tutor> showTutorInfo(Tutor tutor_id)throws FindException{
		
		return dao.TutorInfo(tutor_id);
		
	}
	
	
}
