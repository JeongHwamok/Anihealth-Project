package com.kh.aniht.survey.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.product.model.vo.Effect;
import com.kh.aniht.product.model.vo.Product;
import com.kh.aniht.survey.model.vo.Survey;

@Repository
public class SurveyDao {
	
	public int insertSurveyResult(SqlSessionTemplate sqlSession, HashMap<String, Object> hMap) {
		
		return sqlSession.insert("surveyMapper.insertSurveyResult", hMap);
	}

	public ArrayList<Product> selectTopProuduct(SqlSessionTemplate sqlSession, String animal) {
		// TODO Auto-generated method stub
		return (ArrayList) sqlSession.selectList("surveyMapper.surveyResult", animal);
	}

	public int deleteSurveyResult(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.delete("surveyMapper.deleteSurveyResult", userNo);
	}

	public ArrayList<Effect> selectEffectList(SqlSessionTemplate sqlSession, int productNo) {
		
		return (ArrayList) sqlSession.selectList("surveyMapper.selectEffectList", productNo);
	}


}
