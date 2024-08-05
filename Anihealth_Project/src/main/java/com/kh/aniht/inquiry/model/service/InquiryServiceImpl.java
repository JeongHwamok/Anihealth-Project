package com.kh.aniht.inquiry.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.inquiry.model.dao.InquiryDao;
import com.kh.aniht.inquiry.model.vo.Inquiry;

@Service
public class InquiryServiceImpl  implements InquiryService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private InquiryDao inquiryDao;
	
	@Override
	public int selectListCount(int userNo) {
		
		return inquiryDao.selectListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Inquiry> selectList(PageInfo pi,int userNo) {
		
		return inquiryDao.selectList(sqlSession, pi, userNo);
	}
	
	
	@Override
	public Inquiry selectInquiry(int inquiryNo) {
		
		return inquiryDao.selectInquiry(sqlSession, inquiryNo);
	}
	
	@Override
	@Transactional
	public int deleteInquiry(int inquiryNo) {
		
		return inquiryDao.deleteInquiry(sqlSession, inquiryNo);
	}
	
	@Override
	@Transactional
	public int insertInquiry(Inquiry iq) {
		
		return  inquiryDao.insertInquiry(sqlSession, iq);
	}


	@Override
	@Transactional
	public int updateInquiry(Inquiry iq) {
		
		return  inquiryDao.updateInquiry(sqlSession, iq);
	}
	

}
