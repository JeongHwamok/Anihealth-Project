package com.kh.aniht.question.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.question.model.vo.Question;

public interface QuestionService {


	// 게시글 총 갯수 조회 페이징처리  24/6/2 해준
	int selectFaqCount();
	
	// 게시글 리스트 조회 24/6/2 해준
	ArrayList<Question> selectFaqList(PageInfo pi);
	
	
}
