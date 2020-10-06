package com.shallwe.model;

import java.util.List;
import java.util.Map;

import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Tutor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdminTutorBean {
	private List<Tutor> tutorKeyList;
	private Map<String, List<LectureCategory>> tutorCategoryMap;
}
