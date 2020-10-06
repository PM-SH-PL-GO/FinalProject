package com.shallwe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.FaqDAO;
import com.shallwe.exception.FindException;
import com.shallwe.vo.Faq;

@Service
public class FaqService {
	@Autowired
	FaqDAO dao;
	
	/**
	 * faq 조회
	 * @author psw09
	 * @return 조회된 faq
	 */
	public List<Faq> findAll() throws FindException{
		List<Faq> faq= dao.selectAll();
		return faq;
	}
	
}
