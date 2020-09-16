package com.shallwe.vo;

import java.util.Date;

import lombok.Data;

@Data
public class FreeReply {
	private int freeReply_id;					// 댓글 번호
	private int freeReply_parent_board;			// 어느 게시글 출신인지
	private Member member;						// 댓글 게시자
	private String freeReply_content;			// 댓글 내용
	private Date freeReply_dt;					// 댓글 작성 시간
}
