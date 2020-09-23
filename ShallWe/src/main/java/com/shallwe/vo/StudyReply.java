package com.shallwe.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyReply {
	private int studyreply_id;
	private StudyBoard studyboard;
	private Member member;
	private String studyreply_content;
	private Date studyreply_dt;
}
