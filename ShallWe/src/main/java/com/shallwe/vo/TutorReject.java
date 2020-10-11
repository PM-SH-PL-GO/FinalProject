package com.shallwe.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TutorReject {
	private RejectCategory rejectCategory;
	private String reject_reason;
	private Date reject_dt;
}
