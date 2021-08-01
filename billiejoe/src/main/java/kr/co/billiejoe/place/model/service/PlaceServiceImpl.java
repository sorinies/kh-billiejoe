package kr.co.billiejoe.place.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.billiejoe.place.model.dao.PlaceDAO;
import kr.co.billiejoe.place.model.vo.Place;

@Service
public class PlaceServiceImpl implements PlaceService{
	@Autowired
	private PlaceDAO dao;

	/**게시글 상세보기
	 *
	 */
	@Override
	public Place placeView(int placeNo) {
		return dao.placeView(placeNo);
	}
}
