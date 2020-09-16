package com.shallwe.vo;

import java.util.List;

import lombok.Data;

@Data
public class Member {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_phone;
	
	private List<LectureCategory> favorite_list;
	private String memeber_sex;
	private String tutor_YN;
}
