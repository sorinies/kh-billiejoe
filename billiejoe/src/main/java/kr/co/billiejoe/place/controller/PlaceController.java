package kr.co.billiejoe.place.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.filefilter.FalseFileFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.service.PlaceService;
import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.PlaceAvailable;
import kr.co.billiejoe.place.model.vo.Reservation;
import kr.co.billiejoe.place.model.vo.Tag;

@RequestMapping("/place/*")
@SessionAttributes({"loginMember"})
@Controller
public class PlaceController {
	@Autowired
	private PlaceService service;
	
	/**
	 * 장소 목록
	 * @param cp
	 * @param model
	 * @param pg
	 * @return
	 */
	@GetMapping("list")
	public String placeList(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg) {
		pg.setCurrentPage(cp);
		
		Pagination pagination = null;
		List<Place> placeList = null;
		
		pagination = service.getPagination(pg);
		placeList = service.selectPlaceList(pagination);

		model.addAttribute("placeList", placeList);
		model.addAttribute("pagination", pagination);
		
		return "place/placeList";
	}
	
	/** 장소 상세보기
	 * @param boardNo
	 * @param model
	 * @param cp
	 * @return
	 */
	@GetMapping("{placeNo}/view")
	public String placeView(@PathVariable("placeNo")int placeNo,Model model, @RequestParam(value = "cp", required = false, defaultValue = "1")int cp
							){
		Member loginMember = (Member)model.getAttribute("loginMember");
//		loginMember = new Member();
//		loginMember.setMemberNo(500);
		int like = 0;
		if(loginMember !=null) {
			like = service.likeCheck(loginMember.getMemberNo());
		}
		Place place = service.placeView(placeNo);
		model.addAttribute("like",like);
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
	
	@PostMapping("{placeNo}/likeCheck")
	@ResponseBody
	public int likebCheck(Integer like, Model model, @PathVariable("placeNo")int placeNo) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		System.out.println(loginMember);
		Likes likes = new Likes();
		int result=0;
		if(loginMember == null ) {
			result =3; 
		}else {
			likes.setMemberNo(loginMember.getMemberNo());
			likes.setPlaceNo(placeNo);
//		비로그인 상태일때
//		좋아요 안한 회원일때
			if(like==0) {
				result =service.insertLike(likes);
			}
//		좋아요 한 회원일때
			if(like==1) {
				result = service.deleteLike(likes);
			}
			
		}
		
		return result;
	
	}
	
	/**
	 * 장소 추가 페이지 
	 * @param model
	 * @return
	 */
	@GetMapping("addPlace")
	public String insertPlace(Model model) {
		return "place/placeWrite";
	}
	

	/**
	 * 장소 추가
	 * @param place
	 * @param loginMember
	 * @param images
	 * @param request
	 * @param ra
	 * @return
	 */
	@PostMapping("write")
	public String insertPlace(@ModelAttribute Place place, @ModelAttribute PlaceAvailable pa, @ModelAttribute("loginMember") Member loginMember, @RequestParam("images") List<MultipartFile> images, @RequestParam("tagString") String tagString, HttpServletRequest request, RedirectAttributes ra) {
		place.setMemberNo(loginMember.getMemberNo());
		System.out.println(pa);
		String webPath = "resources/images/";
		String savePath = request.getSession().getServletContext().getRealPath(webPath);
		int placeNo = service.insertPlace(place, images, webPath, savePath, tagString);
		String path = null;
		if(placeNo > 0) {
			path = "redirect:" + placeNo;
		} 
		else {
			// MemberController.swalSetMessage(ra, "error", "실패", null);
			System.out.println("장소 추가 실패");
			path = "redirect:" + request.getHeader("referer");
		}
		return path;
	}
}
