package com.kh.aniht.magazine.model.service;

import java.util.ArrayList;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.magazine.model.vo.Magazine;

public interface AdMagazineService { // 인터페이스 영역 시작

	// 매거진 총 개수 조회 : 페이징 처리
	int selectMagazineListCount();

	// 매거진 목록 조회
	ArrayList<Magazine> selectMagazineList(PageInfo pi);

	// 매거진 상세 조회
	Magazine selectMagazine(int magazineNo);

	// 매거진 상세조회를 위한 매거진 이미지들 조회
	ArrayList<Magazine> selectAttachmentList(int magazineNo);

	// MAGAZINE 테이블에 등록
	int insertMagazine(Magazine magazine);

	// MAGAZINE_ATTACHMENT 테이블에 등록
	int insertAttachment(Magazine magazine);

	// 매거진 삭제 : 상태값 변경
	int deleteMagazine(int magazineNo);

	// 매거진 복구 : 상태값 변경
	int recoverMagazine(int magazineNo);

	// 기존 매거진 내용 수정
	int updateMagazine(Magazine magazine);

	// 기존 매거진 ATTACHMENT 수정
	int updateAttachment(Magazine magazine);

	// 기존 매거진의 MAGAZINE_ATTACHMENT 테이블에 등록
	int insertExistingAttachment(Magazine magazine);

} // 인터페이스 영역 끝
