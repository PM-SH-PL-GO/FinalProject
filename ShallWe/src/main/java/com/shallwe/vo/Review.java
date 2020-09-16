package com.shallwe.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Review {
	private MemberLectureHistory member_lecture_history;
	private String review_content;
	private Date review_dt;
}
