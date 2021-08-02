package kr.co.billiejoe.place.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.billiejoe.place.model.service.PlaceService;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.Reservation;

@RequestMapping("/place/*")
@Controller
public class PlaceController {
	@Autowired
	private PlaceService service;
	
	/** 장소 상세보기
	 * @param boardNo
	 * @param model
	 * @param cp
	 * @return
	 */
	@GetMapping("{placeNo}/view")
	public String placeView(@PathVariable("placeNo")int placeNo,Model model, @RequestParam(value = "cp", required = false, defaultValue = "1")int cp){
		Place place = service.placeView(placeNo);
		model.addAttribute("place",place);
		return "place/placeView";
				
	}
	
	/**장소 상세보기중 예약가능시간 조회
	 * @param date
	 * @param placeNo
	 * @return
	 */
	@ResponseBody
	@PostMapping("{placeNo}/reservationCheck")
	public Map<String, Object> reservationCheck(String date, @PathVariable("placeNo")int placeNo) {
		
			Reservation reservation = new Reservation();
			reservation.setPlaceNo(placeNo);
			reservation.setUseDate(date);
			List<Integer> time =service.reservationCheck(reservation);
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("time", time);
			
		return result;
	}
}
