package com.shallwe.vo;

import java.util.List;

import lombok.Data;

@Data
public class WishList {
	private Member member;
//	private Lecture lecture;
	private List<Lecture> lecs;
}
