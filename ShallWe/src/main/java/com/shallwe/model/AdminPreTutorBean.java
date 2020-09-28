package com.shallwe.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class AdminPreTutorBean {
	private String img;
	private String id;
	private String name;
	private String nickname;
	private String category;
	private String career;
	private String introduce;
	private String link;
	private float score;
}
