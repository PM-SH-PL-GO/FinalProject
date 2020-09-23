package com.shallwe.vo;

import java.util.Date;

import lombok.Data;
/**
 * @author Soojeong
 * 강의 수강 시 후기등록 (수강생)
 */
@Data
public class Review {
	private MemberLectureHistory member_lecture_history;
	private String review_content;
	private Date review_dt;
	private int review_score;
}
