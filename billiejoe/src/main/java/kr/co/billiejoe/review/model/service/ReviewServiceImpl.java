package kr.co.billiejoe.review.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.vo.Report;
import kr.co.billiejoe.review.model.dao.ReviewDAO;
import kr.co.billiejoe.review.model.vo.Pagination;
import kr.co.billiejoe.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDAO dao;
    

	// 장소에 대한 후기글 수 조회
	@Override
	public Pagination getPagination(Pagination pg, int placeNo) {
		
		// 1) 장소에 대한 전체 후기글 수 조회
		Pagination selectPlacePg = dao.getListCountPlace(placeNo);
		
		// 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination(pg.getCurrentPage(), selectPlacePg.getListCount() );
	}
	
	// 장소에 대한 후기 목록 조회
	@Override
	public List<Review> selectReviewListPlace(Pagination pagination, int placeNo) {
		return dao.selectReviewListPlace(pagination, placeNo);
	}
	
	// 장소에 대한 후기 평점 및 총 개수Service
	
	@Override
	public Review addReview(int placeNo) {
		return dao.addReview(placeNo);
	}
	
	// 내가 작성한 전체 후기글 수 조회 Service
	@Override
	public Pagination getPagination(Pagination pg, Member loginMember) {
		
		// 1) 내가 작성한 전체 후기글 수 조회
		Pagination selectPg = dao.getListCount(loginMember);
		
		// 2) 계산이 완료된 Pagination 객체 생성 후 반환
		return new Pagination( pg.getCurrentPage(), selectPg.getListCount() );
	}

	// 내가 작성한 후기글 목록 조회 Service
	@Override
	public List<Review> selectReviewList(Pagination pagination, Member loginMember) {
		return dao.selectReviewList(pagination, loginMember);
	}

	// 내가 작성한 후기 상세조회 Service
	@Override
	public Review selectReview(int reviewNo) {

		Review reviewView = dao.selectReview(reviewNo);
		return reviewView;
	}

	// 후기 작성 DB 삽입 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertReview(Review review) {
		
		// 1) 크로스사이트 스크립트 방지 처리 + 개행 문자 처리
		review.setReviewContent( replaceParameter( review.getReviewContent() ) );
		
		review.setReviewContent(  review.getReviewContent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>")  );
		
		int reviewNo = dao.insertReview(review);
		
		return reviewNo;
	}
	
	
	// 후기 수정용 상세조회 Service
	@Override
	public Review selectUpdateReview(int reviewNo) {
		
		Review review = dao.selectReview(reviewNo);
		
		review.setReviewContent( review.getReviewContent().replaceAll("<br>", "\r\n") );
		
		return review;
	}
	
	// 후기글 수정 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateReview(Review review) {
		
		int result = dao.updateReview(review);
		
		return result;
	}
	
	// 후기글 삭제 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReview(int reviewNo) {
		
		int result = dao.deleteReview(reviewNo);
		
		return result;
	}
	
	// 후기 신고 Service
	@Override
	public int insertReport(Report report) {
		
		int result = dao.insertReport(report);
		
		return result;
	}

	// 크로스 사이트 스크립트 방지 처리 메소드
	public static String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}
	
}