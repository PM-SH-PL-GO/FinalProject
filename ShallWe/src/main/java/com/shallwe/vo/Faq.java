package com.shallwe.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Faq {
	private int faq_id;
	private String faq_question;
	private String faq_answer;
}
