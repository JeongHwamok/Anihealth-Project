package com.kh.aniht.member.model.vo;

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
public class Member {

		private int userNo;				//	USER_NO	NUMBER
		private String userId;			//	USER_ID	VARCHAR2(15 BYTE)
		private String userPwd;			//	USER_PWD	VARCHAR2(30 BYTE)
		private String userName;		//	USER_NAME	VARCHAR2(20 BYTE)
		private String userNick;		//	USER_NICK	VARCHAR2(30 BYTE)
		private String email;			//	EMAIL	VARCHAR2(100 BYTE)
		private String phone;			//	PHONE	VARCHAR2(13 BYTE)
		private String userBirthday;	//	USER_BIRTHDAY	VARCHAR2(20 BYTE)
		private Date createDate;		//	CREATE_DATE	DATE
		private String status;			//	STATUS	CHAR(1 BYTE)
		
		// 추가 
		private String deliveryZipcode;
		private String address1;
		private String address2;
		private String addressAll;
		
		
}
