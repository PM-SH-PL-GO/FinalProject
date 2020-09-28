package com.shallwe.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.ReviewDAO;
import com.shallwe.exception.AddException;
import com.shallwe.exception.FindException;
import com.shallwe.exception.RemoveException;
import com.shallwe.model.ReviewBean;
import com.shallwe.vo.Review;


@Service(value = "reviewService")
public class ReviewService {
	
	@Autowired
	ReviewDAO reviewDAO;
	/**
	 * @author Soojeong
	 * @Param  ReviewBean (후기등록정보)
	 * @throws AddException 
	 */
	public void insertReview (ReviewBean reviewBean) throws AddException {
		try {
			reviewDAO.insertReview(reviewBean);
		} catch (AddException e) {
			e.printStackTrace();
			throw new AddException(e.getMessage());
		}
	}
	/**
	 * @author Soojeong
	 * @Param  Map String tutor_id, String category_id 
	 * @throws FindException 
	 */
	public List<Review> selectReview (Map<String, String> map) throws FindException {
		List<Review> list = new ArrayList<Review>();
		try {
			list = reviewDAO.selectReivew(map);
		} catch (FindException e) {
			e.printStackTrace();
			throw new FindException(e.getMessage());
		}
		return list;
	}
	/**
	 * @author Soojeong
	 * @Param  Map String lecture_category_id, String member_id, String lecture_id  , String tutor_id 
	 * @throws FindException 
	 */
	public void removeReview (Map<String, String> map) throws RemoveException {
		try {
			reviewDAO.deleteReivew(map);
		} catch (RemoveException e) {
			e.printStackTrace();
			throw new RemoveException(e.getMessage());
		}
	}
}
