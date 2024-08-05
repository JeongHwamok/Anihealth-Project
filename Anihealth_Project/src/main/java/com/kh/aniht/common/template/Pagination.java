package com.kh.aniht.common.template;

import com.kh.aniht.common.movel.vo.PageInfo;

public class Pagination { // 클래스 영역 시작

	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		int startPage =  (currentPage - 1) / pageLimit * pageLimit + 1;
		
		int endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
		
			endPage = maxPage;
		
		}
		
		PageInfo pi =  new PageInfo(listCount, currentPage, pageLimit, boardLimit,
			maxPage, startPage, endPage);
		
		return pi;
		
	}
	
} // 클래스 영역 끝
