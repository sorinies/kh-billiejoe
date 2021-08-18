package kr.co.billiejoe.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.billiejoe.common.model.vo.Pagination;
import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.reservation.model.service.ReservationService;
import kr.co.billiejoe.reservation.model.vo.BookedReservation;

@SessionAttributes({"loginMember"})
@Controller
public class ReservationController {
	@Autowired
	private ReservationService service;
	
	@GetMapping("/mypage/bookedList")
	public String bookedList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg, @ModelAttribute("loginMember") Member loginMember) {
		if(loginMember == null) {
			return "redirect:/";
		}
		Pagination pagination = service.getPagination(pg, loginMember.getMemberNo());
		List<BookedReservation> resList = service.selectBookedList(pagination, loginMember.getMemberNo());
		pg.setCurrentPage(cp);
		
		model.addAttribute("resList", resList);
		model.addAttribute("pagination", pagination);
		model.addAttribute("bookedList", "active");
		
		return "mypage/bookedList";
	}
}
