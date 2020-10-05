package com.shallwe.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class LectureDetail {
	private Lecture lecture;
	private String lecture_introduce;
	private String lecture_curriculum;
	private String lecture_prepared;
	private String lecture_caution;
	private String lecture_fileName;
	private String lecture_reject_reason;
	private String lecture_cancel_reason;
	private String lecture_location;
	private RejectCategory rejectCategory;
	private Date lecture_permit_dt;
	private Date lecture_reject_dt;
}
