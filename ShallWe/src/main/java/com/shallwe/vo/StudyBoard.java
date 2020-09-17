package com.shallwe.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StudyBoard {
	private int studyBoard_id;
	private int studyBoard_rowNum;
//	private String studyBoard_memeber_id;
	private Member Study_m;
	private String studyBoard_title;
	private String studyBoard_content;
	private String studyBoard_fileName;
	private Date studyBoard_write_dt;
	private int studyBoard_view_count;
	private String studyBoard_deleteYN;
	private List<StudyReply> replylist;
}
