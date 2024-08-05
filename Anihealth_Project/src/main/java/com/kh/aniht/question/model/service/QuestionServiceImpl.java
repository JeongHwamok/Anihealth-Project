package com.kh.aniht.question.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.question.model.dao.QuestionDao;
import com.kh.aniht.question.model.vo.Question;

@Service
public class QuestionServiceImpl implements QuestionService  {
	
	@Autowired
	private  SqlSessionTemplate sqlSession;
	
	@Autowired
	private QuestionDao questionDao;
	
	// 24/6/2 해준 FAQ 게시글숫자 세오는거
	@Override
	public int selectFaqCount() {
		
		return questionDao.selectFaqCount(sqlSession);
	}
	// 24/6/2 해준 FAQ 게시글 리스트 보여주기
	@Override
	public ArrayList<Question> selectFaqList(PageInfo pi) {
		
		return questionDao.selectFaqList(sqlSession, pi);
		
	}

	
	
}
