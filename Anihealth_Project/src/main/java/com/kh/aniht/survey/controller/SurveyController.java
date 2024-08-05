package com.kh.aniht.survey.controller;

import java.util.ArrayList;

import java.util.Comparator;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.aniht.member.model.vo.Member;
import com.kh.aniht.product.model.service.ProductService;
import com.kh.aniht.product.model.service.ProductServiceImpl;
import com.kh.aniht.product.model.vo.Product;
import com.kh.aniht.survey.model.service.SurveyService;
import com.kh.aniht.survey.model.vo.Survey;
import com.kh.aniht.survey.model.vo.SurveyResponse;


@Controller
public class SurveyController {
	@Autowired
	private SurveyService surveyService;
	
    @Autowired
    private ProductService productService;

	@GetMapping("survey.su")
	public String surveyForm() {

		return "survey/survey";
	}
	// 설문결과 출력
	@PostMapping("surveyResult.su")
	public String surveyResult(String animal, String breed, int age, int bcs, double weight, HttpServletRequest request, Model model, HttpSession session) {

		int userNo = ((Member)session.getAttribute("loginUser")).getUserNo();	 // session
		
		// bcs 결과
		String bcsInfo = SurveyResponse.bcs.get(bcs);

		// 무게정보
		HashMap<String, Object> weightInfo = surveyService.getWeightInfo(weight, bcs);
		
		// 설문 vo리스트
		ArrayList<Survey> sList = createSurveyResultList(request, userNo);
		//System.out.println(sList);
		
		// 설문 건강 정보(효과)
		HashMap<String, Integer> effectInfo = surveyService.getEffectTotalInfo(sList);
		
		// 설문결과 저장
		int result = surveyService.insertSurveyResult(sList, userNo);
		//System.out.println("결과insert:" + result);
		
		// 추천제품 리스트
		ArrayList<Product> pList = surveyService.selectTopProuduct(animal);
		/*
		for (Product product : pList) {
			System.out.println("추천제품:" + product);
		}
		*/
		// 설문결과 초기화
		int result2 = surveyService.deleteSurveyResult(userNo);
		//System.out.println("삭제결과:"+ result2);
		//System.out.println(bcsInfo);
		//System.out.println(weightInfo);
		model.addAttribute("age", age);
		model.addAttribute("breed", breed);
		model.addAttribute("animal", animal);
		model.addAttribute("effectInfo", effectInfo);
		model.addAttribute("weightInfo", weightInfo);
		model.addAttribute("bcsInfo", bcsInfo);
		model.addAttribute("sList", sList);
		model.addAttribute("pList", pList);
		
		return "survey/surveyResult";
	}
	// 상품 아이콘 출력
	@ResponseBody
	@GetMapping(value = "selectEffect.su", produces="application/json; charset=UTF-8")
	public String selectEffectList(int[] productNoArr) {
//		for (int i : productNoArr) {
//			System.out.println("w" + i);
//		}
		ArrayList<HashMap<String, Object>> eList = surveyService.selectEffectList(productNoArr);
		ArrayList<HashMap<String, Object>> ratingList = productService.selectRating(productNoArr); //bean 써야함
		//System.out.println(eList);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("eList", eList);
		map.put("ratingList", ratingList);
		
		
		return new Gson().toJson(map);
	}
	
	// 설문결과 객체화/정렬
	private String[] effectArr = {"skin", "teeth", "eye", "bone", "heart", "immunity", "stomach", "kidney"};
	private String[] effectArrKr = {"피부", "치아", "눈", "뼈/관절", "심장", "면역력", "위/장", "신장/방광"};
	public ArrayList<Survey> createSurveyResultList(HttpServletRequest request, int userNo) {
		ArrayList<Survey> sList = new ArrayList<>();
		int index = 1;
		for (String ef : effectArr) {
			Survey s = new Survey();
			
			s.setEffectName(ef);
			s.setEffectNameKr(effectArrKr[index-1]);
			s.setEffectWeight(Integer.parseInt(request.getParameter(ef)));
			s.setEffectNo(index);
			s.setUserNo(userNo); // 필요없음
			s.setDisease(SurveyResponse.disease.get(index));
			sList.add(s);
			index++;
		}
		sList.sort(Comparator.comparingInt(Survey::getEffectWeight).reversed()); // 정렬
		
		return sList;
	}
}