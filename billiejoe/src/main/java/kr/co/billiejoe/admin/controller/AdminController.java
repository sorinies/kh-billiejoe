package kr.co.billiejoe.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.billiejoe.admin.model.service.AdminService;
import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Place;
import kr.co.billiejoe.place.model.vo.Report;

@Controller
@RequestMapping("/admin/*")
@SessionAttributes({ "loginMember" })
@Transactional
public class AdminController {

	@Autowired
	private AdminService service;

	/**
	 * 로그인 화면 전환 Controller
	 * 
	 * @return "admin/login"
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String adminLogin() {
		return "admin/login";
	}

	/**
	 * 관리자 로그인 Controller
	 * 
	 * @param inputMember
	 * @param model
	 * @param request
	 * @param response
	 * @param ra
	 * @param save
	 * @return "admin/adminMain"
	 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(Member inputMember, Model model, 
						HttpServletRequest request, 
						HttpServletResponse response,
						RedirectAttributes ra, 
						@RequestParam(value = "save", required = false) String save) {
		
		Member loginMember = service.login(inputMember);

		if (loginMember != null) { // 로그인 성공 시 세션에 올린다!

			model.addAttribute("loginMember", loginMember);

			Cookie cookie = new Cookie("saveEmail", loginMember.getMemberEmail());

			if (save != null) {
				cookie.setMaxAge(60 * 60 * 24 * 1); // 관리자는 하루 유지
			} else {
				cookie.setMaxAge(0);
			}

			cookie.setPath(request.getContextPath());
			response.addCookie(cookie);

		} else {
			ra.addFlashAttribute("icon", "error");
			ra.addFlashAttribute("title", "로그인 실패");
			ra.addFlashAttribute("text", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		return "redirect:main";
	}

	/**
	 * 관리자 로그아웃 Controller
	 * 
	 * @param status
	 * @param referer
	 * @return "admin/login"
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, @RequestHeader("referer") String referer) {
		status.setComplete();
		return "admin/login";
	}
	
	
	/**관리자 회원목록
	 * @return
	 */
	@GetMapping("main")
	public String adminMain(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg, String sv, String sk ) {
		
		pg.setCurrentPage(cp);
		List<Member> memberList = new ArrayList<Member>();
		if(sk==null) {
			pg = service.getMemberPg(pg);
			memberList = service.selectMemberList(pg); 
		}else {
			Map<String, String> search = new HashMap<String, String>();
			search.put("sk", sk);
			search.put("sv", sv);
			pg = service.getMemberPg(pg,search);
			memberList = service.selectMemberList(pg,search);
		}
		
		model.addAttribute("pg",pg);
		model.addAttribute("memberList",memberList);
		return "admin/adminMain";
	}
	
	/**탈퇴한 회원 목록 조회
	 * @param cp
	 * @param model
	 * @param pg
	 * @param sv
	 * @param sk
	 * @return
	 */
	@GetMapping("unRegMember")
	public String unRegMember(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg, String sv, String sk) {
		pg.setCurrentPage(cp);
		List<Member> memberList = new ArrayList<Member>();
		if(sk==null) {
			pg = service.getUnRegMemberPg(pg);
			memberList = service.selectUnRegMemberList(pg); 
		}else {
			Map<String, String> search = new HashMap<String, String>();
			search.put("sk", sk);
			search.put("sv", sv);
			pg = service.getUnRegMemberPg(pg,search);
			memberList = service.selectUnRegMemberList(pg,search);
		}
		
		model.addAttribute("pg",pg);
		model.addAttribute("memberList",memberList);
		return "admin/unRegMember";
	}
	
	/**회원탈퇴 승인
	 * @param memberNo
	 * @param model
	 * @param ra
	 * @return
	 */
	@PostMapping("deleteMember")
	public String deleteMember(int memberNo ,Model model,RedirectAttributes ra) {
		int result = service.deleteMember(memberNo);
		System.out.println(result);
		if(result>0) {
			swalSetMessage(ra, "susess", "정상승인 되었습니다", null);
		}else{
			swalSetMessage(ra, "error", "승인 실패 하였습니다", null);
			
		}
		return "redirect:main";
	}
	
	@GetMapping("report")
	public String report(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg) {
		pg.setCurrentPage(cp);
		pg = service.getReportListCount(pg);
		List<Report> reportList = service.selectReportList(pg);
		model.addAttribute("reportList", reportList);
		model.addAttribute("pg",pg);
		return "admin/report";
	}
	@PostMapping("reportCheck")
	public String reportCheck(Model model, int reviewNo ,RedirectAttributes ra) {
		int result = service.reportCheck(reviewNo);
		if(result>0) {
			swalSetMessage(ra, "susess", "정상 승인 되었습니다", null);
		}else{
			swalSetMessage(ra, "error", "승인 실패 하였습니다", null);
			
		}
		
		
		return "redirect:report";
	}
	
	// 게시글 관리 목록
	@RequestMapping(value="manageBoard", method=RequestMethod.GET)
	public String manageBoard(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp,
			Model model, Pagination pg) {
		
		// 1) pg에 cp를 세팅
		pg.setCurrentPage(cp);
		
		// 2) 전체 목록 수를 조회하여 Pagination 관련 내용을 계산하고 값을 저장한 객체 반환 받기
		Pagination pagination = service.getPagination(pg);
		
		// 3) 생성된 pagination을 이용하여 현재 목록 페이지에 보여질 게시글 목록 조회
		List<Place> boardList = service.selectPlaceList(pagination);

		model.addAttribute("boardList", boardList);
		model.addAttribute("pagination", pagination);
		
		return "admin/manageBoard";
	}
	
	
	@RequestMapping(value="updateStatus", method=RequestMethod.POST)
	@ResponseBody
	public int updateStatus(Place place) {
		
		return service.updateStatus(place);
	}
	
	
	

	// SweetAlert
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
}
