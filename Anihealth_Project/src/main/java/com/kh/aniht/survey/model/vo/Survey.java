package com.kh.aniht.survey.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter
@Setter
@ToString
public class Survey {
	
//	EFFECT_WEIGHT	NUMBER	No		1	가중치
//	USER_NO	NUMBER	Yes		2	회원번호
//	EFFECT_NO	NUMBER	Yes		3	성능번호
	
	private int effectWeight;
	private int effectNo;
	private int userNo;
	//추가
	private String effectName;
	private String disease;
	private String effectNameKr;

}
