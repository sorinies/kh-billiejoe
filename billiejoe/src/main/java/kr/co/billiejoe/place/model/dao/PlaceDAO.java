package kr.co.billiejoe.place.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.Pagination;
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

	
	/**  전체 목록 수 + 예약한 장소 조회
	 * @param memberNo
	 * @return
	 */
	public Pagination getListCount(int memberNo) {
		return session.selectOne("placeMapper.getListCount", memberNo);
	}

	/**  내가 예약한 장소 목록 조회
	 * @param pagination
	 * @return placeList
	 */
	public List<Place> selectReservationList(Pagination pagination) {
		
		int offset = (pagination.getCurrentPage() -1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		// offset 만큼 건너 뛰고, limit만큼의 행을 얻어옴
		
		return session.selectList("placeMapper.selectReservationList", pagination, rowBounds);
		
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