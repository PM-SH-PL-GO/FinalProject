package com.shallwe.model;

import java.util.List;
import java.util.Map;

import com.shallwe.vo.Tutor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdminTutorBean {
	public static final int CNT_PER_PAGE =8;
   
	private int currentPage;
	private int startRow;
	private int endRow;
	private int totalPage;
	private int startPage;
	private int endPage;
	   
	public AdminTutorBean(int currentPage) {
		this.currentPage = currentPage;
		this.endRow = currentPage * CNT_PER_PAGE;
		this.startRow = endRow - CNT_PER_PAGE + 1;   
	}
		
//	private Map<Tutor, List<String>> tutorCategoryMap;
	private List<Tutor> tutorList;
}
