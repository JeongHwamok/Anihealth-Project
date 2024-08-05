package com.kh.aniht.magazine.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.magazine.model.dao.AdMagazineDao;
import com.kh.aniht.magazine.model.vo.Magazine;

@Service
public class AdMagazineServiceImpl implements AdMagazineService { // 클래스 영역 시작

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdMagazineDao magazineDao;
	
	// 매거진 총 개수 조회 : 페이징 처리
	@Override
	public int selectMagazineListCount() {
		
		return magazineDao.selectMagazineListCount(sqlSession);
		
	}

	// 매거진 목록 조회
	@Override
	public ArrayList<Magazine> selectMagazineList(PageInfo pi) {
		
		return magazineDao.selectMagazineList(sqlSession, pi);
		
	}

	// 매거진 상세 조회
	@Override
	public Magazine selectMagazine(int magazineNo) {
		
		return magazineDao.selectMagazine(sqlSession, magazineNo);
		
	}

	// 매거진 상세조회를 위한 매거진 이미지들 조회
	@Override
	public ArrayList<Magazine> selectAttachmentList(int magazineNo) {
		
		return magazineDao.selectAttachmentList(sqlSession, magazineNo);
		
	}

	// MAGAZINE 테이블에 등록
	@Transactional
	@Override
	public int insertMagazine(Magazine magazine) {
		
		return magazineDao.insertMagazine(sqlSession, magazine);
		
	}

	// MAGAZINE_ATTACHMENT 테이블에 등록
	@Transactional
	@Override
	public int insertAttachment(Magazine magazine) {
		
		return magazineDao.insertAttachment(sqlSession, magazine);
		
	}

	// 매거진 삭제 : 상태값 변경
	@Transactional
	@Override
	public int deleteMagazine(int magazineNo) {
		
		return magazineDao.deleteMagazine(sqlSession, magazineNo);
		
	}

	// 매거진 복구 : 상태값 변경
	@Transactional
	@Override
	public int recoverMagazine(int magazineNo) {
		
		return magazineDao.recoverMagazine(sqlSession, magazineNo);
		
	}

	// 기존 매거진 내용 수정
	@Transactional
	@Override
	public int updateMagazine(Magazine magazine) {
		
		return magazineDao.updateMagazine(sqlSession, magazine);
		
	}

	// 기존 매거진 ATTACHMENT 수정
	@Transactional
	@Override
	public int updateAttachment(Magazine magazine) {
		
		return magazineDao.updateAttachment(sqlSession, magazine);
		
	}

	// 기존 매거진의 MAGAZINE_ATTACHMENT 테이블에 등록
	@Transactional
	@Override
	public int insertExistingAttachment(Magazine magazine) {
		
		return magazineDao.insertExistingAttachment(sqlSession, magazine);
		
	}

} // 클래스 영역 끝
