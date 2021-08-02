package kr.co.billiejoe.place.model.service;

import java.text.SimpleDateFormat;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.billiejoe.place.model.dao.PlaceDAO;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.PlaceAvailable;
import kr.co.billiejoe.place.model.vo.Reservation;

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

	/**상세보기중 예약 가능 시간 구하기
	 *
	 */
	@Override
	public List<Integer> reservationCheck(Reservation reservation) {
//		예약가능시간 list
		List<Integer> time = new ArrayList<Integer>();
//		판매자가 지정한 시작시간 마무리시간 구해서 for문으로 삽입
		PlaceAvailable available = dao.getAvailable(reservation.getPlaceNo());
		for (int i = available.getStart(); i<available.getEnd(); i++) {
			time.add(i);
		}
		
//		조회해온 예약된 리스트 
		List<Reservation> timeList = dao.getTimeList(reservation);
//		리스트 하나씩 접급하면서 예약 시작시간부터 끝난시간 지우는 for문 진행시 list전부다 출력이안됨....
//		System.out.println("timeList : " + timeList);
		List<Integer> untime = new ArrayList<Integer>();
		for(Reservation re : timeList) {
			System.out.println(re);
			for(int i = re.getUseStart(); i<re.getUseEnd(); i++) {
				untime.add(i);
			}
		}
		
		List<Integer> todayTime = new ArrayList<Integer>();
		Date date = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
        String today = sdf.format(date);
		if(today.equals(reservation.getUseDate())){
            LocalTime now = LocalTime.now();
            for (int i = 0; i<now.getHour()+1; i++){
                todayTime.add(i);
            }
        }
		time.removeAll(untime);
		time.removeAll(todayTime);
		
		return time;
	}
}
