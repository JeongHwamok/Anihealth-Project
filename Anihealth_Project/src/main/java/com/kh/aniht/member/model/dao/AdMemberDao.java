package com.kh.aniht.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.aniht.common.movel.vo.PageInfo;
import com.kh.aniht.member.model.vo.Delivery;
import com.kh.aniht.member.model.vo.Member;

@Repository
public class AdMemberDao { // 클래스 영역 시작

	// 회원 총 인원수 조회 : 
	public int selectMemberListCount(SqlSessionTemplate sqlSession, String keyword) {
		
		return sqlSession.selectOne("memberMapper.selectAdMemberListCount", keyword);
		
	}

	// 회원 목록 조회
	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi, String keyword) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAdMemberList", keyword, rowBounds);
		
	}

	// 회원 상세 조회
	public Member selectMember(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("memberMapper.selectAdMember", userNo);
		
	}

	// 회원 배송지 조회
	public ArrayList<Delivery> selectDelivery(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("memberMapper.selectAdDelivery", userId);
		
	}

	// 회원 정보 수정
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateAdMember", m);
		
	}

	// 활동 회원수 조회
	public int selectActiveMember(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("memberMapper.selectAdActiveMember");
		
	} 
	
} // 클래스 영역 끝
