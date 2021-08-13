package kr.co.billiejoe.review.model.service;

import java.util.List;

import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.vo.Report;
import kr.co.billiejoe.review.model.vo.Pagination;
import kr.co.billiejoe.review.model.vo.Review;

public interface ReviewService {
	
	/** 장소에 대한 전체 후기글 수 조회 Service
	 * @param pg
	 * @param loginMember 
	 * @param placeNo
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg, int placeNo);
	
	/** 장소에 대한 후기 목록 조회
	 * @param pagination
	 * @param loginMember
	 * @param placeNo 
	 * @return reviewListPlace
	 */
	List<Review> selectReviewListPlace(Pagination pagination, int placeNo);
	
	/** 장소에 대한 후기 평점 및 총 개수
	 * @param placeNo
	 * @return add
	 */
	Review addReview(int placeNo);

	/** 내가 작성한 전체 후기글 수 조회 Service
	 * @param pg
	 * @param loginMember 
	 * @return pagination
	 */
	Pagination getPagination(Pagination pg, Member loginMember);
	    
	/** 내가 작성한 후기글 목록 조회 Service
	 * @param pagination
	 * @return reviewList
	 */
	List<Review> selectReviewList(Pagination pagination, Member loginMember);

	/** 내가 작성한 후기 상세조회 Service
	 * @param placeNo
	 * @return reviewView
	 */
	Review selectReview(int reviewNo);

	/** 후기 작성 DB 삽입 Service
	 * @param review
	 * @return reviewNo
	 */
	int insertReview(Review review);

	/** 후기글 수정용 상세 조회 Service
	 * @param reviewNo
	 * @return review
	 */
	Review selectUpdateReview(int reviewNo);

	/** 후기글 수정 Service
	 * @param review
	 * @return result
	 */
	int updateReview(Review review);

	/** 후기글 삭제 Service
	 * @param reviewNo
	 * @return result
	 */
	int deleteReview(int reviewNo);

	/** 후기 신고 Service
	 * @param reviewNo
	 * @param memberNo
	 * @param report
	 * @return result
	 */
	int insertReport(Report report);


}
