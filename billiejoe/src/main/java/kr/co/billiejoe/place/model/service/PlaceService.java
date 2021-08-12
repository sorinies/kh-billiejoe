package kr.co.billiejoe.place.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.MyReservation;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Payment;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.Reservation;

public interface PlaceService {

	Place placeView(int placeNo);

	List<Integer> reservationCheck(Reservation reservation);

	int likeCheck(int memberNo);

	int insertLike(Likes likes);

	int deleteLike(Likes likes);

	Pagination getPagination(Pagination pg);

	List<Place> selectPlaceList(Pagination pagination);

	int insertPlace(Place place, List<MultipartFile> images, String webPath, String savePath, String tagString);

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

}
