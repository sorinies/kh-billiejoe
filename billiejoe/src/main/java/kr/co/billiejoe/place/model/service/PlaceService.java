package kr.co.billiejoe.place.model.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.Pagination;
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

}
