package com.kh.aniht.member.model.vo;


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
public class Delivery {

	private int deliveryNo;			//	DELIVERY_NO	NUMBER
	private String deliveryName; 	//	DELIVERY_NAME	VARCHAR2(50 BYTE)
	private String deliveryAddress;	//	DELIVERY_ADDRESS	VARCHAR2(500 BYTE)
	private String deliveryZipcode;	//	DELIVERY_ZIPCODE	VARCHAR2(10 BYTE)
	private String userId;				//	USER_ID	VARCHAR2
	
}
