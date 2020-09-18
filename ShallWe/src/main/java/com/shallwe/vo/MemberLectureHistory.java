package com.shallwe.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberLectureHistory {
	private Member member;
	private Lecture lecture;
	private Date payment_dt;
	private Date cancel_dt;
}
