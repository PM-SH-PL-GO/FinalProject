package com.shallwe.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Lecture {
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
	private int lecture_min;
	private int lecture_current;
}
