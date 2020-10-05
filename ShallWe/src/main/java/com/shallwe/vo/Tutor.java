package com.shallwe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Tutor {
	
	private Member member;						// 회원 정보
	private LectureCategory lectureCategory;	// 전문 분야
	private String tutor_nickname;				// 닉네임
	private String tutor_img;					// 강사 사진파일 명
	private String tutor_career_file;			// 강사 이력서
	private String tutor_introduce;				// 강사 자기소개
	private String tutor_link;					// 강사 소개 link
	private float tutor_score;					// 강사 평점
	private String newCategoryId;
}
