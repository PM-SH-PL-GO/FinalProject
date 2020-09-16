package com.shallwe.vo;

import lombok.Data;

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
	
//	public LectureDetail () {}
//
//	public LectureDetail(Lecture lecture, String lecture_prepared, String lecture_caution, String lecture_fileName,
//			String lecture_reject_reason, String lecture_cancel_reason, String lecture_location) {
//		super();
//		this.lecture = lecture;
//		this.lecture_prepared = lecture_prepared;
//		this.lecture_caution = lecture_caution;
//		this.lecture_fileName = lecture_fileName;
//		this.lecture_reject_reason = lecture_reject_reason;
//		this.lecture_cancel_reason = lecture_cancel_reason;
//		this.lecture_location = lecture_location;
//	}
//
//	public Lecture getLecture() {
//		return lecture;
//	}
//
//	public void setLecture(Lecture lecture) {
//		this.lecture = lecture;
//	}
//
//	public String getLecture_prepared() {
//		return lecture_prepared;
//	}
//
//	public void setLecture_prepared(String lecture_prepared) {
//		this.lecture_prepared = lecture_prepared;
//	}
//
//	public String getLecture_caution() {
//		return lecture_caution;
//	}
//
//	public void setLecture_caution(String lecture_caution) {
//		this.lecture_caution = lecture_caution;
//	}
//
//	public String getLecture_fileName() {
//		return lecture_fileName;
//	}
//
//	public void setLecture_fileName(String lecture_fileName) {
//		this.lecture_fileName = lecture_fileName;
//	}
//
//	public String getLecture_reject_reason() {
//		return lecture_reject_reason;
//	}
//
//	public void setLecture_reject_reason(String lecture_reject_reason) {
//		this.lecture_reject_reason = lecture_reject_reason;
//	}
//
//	public String getLecture_cancel_reason() {
//		return lecture_cancel_reason;
//	}
//
//	public void setLecture_cancel_reason(String lecture_cancel_reason) {
//		this.lecture_cancel_reason = lecture_cancel_reason;
//	}
//
//	public String getLecture_location() {
//		return lecture_location;
//	}
//
//	public void setLecture_location(String lecture_location) {
//		this.lecture_location = lecture_location;
//	}
//
//	@Override
//	public String toString() {
//		return "LectureDetail [lecture=" + lecture + ", lecture_prepared=" + lecture_prepared + ", lecture_caution="
//				+ lecture_caution + ", lecture_fileName=" + lecture_fileName + ", lecture_reject_reason="
//				+ lecture_reject_reason + ", lecture_cancel_reason=" + lecture_cancel_reason + ", lecture_location="
//				+ lecture_location + "]";
//	}
}
