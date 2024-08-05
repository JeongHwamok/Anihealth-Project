package com.kh.aniht.cart.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Cart {

	public int cartNo;
	public int cartQuantity;
	public int cartPrice;
	public int userNo;
	public int productNo;
	// 추가
	public String effectName;
	public String productThumbnailPath;
	public String productName;
	public String category;
	
}
