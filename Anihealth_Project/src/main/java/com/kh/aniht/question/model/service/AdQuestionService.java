package com.kh.aniht.question.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.question.model.vo.Question;

public interface AdQuestionService { // 인터페이스 영역 시작
	
	// FAQ 총 개수 조회 : 페이징 처리
	int selectQuestionListCount();
	
	// FAQ 리스트 조회
	ArrayList<Question> selectQuestionList(PageInfo pi);
	
	// FAQ 작성
	int insertQuestion(Question question);
	
	// FAQ 수정
	int updateQuestion(Question question);
	
	// FAQ 삭제 - UPDATE 문으로 상태값 'N' 으로 변경
	int deleteQuestion(Question question);

	// FAQ 복구 - UPDATE 문으로 상태값 'Y' 으로 변경
	int recoverQuestion(Question question);

} // 인터페이스 영역 끝
