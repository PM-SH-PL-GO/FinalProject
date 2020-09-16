package com.shallwe.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.FindException;
import com.shallwe.model.AdminLectureListBean;
import com.shallwe.vo.LectureDetail;

@Service(value = "adminService")
public class AdminService {
	@Autowired
	private TutorDAO tutorDAO;
	@Autowired
	private LectureDetailDAO lectureDetailDAO;
	
	public AdminLectureListBean showAlllectureDetail() throws FindException{
		AdminLectureListBean adminLectureListBean = new AdminLectureListBean();
		List<LectureDetail> lectureDetailList = lectureDetailDAO.selectAll();
		
		if (lectureDetailList != null) {
			
			
		}
		
		return adminLectureListBean;
	}
		
}
