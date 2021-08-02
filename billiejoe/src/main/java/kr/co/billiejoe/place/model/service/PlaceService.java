package kr.co.billiejoe.place.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.Reservation;

public interface PlaceService {

	Place placeView(int placeNo);

	List<Integer> reservationCheck(Reservation reservation);

}
