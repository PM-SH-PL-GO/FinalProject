package com.shallwe.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shallwe.dao.LectureDetailDAO;
import com.shallwe.dao.TutorDAO;
import com.shallwe.exception.FindException;
import com.shallwe.exception.ModifyException;
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
	 * 예비 강사 목록 보여주기
	 * @author jun6
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
	
	/**
	 * 예비강사 승인/반려
	 * @param id
	 * @param status
	 * @throws ModifyException
	 */
	public void approvePreTutor(String id, String status) throws ModifyException{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("status", status);
		tutorDAO.updateTutorState(map);
		
		if(!status.equals("승인")){
			// email로 반려 사유보내주기
		}
	}
}
