package com.shallwe.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"member_id"})
public class Member {
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_email;
	private String member_phone;
	private String member_sex;
	
	private List<LectureCategory> favorite_list;
	private String tutor_YN;
	private int enabled;
}
