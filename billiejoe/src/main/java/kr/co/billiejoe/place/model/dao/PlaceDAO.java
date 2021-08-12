package kr.co.billiejoe.place.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.billiejoe.place.model.vo.Attachment;
import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.MyReservation;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Payment;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.PlaceAvailable;
import kr.co.billiejoe.place.model.vo.PlaceTag;
import kr.co.billiejoe.place.model.vo.Reservation;
import kr.co.billiejoe.place.model.vo.Tag;

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

	/**
	 * 전체 장소 수 조회 DAO
	 * @return
	 */
	public int getListCount() {
		return session.selectOne("placeMapper.getListCount");
	}

	/**
	 * 전체 장소 목록 조회 DAO
	 * @param pagination
	 * @return
	 */
	public List<Place> selectPlaceList(Pagination pagination) {
		int offset = (pagination.getCurrentPage() -1) * pagination.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		return session.selectList("placeMapper.selectPlaceList", rowBounds);
	}

	/**
	 * 장소 삽입 DAO
	 * @param place
	 * @return
	 */
	public int insertPlace(Place place) {
		int result = session.insert("placeMapper.insertPlace", place);
		// 성공시 1, 실패시 0
		if(result > 0) {
			return place.getPlaceNo();
		} else {
			return 0;
		}
	}

	/**
	 * 이미지 정보 삽입 DAO
	 * @param atList
	 * @return
	 */
	public int insertAttachmentList(List<Attachment> atList) {
		return session.insert("placeMapper.insertAttachmentList", atList);
	}

	/**
	 * 태그 존재 여부 확인 DAO
	 * @param tagItem
	 * @return
	 */
	public Tag isExistTag(String tagItem) {
		return session.selectOne("placeMapper.isExistTag", tagItem);
	}
	
	/**
	 * 태그 삽입 DAO
	 * @param tagItem
	 * @return
	 */
	public int insertTags(String tagItem) {
		return session.insert("placeMapper.insertTag", tagItem);
	}

	/**
	 * 장소에 태그 정보 삽입 DAO
	 * @param rowNo
	 */
	public void insertTagInPlaceTags(PlaceTag placeTag) {
		session.insert("placeMapper.insertPlaceTags", placeTag);
	}

	
	/**  전체 목록 수 + 예약한 장소 조회
	 * @param memberNo
	 * @return
	 */
	public int getListCount(int memberNo) {
		return session.selectOne("placeMapper.getReListCount", memberNo);
	}

	/**  내가 예약한 장소 목록 조회
	 * @param pagination
	 * @param memberNo 
	 * @return placeList
	 */
	public List<MyReservation> selectReservationList(Pagination pagination, int memberNo) {
		
		int offset = (pagination.getCurrentPage() -1 ) * pagination.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pagination.getLimit());
		// offset 만큼 건너 뛰고, limit만큼의 행을 얻어옴
		
		return session.selectList("placeMapper.selectReservationList", memberNo, rowBounds);
		
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
  
	/**예약정보 얻어오기
	 * @param reserveNo
	 * @return
	 */
	public MyReservation getReservation(int reserveNo) {
		// TODO Auto-generated method stub
		return session.selectOne("placeMapper.getReservation", reserveNo);
	}

	public int cancelRv(int reserveNo) {
		// TODO Auto-generated method stub
		return session.update("placeMapper.cancelRv", reserveNo);
	}

	/**예약상태 이용완료변경
	 * @param map
	 * @return
	 */
	public int completReservation(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.update("placeMapper.completReservation", map);
	}

	/**예약상태 이용중으로 변경
	 * @param map
	 * @return
	 */
	public int startReservation(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.update("placeMapper.startReservation", map);
	}
}