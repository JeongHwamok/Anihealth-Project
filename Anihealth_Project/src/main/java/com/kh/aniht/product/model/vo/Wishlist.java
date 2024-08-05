package com.kh.aniht.product.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class Wishlist {
	
	private int productNo;
	private int userNo;
	
	// 추가
	private String productName;
	private String category;
	private String productThumbnailPath;
	private int price;

}
