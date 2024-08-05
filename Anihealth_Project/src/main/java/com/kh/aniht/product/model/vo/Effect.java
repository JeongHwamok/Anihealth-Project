package com.kh.aniht.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Effect {
	
//	EFFECT_NO	NUMBER	No		1	성능번호
//	EFFECT_NAME	VARCHAR2(30 BYTE)	No		2	성능이름
//	EFFECT_FILE_PATH	VARCHAR2(100 BYTE)	No		3	성능아이콘
	
	private int effectNo;
	private String effectName;
	private String effectFilePath;

}
