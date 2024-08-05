package com.kh.aniht.review.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Review {
	
	//	REVIEW_NO	NUMBER	No		1	후기번호
	//	RATING	NUMBER	No		2	별점
	//	REVIEW_TITLE	VARCHAR2(150 BYTE)	No		3	후기제목
	//	REVIEW_CONTENT	VARCHAR2(1500 BYTE)	No		4	후기내용
	//	REVIEW_FILE_PATH	VARCHAR2(100 BYTE)	Yes		5	저장경로+파일이름
	//	REVIEW_DATE	DATE	Yes	SYSDATE	6	후기작성일
	//	REVIEW_STATUS	CHAR(1 BYTE)	Yes	'Y' 	7	후기상태
	//	ORDER_PRODUCT_NO	NUMBER	Yes		8	주문상품번호
	//	USER_NO	NUMBER	Yes		9	회원번호
	
	private int reviewNo;
	private int rating;
	private String reviewTitle;
	private String reviewContent;
	private String reviewFilePath;
	private String reviewDate;
	private String reviewStatus;
	private int orderProductNo;
	private int userNo;
	// 추가
	private int productNo;
	private int count;
	private String productName;
	// 관리자 리뷰 조회 - 정민
	private String userNick;
}
