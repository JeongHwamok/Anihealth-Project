package com.kh.aniht.survey.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.product.model.vo.Product;
import com.kh.aniht.survey.model.dao.SurveyDao;
import com.kh.aniht.survey.model.vo.Survey;

@Service
public class SurveyService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private SurveyDao surveyDao;
	
	// 설문결과 추가
	@Transactional
	public int insertSurveyResult(ArrayList<Survey> sList, int userNo) {

		int result = 1;
		for (Survey survey : sList) {
			HashMap<String, Object> hMap = new HashMap<>();
			hMap.put("survey", survey);
			hMap.put("userNo", userNo);
			
			result *= surveyDao.insertSurveyResult(sqlSession, hMap);
		}
		return result;
	}
	// 추천상품 조회
	public ArrayList<Product> selectTopProuduct(String animal) {
		
		return surveyDao.selectTopProuduct(sqlSession, animal);
	}
	// 설문결과 삭제
	@Transactional
	public int deleteSurveyResult(int userNo) {
		
		return surveyDao.deleteSurveyResult(sqlSession, userNo);
	}
	// 추천 상품별 효과 조회
	public ArrayList<HashMap<String, Object>> selectEffectList(int[] productNoArr) {
		
	ArrayList<HashMap<String, Object>> eList = new ArrayList<>();
		
		for (int productNo : productNoArr) {
			HashMap<String, Object> eMap= new HashMap<>();
			eMap.put("productNo", productNo);
			eMap.put("effectArr", surveyDao.selectEffectList(sqlSession, productNo));
			
			eList.add(eMap);
		}	
		return eList;
	}
	// 무게정보
	public HashMap<String, Object> getWeightInfo(double weight, int bcs) {
		HashMap<String, Object> weightInfo = new  HashMap<>();
		
		 double standardWeight = (Math.round(((weight * 100) / (double) (100 + 10 * (bcs - 5))) * 10) / 10.0);
		 
		 double weightRatio = (Math.round((((weight / standardWeight) * 100) - 100) * 10) / 10.0);

		 double curRer = (Math.round((Math.pow(weight, 0.75) * 70) * 10) / 10.0);
		 
		 double staRer = (Math.round((Math.pow(standardWeight, 0.75) * 70) * 10) / 10.0);
		 
		 double calorieNeed = (Math.round((curRer - staRer) * 10) / 10.0);
		 
		 if (bcs == 9) {
			weightInfo.put("bcsStatus", "비만");
		} else if (bcs == 7) {
			weightInfo.put("bcsStatus", "약간비만");
		} else if (bcs == 5) {
			weightInfo.put("bcsStatus", "이상적");
		} else if (bcs == 3) {
			weightInfo.put("bcsStatus", "약간마름");
		} else {
			weightInfo.put("bcsStatus", "마름");
		}
		 
		 weightInfo.put("bcsNo", bcs);
		 weightInfo.put("weight", weight);
		 weightInfo.put("standardWeight", standardWeight);
		 weightInfo.put("weightRatio", weightRatio);
		 weightInfo.put("staRer", (int) staRer);
		 weightInfo.put("calorieNeed", (int) calorieNeed);
		 
		return weightInfo;
	}
	//설문 건강 정보
	public HashMap<String, Integer> getEffectTotalInfo(ArrayList<Survey> sList) {
		HashMap<String, Integer> effectInfo = new HashMap<>();
		int warning = 0;
		int caution = 0;
		int ideal = 0;
		for (Survey s : sList) {
			//System.out.println(s);
			if (s.getEffectWeight() == 5) {
				warning++;
			} else if (s.getEffectWeight() >= 3) {
				caution++;
			} else {
				ideal++;
			}
		}
		
		int totalScore = (int) Math.round(caution * 7 + ideal * 12.5); 
		
		effectInfo.put("totalScore", totalScore);
		effectInfo.put("warning", warning);
		effectInfo.put("caution", caution);
		effectInfo.put("ideal", ideal);
		
		return effectInfo;
	}
}
