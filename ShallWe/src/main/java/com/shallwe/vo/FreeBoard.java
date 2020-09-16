package com.shallwe.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FreeBoard {
	private int freeBoard_id;
	private Member memeber;
	private String freeBoard_title;
	private String freeBoard_content;
	private String freeBoard_fileName;
	private Date freeBoard_write_dt;
	private int freeBoard_view_count;
	private String freeBoard_deleteYN;
	
	private List<FreeReply> reply_list;
}
