package com.shallwe.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyReply {
	private int studyreply_rowNum;
	private int studyreply_id;
	private StudyBoard studyreply_b;
	private Member studyreply_m;
	private String studyreply_content;
	private Date studyreply_dt;
}
