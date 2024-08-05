package com.kh.aniht.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Product {
	
	//	PRODUCT_NO	NUMBER	No		1	상품번호
	//	PRODUCT_NAME	VARCHAR2(150 BYTE)	No		2	상품이름
	//	PRODUCT_STOCK	NUMBER	Yes	0	3	상품재고
	//	PRICE	NUMBER	No		4	가격
	//	CATEGORY	VARCHAR2(100 BYTE)	No		5	카테고리
	//	PRODUCT_THUMBNAIL_PATH	VARCHAR2(200 BYTE)	No		6	상품 썸네일 이미지
	//	PRODUCT_DETAIL_PATH	VARCHAR2(500 BYTE)	No		7	상품 상세설명 이미지
	//	PRODUCT_COUNT	NUMBER	Yes	"0
	//	"	8	조회수
	//	STATUS	CHAR(1 BYTE)	No	'Y' 	9	

    private int productNo;                  
    private String productName;              
    private int productStock;            
    private int price;                 
    private String category;               
    private String productThumbnailPath;  
    private String productDetailPath;       
    private int productCount;             
    private String productStatus;
    private int userNo;
    private String effectName;
    //설문조사,별점 정유상
    private int totalWeight;
	private String totalCount;
    private int rating;
    
    
	// 효능, 부작용 - 정민
	private String effect;
	private String sideEffect;
	
	// 베스트 상품 조회용 - 정민
	private int wishCount;
 
}
