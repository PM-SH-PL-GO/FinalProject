package com.shallwe.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * @author Soojeong
 * 강의 수강 시 후기등록 (수강생)
 * 후기 삭제
 * 후기 조회
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class ReviewBean {
	
	private String memberId;
	private String lectureCategoryId;
	private String reviewContent;
	private int lectureId;
	private int reviewScore;
	private String tutorId;
}
