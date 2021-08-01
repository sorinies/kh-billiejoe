package kr.co.billiejoe.place.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.billiejoe.place.model.vo.Place;

@Repository

public class PlaceDAO {
	@Autowired
	private SqlSessionTemplate session;

	public Place placeView(int placeNo) {
		return session.selectOne("placeMapper.placeView", placeNo);
	}
}
