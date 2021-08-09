package kr.co.billiejoe.place.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.Payment;
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

	public int likeCheck(int memberNo) {
		return session.selectOne("placeMapper.likeCheck", memberNo);
	}

	public int insertLike(Likes likes) {
		return session.insert("placeMapper.insertLike",likes);
	}

	public int deleteLike(Likes likes) {
		return session.delete("placeMapper.deleteLike",likes);
	}

	public int getReserveNo() {
		// TODO Auto-generated method stub
		return session.selectOne("placeMapper.getReserveNo", null);
	}

	public int insertReservation(Reservation reservation) {
		// TODO Auto-generated method stub
		return session.insert("placeMapper.insertReservation",reservation);
	}

	public int insertPayment(Payment payment) {
		// TODO Auto-generated method stub
		return session.insert("placeMapper.insertPayment",payment);
	}
}