package kr.co.billiejoe.place.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.PlaceAvailable;
import kr.co.billiejoe.place.model.vo.Reservation;

@Repository

public class PlaceDAO {
	@Autowired
	private SqlSessionTemplate session;

	public Place placeView(int placeNo) {
		return session.selectOne("placeMapper.placeView", placeNo);
	}

	public PlaceAvailable getAvailable(int placeNo) {
		return session.selectOne("placeMapper.getAvailable", placeNo);
	}

	public List<Reservation> getTimeList(Reservation reservation) {
		// TODO Auto-generated method stub
		return session.selectList("placeMapper.getTimeList",reservation);
	}
}
