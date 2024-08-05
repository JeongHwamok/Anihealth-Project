package com.kh.aniht.order.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class OrderProduct {

		private int orderProductNo;		//	ORDER_PRODUCT_NO	NUMBER
		private int orderQuantity;		//	ORDER_QUANTITY	NUMBER
		private int orderProductPrice;	//	ORDER_PRODUCT_PRICE	NUMBER
		private String orderNo;			//	ORDER_NO	NUMBER
		private int productNo;			//	PRODUCT_NO	NUMBER
	
		// 추가
		private String productThumbnailPath;	// PRODUCT_THUMBNAIL_PATH
		private String productName;
		private String deliveryStatus;
		private String orderDate;
		private String orderContent;
		private String orderCancle;
}
