package kr.co.billiejoe.place.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.MyReservation;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Payment;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.PlaceAvailable;
import kr.co.billiejoe.place.model.vo.Report;
import kr.co.billiejoe.place.model.vo.Reservation;
import kr.co.billiejoe.place.model.vo.Search;
import kr.co.billiejoe.review.model.vo.Review;

public interface PlaceService {

	Place placeView(int placeNo);

	List<Integer> reservationCheck(Reservation reservation);

	int likeCheck(int memberNo);

	int insertLike(Likes likes);

	int deleteLike(Likes likes);

	Pagination getPagination(Pagination pg, Search search);

	List<Place> selectPlaceList(Pagination pagination, Search search);

	int insertPlace(Place place, List<MultipartFile> images, String webPath, String savePath, String tagString, PlaceAvailable pa);

	/**  전체 목록 수 + 예약한 장소 조회
	 * @param pg
	 * @return
	 */
	Pagination getPagination(Pagination pg, int memberNo);

	/** 내가 예약한 장소 목록 조회
	 * @param pagination
	 * @param memberNo 
	 * @return placeList
	 */
	List<MyReservation> selectReservationList(Pagination pagination, int memberNo);

	int insertReservation(Reservation reservation, Payment payment);

	MyReservation getReservation(int reserveNo);

	int cancelRv(int reserveNo);

	int updateReservation(Map<String, String> map);

	List<Place> selectPlaceAddrList();

	
	/** 장소에 대한 전체 후기글 수 조회 Service
	 * @param pg
	 * @param loginMember 
	 * @param placeNo
	 * @return pagination
	 */
	Pagination getPagination2(Pagination pg, int placeNo);
	
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
	
	/** 후기 신고 Service
	 * @param reviewNo
	 * @param memberNo
	 * @param report
	 * @return result
	 */
	int insertReport(Report report);
	
}
