package com.shallwe.vo;

import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FreeBoard {
	private int freeboard_id;
	private Member member;
	private String freeboard_title;
	private String freeboard_content;
	private String freeboard_fileName;
	private Date freeboard_write_dt;
	private int freeboard_view_count;
	private String freeboard_deleteYN;
	
	private List<FreeReply> reply_list;
}
