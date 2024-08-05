package com.kh.aniht.magazine.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Magazine {
	
	private int magazineNo;
	private String magazineTitle;
	private String magazineContent;
	private String magazineCreate;
	private int magazineCount;
	private String magazineStatus;
	// 매거진 테이블 
	private String magazinePath;
	private int magazineAttachmentNo;
	private int magazineImgLevel;
	private String magazineImgStatus;
}
