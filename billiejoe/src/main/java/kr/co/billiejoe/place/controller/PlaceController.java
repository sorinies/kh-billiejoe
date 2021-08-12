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

import kr.co.billiejoe.member.controller.MemberController;
import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.service.PlaceService;
import kr.co.billiejoe.place.model.vo.Likes;
import kr.co.billiejoe.place.model.vo.MyReservation;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Payment;
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
				result = 1;
			}
//		좋아요 한 회원일때
			if(like==1) {
				result = service.deleteLike(likes);
				result = 2;
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
	@PostMapping("{placeNo}/payMent")
	public String payMent(Reservation reservation,@RequestParam(value = "checkbox") int[] checkBox,int sumPrice, @PathVariable("placeNo")int placeNo, Model model) {
		reservation.setUseStart(checkBox[0]);
		reservation.setUseEnd(checkBox[checkBox.length-1]+1);
		Place place = service.placeView(placeNo);
		model.addAttribute("place", place);
		model.addAttribute("reservation", reservation);
		model.addAttribute("sumPrice", sumPrice);
		return "place/reservation";
	}
	@PostMapping("{placeNo}/payComplete")
	public String payComplete(@PathVariable("placeNo")int placeNo, Model model, Reservation reservation, Payment payment, HttpServletRequest request) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		reservation.setMemberNo(loginMember.getMemberNo());
		payment.setMemberNo(loginMember.getMemberNo());
		String path = null;
		int result = service.insertReservation(reservation, payment);
		if(result>0) {
			path = "place/payComplete";
			Place place = service.placeView(placeNo);
			model.addAttribute("place",place);
			model.addAttribute("reservation",reservation);
		}else {
			//실패동작 만들어야함
			path = "redirect:" + request.getHeader("referer");
		}
		
		return path;
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

	// 내가 찜한 장소 목록 조회
	@RequestMapping("myLikePlace")
	public String myLikePlace(@RequestParam(value="cp", required=false, defaultValue="1")int cp,
			Model model, Pagination pg, 
			@ModelAttribute("loginMember")Member loginMember) {
		
		// 1) pg에 cp를 세팅
		pg.setCurrentPage(cp);
		
		// 2) 전체 목록 수를 조회하여 Pagination 관련 내용을 계산하고 값을 저장한 객체 반환 받기
		Pagination pagination = service.getLikePagination(pg, loginMember.getMemberNo());
		
		// 3) 생성된 pagination을 이용하여 현재 목록 페이지에 보여질 게시글 목록 조회
		List<MyReservation> myLikePlaceList = service.selectMyLikePlaceList(pagination,loginMember.getMemberNo());
		
		model.addAttribute("myLikePlaceList", myLikePlaceList);
		model.addAttribute("pagination", pagination);
		
		
		return "place/myLikePlace";
	}
	
	
	
	// 내가 예약한 장소 목록 조회
		@RequestMapping("myReservation")
		public String myReservationList(@RequestParam(value="cp", required=false, defaultValue="1")int cp,
								Model model, Pagination pg, 
								@ModelAttribute("loginMember")Member loginMember) {
			// 1) pg에 cp를 세팅
			pg.setCurrentPage(cp);
			
			// 2) 전체 목록 수를 조회하여 Pagination 관련 내용을 계산하고 값을 저장한 객체 반환 받기
			Pagination pagination = service.getPagination(pg, loginMember.getMemberNo());
			
			// 3) 생성된 pagination을 이용하여 현재 목록 페이지에 보여질 게시글 목록 조회
			List<MyReservation> reservationList = service.selectReservationList(pagination,loginMember.getMemberNo());
			
			// 조회 결과 임시 확인
			/*
			 * for(MyReservation r : reservationList) { System.out.println(r); }
			 */
			
			model.addAttribute("reservationList", reservationList);
			model.addAttribute("pagination", pagination);
			
			return "place/myReservation";
			
			
		}

		/**예약한 장소 상세조회
		 * @param placeNo
		 * @param reserveNo
		 * @param model
		 * @return
		 */
		@GetMapping("{placeNo}/reservationView")
		public String reserveNo(@PathVariable("placeNo")int placeNo, int reserveNo, Model model) {
			Member loginMember = (Member)model.getAttribute("loginMember");
//			loginMember = new Member();
//			loginMember.setMemberNo(500);
			int like = 0;
			if(loginMember !=null) {
				like = service.likeCheck(loginMember.getMemberNo());
			}
			Place place = service.placeView(placeNo);
			MyReservation reservation = service.getReservation(reserveNo);
			Map<String, Object> map = new HashMap<String, Object>();
			int count = 0;
			for(int i =  reservation.getUseStart(); i<reservation.getUseEnd(); i++) {
				count++;
			}
			int sumPrice = reservation.getPlaceCharge()*count;
			map.put("count", count);
			map.put("sumPrice", sumPrice);
			model.addAttribute("map",map);
			model.addAttribute("reservation", reservation);
			model.addAttribute("like",like);
			model.addAttribute("place",place);
			return "place/reservationView";
		}
		@PostMapping("{placeNo}/cancelRv")
		public String cancelRv(@PathVariable("placeNo") int placeNo, @RequestParam("reserveNo")int reserveNo, RedirectAttributes ra) {
			
			int result = service.cancelRv(reserveNo);
			if (result > 0) {
				MemberController.swalSetMessage(ra, "success", "예약 취소되었습니다", null);
			} else {
				MemberController.swalSetMessage(ra, "error", "예약취소 실패하였습니다", "고객센터로 문의해주세요.");

			}
			return "redirect:reservationView?reserveNo="+reserveNo;
			
		}
}

