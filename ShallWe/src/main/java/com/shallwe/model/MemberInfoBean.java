package com.shallwe.model;

import com.shallwe.vo.LectureCategory;

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

	
	public MemberInfoBean(String memberId, String memberPwd, String memberName, String memberEmail, String memberPhone,
			LectureCategory favorite1, LectureCategory favorite2, LectureCategory favorite3, String memberSex,
			String tutorYN) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.favorite1 = favorite1;
		this.favorite2 = favorite2;
		this.favorite3 = favorite3;
		this.memberSex = memberSex;
		this.tutorYN = tutorYN;
	}


	public MemberInfoBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	public String getMemberPwd() {
		return memberPwd;
	}


	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}


	public String getMemberName() {
		return memberName;
	}


	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	public String getMemberEmail() {
		return memberEmail;
	}


	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}


	public String getMemberPhone() {
		return memberPhone;
	}


	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}


	public LectureCategory getFavorite1() {
		return favorite1;
	}


	public void setFavorite1(LectureCategory favorite1) {
		this.favorite1 = favorite1;
	}


	public LectureCategory getFavorite2() {
		return favorite2;
	}


	public void setFavorite2(LectureCategory favorite2) {
		this.favorite2 = favorite2;
	}


	public LectureCategory getFavorite3() {
		return favorite3;
	}


	public void setFavorite3(LectureCategory favorite3) {
		this.favorite3 = favorite3;
	}


	public String getMemberSex() {
		return memberSex;
	}


	public void setMemberSex(String memberSex) {
		this.memberSex = memberSex;
	}


	public String getTutorYN() {
		return tutorYN;
	}


	public void setTutorYN(String tutorYN) {
		this.tutorYN = tutorYN;
	}


	@Override
	public String toString() {
		return "MemberInfoBean [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", favorite1=" + favorite1
				+ ", favorite2=" + favorite2 + ", favorite3=" + favorite3 + ", memberSex=" + memberSex + ", tutorYN="
				+ tutorYN + "]";
	}
	
	
}
