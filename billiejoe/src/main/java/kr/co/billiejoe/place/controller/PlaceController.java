package kr.co.billiejoe.place.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.billiejoe.place.model.service.PlaceService;
import kr.co.billiejoe.place.model.vo.Place;

@RequestMapping("/place/*")
@Controller
public class PlaceController {
	@Autowired
	private PlaceService service;
	
	/** 게시글 상세보기
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
	
	@PostMapping("{placeNo}/reservationCheck")
	public String reservationCheck(String date, @PathVariable("placeNo")int placeNo) {
		SimpleDateFormat newDay = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date originalDate = newDay.parse(date);
			String newDate = newDay.format(originalDate);
			System.out.println(newDate);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}
}
