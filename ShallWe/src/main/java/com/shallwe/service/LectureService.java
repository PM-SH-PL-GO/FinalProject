package com.shallwe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.dao.LectureDAO;
import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.vo.Lecture;
import com.shallwe.vo.LectureDetail;


@Service(value = "lectureService")
public class LectureService {
	
	@Autowired
	LectureDAO lectureDAO;
	@Autowired
	LectureDetailDAO lectureDetailDAO;

	/**
	 * @author Soojeong
	 * @강의 검색  searchKey = {"0:all", "1:tutor_name", "2:lecture_title" , "3:category" };
	 * @Param  searchKey, searchText 담은 HashMap<String, Object>
	 * @return List<Lecture>
	 * @throws FindException 
	 */
	public ModelAndView searchLecture (HashMap<String,Object> map) throws FindException {
		List <Lecture> list = new ArrayList<>();
		ModelAndView modelAndView = new ModelAndView();
		
		try { 
			list = lectureDAO.selectLectureListBySearch(map);
			
			modelAndView.addObject("list", list);
			modelAndView.addObject("status","success");
		
		} catch (FindException e) {
			modelAndView.addObject("status","fail");
			modelAndView.addObject("errMsg",e.getMessage());
		}

		return modelAndView;
	}
	
	public void insertLecture (Lecture lect, LectureDetail lectDe) throws AddException {
		try {
			lectureDAO.insert(lect);
			lectureDetailDAO.insertDetail(lectDe);
		} catch (AddException e) {
			e.printStackTrace();
		}
	}
}
