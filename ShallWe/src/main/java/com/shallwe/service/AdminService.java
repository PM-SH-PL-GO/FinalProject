package com.shallwe.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.FindException;
import com.shallwe.model.AdminLectureListBean;
import com.shallwe.model.AdminPreTutorBean;
import com.shallwe.vo.LectureDetail;
import com.shallwe.vo.Tutor;

@Service(value = "adminService")
public class AdminService {
	@Autowired
	private TutorDAO tutorDAO;
	@Autowired
	private LectureDetailDAO lectureDetailDAO;
	
	public AdminLectureListBean showAllLectureDetail() throws FindException{
		AdminLectureListBean adminLectureListBean = new AdminLectureListBean();
		List<LectureDetail> lectureDetailList = lectureDetailDAO.selectAll();
		
		if (lectureDetailList != null) {
			
			
		}
		
		return adminLectureListBean;
	}
	
	/**
	 * 
	 */
	public List<AdminPreTutorBean> showAllPreTutor() throws FindException{
		List<AdminPreTutorBean> tutorBeanList = new ArrayList<>();
		List<Tutor> tutorList = tutorDAO.selectAllPreTutor();
		
		for (Tutor tutor : tutorList) {
			AdminPreTutorBean bean = new AdminPreTutorBean();
			bean.setCareer(tutor.getTutor_career_file());
			bean.setCategory(tutor.getLecture_category().getLecture_category_id());
			bean.setId(tutor.getMember().getMember_id());
			bean.setImg(tutor.getTutor_img());
			bean.setIntroduce(tutor.getTutor_introduce());
			bean.setLink(tutor.getTutor_link());
			bean.setName(tutor.getMember().getMember_name());
			bean.setNickname(tutor.getTutor_nickname());
			bean.setScore(tutor.getTutor_score());
			
			tutorBeanList.add(bean);
		}
		
		return tutorBeanList;
	}
}
