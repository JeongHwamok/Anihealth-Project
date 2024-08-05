package com.kh.aniht.question.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Question {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqStatus;
	// 24/6/2 해준
}
