package com.shallwe.model;

import lombok.Data;
/**
 * @author Soojeong
 * 강의 수강 시 후기등록 (수강생)
 * 후기 삭제
 * 후기 조회
 */
@Data
public class ReviewBean {
	
	private String member_id;
	private String lecture_category_id;
	private int lecture_id;
	private int review_score;
	
}
