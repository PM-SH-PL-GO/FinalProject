package com.shallwe.model;

import java.util.Date;

import com.shallwe.vo.LectureCategory;
import com.shallwe.vo.Tutor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * @author Soojeong
 * 메인 - 검색어 입력 시 조회결과화면 출력
 * 검색 결과 화면 내에서 재검색 
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class LectureSearchBean {
	private int lecture_id;
	private LectureCategory lectureCategory;
	private Tutor tutor;
	private String lecture_img;
	private String lecture_title;
	private int lecture_price;
	private String lecture_state;
	private Date lecture_start_dt;
	private Date lecture_end_dt;
	private int lecture_max;
	private int lecture_current;
}
