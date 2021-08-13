package kr.co.billiejoe.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.Report;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 관리자 로그인 DAO
	 * @param memberEmail
	 * @return loginMember
	 */
	public Member login(String memberEmail) {
		return sqlSession.selectOne("memberMapper.login", memberEmail);
	}

	/**총회원수 조회
	 * @return
	 */
	public int getListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.getListCount",null);
	}

	/**회원목록 조회
	 * @param pg
	 * @return
	 */
	public List<Member> selectMemberList(Pagination pg) {
		int offset = (pg.getCurrentPage()-1)*pg.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		
		return sqlSession.selectList("adminMapper.selectMemberList", pg, rowBounds);
	}

	public int getListCount(Map<String, String> search) {
		return sqlSession.selectOne("adminMapper.getSearchListCount", search);
	}

	public List<Member> selectMemberList(Pagination pg, Map<String, String> search) {
		int offset = (pg.getCurrentPage()-1)*pg.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		return sqlSession.selectList("adminMapper.getSearchList", search, rowBounds);
	}

	/**탈퇴하는 멤버 정보 조회
	 * @param memberNo
	 * @return
	 */
	public Member selectDeleteMember(int memberNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.selectDeleteMember", memberNo);
	}

	public int insertUnreg(Member member) {
		// TODO Auto-generated method stub
		return sqlSession.insert("adminMapper.insertUnreg",member);
	}

	public int deleteMember(int memberNo) {
		return sqlSession.delete("adminMapper.deleteMember", memberNo);
	}

	/** 탈퇴한 회원수 조회
	 * @return
	 */
	public int getUnRegListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.getUnRegListCount",null);
	}

	public List<Member> selectUnRegMemberList(Pagination pg) {
		int offset = (pg.getCurrentPage()-1)*pg.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		
		return sqlSession.selectList("adminMapper.selectUnRegMemberList", pg, rowBounds);
	}

	public int getUnRegListCount(Map<String, String> search) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.getSearchUnRegListCount", search);
	}

	public List<Member> selectUnRegMemberList(Pagination pg, Map<String, String> search) {
		int offset = (pg.getCurrentPage()-1)*pg.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		return sqlSession.selectList("adminMapper.getSearchUnRegList", search, rowBounds);
	}

	public int getReportListCount() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("adminMapper.getReportListCount",null);
	}

	public List<Report> selectReportList(Pagination pg) {
		int offset = (pg.getCurrentPage()-1)*pg.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pg.getLimit());
		return sqlSession.selectList("adminMapper.selectReportList",pg, rowBounds);
	}

	/**신고 처리하기
	 * @param reviewNo
	 * @return
	 */
	public int reportCheck(int reviewNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("adminMapper.reportCheck",reviewNo);
	}

	
	/** 전체 게시글 수 조회
	 * @return
	 */
	public int getBoardListCount() {
		return sqlSession.selectOne("adminMapper.getBoardListCount", null);
	}

	
	// 전체 게시글 목록 조회
	public List<Place> selectPlaceList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() -1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		// offset 만큼 건너 뛰고, limit만큼의 행을 얻어옴
		
		return sqlSession.selectList("adminMapper.selectPlaceList",null , rowBounds);
		
	}
}
