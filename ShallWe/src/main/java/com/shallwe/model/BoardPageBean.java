package com.shallwe.model;

import java.util.List;

import com.shallwe.vo.LectureCategory;

public class BoardPageBean {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberEmail;
	private String memberPhone;
	private List<LectureCategory> favoriteList;
	private String memberSex;
	private String tutorYN;
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
	public List<LectureCategory> getFavoriteList() {
		return favoriteList;
	}
	public void setFavoriteList(List<LectureCategory> favoriteList) {
		this.favoriteList = favoriteList;
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
	public BoardPageBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardPageBean(String memberId, String memberPwd, String memberName, String memberEmail, String memberPhone,
			List<LectureCategory> favoriteList, String memberSex, String tutorYN) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.favoriteList = favoriteList;
		this.memberSex = memberSex;
		this.tutorYN = tutorYN;
	}
	@Override
	public String toString() {
		return "MyInfoBean [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberEmail=" + memberEmail + ", memberPhone=" + memberPhone + ", favoriteList=" + favoriteList
				+ ", memberSex=" + memberSex + ", tutorYN=" + tutorYN + "]";
	}
}
