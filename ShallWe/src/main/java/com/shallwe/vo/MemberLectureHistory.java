package com.shallwe.vo;

import java.util.Date;

import lombok.Data;

@Data
public class MemberLectureHistory {
	private Member member;
	private Lecture lecture;
	private Date payment_dt;
	private Date cancel_dt;
}
