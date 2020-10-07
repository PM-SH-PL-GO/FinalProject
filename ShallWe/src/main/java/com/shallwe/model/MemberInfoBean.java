package com.shallwe.model;

import com.shallwe.vo.LectureCategory;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
@ToString
public class MemberInfoBean {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private LectureCategory favorite1;
	private LectureCategory favorite2;
	private LectureCategory favorite3;
	private String memberSex;
	private String tutorYN;
	private int enabled;
}
