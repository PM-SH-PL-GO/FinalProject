package com.shallwe.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.AddException;
import com.shallwe.vo.Tutor;

@Service(value = "tutorService")
public class TutorService {

	
	@Autowired private TutorDAO dao;
	
	
	public void insertTutor(Tutor tutor)throws AddException{
		
		dao.insertTutor(tutor);
		
	}
	
}
