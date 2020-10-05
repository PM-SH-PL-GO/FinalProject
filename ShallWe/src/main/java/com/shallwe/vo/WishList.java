package com.shallwe.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class WishList {
	private Member member;
//	private Lecture lecture;
	private List<Lecture> lecs;
}
