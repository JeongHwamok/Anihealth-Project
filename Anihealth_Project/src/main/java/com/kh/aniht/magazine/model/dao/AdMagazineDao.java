package com.kh.aniht.magazine.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.magazine.model.vo.Magazine;

@Repository
public class AdMagazineDao { // 클래스 영역 시작

	// 매거진 총 개수 조회 : 페이징 처리
	public int selectMagazineListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("magaMapper.selectAdMagazineListCount");
		
	}

	// 매거진 목록 조회
	public ArrayList<Magazine> selectMagazineList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("magaMapper.selectAdMagazineList", null, rowBounds);
		
	}

	// 매거진 상세 조회
	public Magazine selectMagazine(SqlSessionTemplate sqlSession, int magazineNo) {
		
		return sqlSession.selectOne("magaMapper.selectAdMagazine", magazineNo);
		
	}

	// 매거진 상세조회를 위한 매거진 이미지들 조회
	public ArrayList<Magazine> selectAttachmentList(SqlSessionTemplate sqlSession, int magazineNo) {
		
		return (ArrayList)sqlSession.selectList("magaMapper.selectAdAttachmentList", magazineNo);
		
	}

	// MAGAZINE 테이블에서 등록
	public int insertMagazine(SqlSessionTemplate sqlSession, Magazine magazine) {
		
		return sqlSession.insert("magaMapper.insertAdMagazine", magazine);
		
	}

	// MAGAZINE_ATTACHMENT 테이블에 등록
	public int insertAttachment(SqlSessionTemplate sqlSession, Magazine magazine) {
		
		    return sqlSession.insert("magaMapper.insertAdAttachment", magazine);
	}

	// 매거진 삭제 : 상태값 변경
	public int deleteMagazine(SqlSessionTemplate sqlSession, int magazineNo) {
		
		int result1 = sqlSession.update("magaMapper.deleteAdMagazine", magazineNo);
		int result2 = sqlSession.update("magaMapper.deleteAdAttachment", magazineNo);
		
		return result1 + result2;
		
	}

	// 매거진 복구 : 상태값 변경
	public int recoverMagazine(SqlSessionTemplate sqlSession, int magazineNo) {
		
		int result1 = sqlSession.update("magaMapper.recoverAdMagazine", magazineNo);
		int result2 = sqlSession.update("magaMapper.recoverAdAttachment", magazineNo);
		
		return result1 + result2;
		
	}

	// 기존 매거진 내용 수정
	public int updateMagazine(SqlSessionTemplate sqlSession, Magazine magazine) {
		
		return sqlSession.update("magaMapper.updateAdMagazine", magazine);
		
	}

	// 기존 매거진 ATTACHMENT 수정
	public int updateAttachment(SqlSessionTemplate sqlSession, Magazine magazine) {
		
		return sqlSession.update("magaMapper.updateAdAttachment", magazine);
		
	}
	
	// 기존 매거진 ATTACHMENT 등록
	public int insertExistingAttachment(SqlSessionTemplate sqlSession, Magazine magazine) {
		
	    return sqlSession.insert("magaMapper.insertAdAttachment", magazine);
	}


} // 클래스 영역 끝
