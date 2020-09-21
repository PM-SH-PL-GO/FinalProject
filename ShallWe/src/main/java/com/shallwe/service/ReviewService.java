package com.shallwe.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.shallwe.dao.ReviewDAO;
import com.shallwe.exception.AddException;
import com.shallwe.model.ReviewBean;


@Service(value = "reviewService")
public class ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;

	/**
	 * @author Soojeong
	 * @Param  
	 * @return List<Lecture>
	 * @throws AddException 
	 */
	public ModelAndView insertReview (ReviewBean reviewBean) throws AddException {
		ModelAndView modelAndView = new ModelAndView();
		
		try { 
			reviewDAO.insertReview(reviewBean);
			modelAndView.addObject("status","success");
		
		} catch (AddException e) {
			modelAndView.addObject("status","fail");
			modelAndView.addObject("errMsg",e.getMessage());
		}

		return modelAndView;
	}
}
