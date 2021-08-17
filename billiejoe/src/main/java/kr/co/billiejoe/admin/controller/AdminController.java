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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.billiejoe.admin.model.service.AdminService;
import kr.co.billiejoe.member.controller.MemberController;
import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.vo.Pagination;
import kr.co.billiejoe.place.model.vo.Report;
import kr.co.billiejoe.review.model.service.ReviewService;
import kr.co.billiejoe.review.model.vo.Review;

@Controller
@RequestMapping("/admin/*")
@SessionAttributes({ "loginMember" })
@Transactional
public class AdminController {

	@Autowired
	private AdminService service;

	
	
	private  ReviewService service2;
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
    * @return "redirect:main"
    */
   @RequestMapping(value = "login", method = RequestMethod.POST)
   public String login(Member inputMember, Model model, 
                  HttpServletRequest request, 
                  HttpServletResponse response,
                  RedirectAttributes ra, 
                  @RequestParam(value = "save", required = false) String save,
                  @RequestHeader("referer") String referer) {
      
      Member loginMember = service.login(inputMember);
      System.out.println("컨트롤러 확인 : "+loginMember);
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
         
         return "redirect:main"; // 성공하면 관리자 메인인 회원정보로 이동
         
      } else {
         ra.addFlashAttribute("icon", "error");
         ra.addFlashAttribute("title", "관리자 로그인 실패");
         ra.addFlashAttribute("text", "일반회원은 로그인이 불가능합니다.");

         return "redirect:" + referer; // 실패하면 이전 로그인 화면으로 이동
      
      }
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
	
	/** 신고 목록
	 * @param cp
	 * @param model
	 * @param pg
	 * @return "admin/report"
	 */
	@GetMapping("report")
	public String report(@RequestParam(value = "cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg) {
		pg.setCurrentPage(cp);
		pg = service.getReportListCount(pg);
		List<Report> reportList = service.selectReportList(pg);
		model.addAttribute("reportList", reportList);
		model.addAttribute("pg",pg);
		return "admin/report";
	}
	
	/** 신고 체크
	 * @param model
	 * @param reviewNo
	 * @param ra
	 * @return "redirect:report"
	 */
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
	
	/** 관리자 후기 관리 목록
	 * @param cp
	 * @param model
	 * @param pg
	 * @return "admin/review"
	 */
	@GetMapping("review")
	public String adminReviewList( @RequestParam(value="cp", required = false, defaultValue = "1") int cp, Model model, Pagination pg) {
		
		pg.setCurrentPage(cp);
		pg = service.getAdminReviewListCount(pg);
		List<Review> adminReviewList = service.selectAdminReviewList(pg);
		System.out.println("컨트롤 : "+ pg);
		System.out.println(adminReviewList);
		model.addAttribute("adminReviewList", adminReviewList);
		model.addAttribute("pg",pg);
		
		return "admin/review";
		
	}
	
	/** 관리자 후기 상세조회 Controller
	 * @param model
	 * @param ra
	 * @return
	 */
	@RequestMapping(value="{reviewNo}", method = RequestMethod.GET)
	public String reviewView( @PathVariable("reviewNo") int reviewNo,
							  @RequestParam(value="cp", required=false, defaultValue = "1") int cp,
							  Model model, 
							  RedirectAttributes ra) {
		
		// 후기 상세 조회 Service 호출
		Review reviewView = service.selectAdminReview(reviewNo);
		System.out.println("리뷰결과 : " + reviewView);
		
		if(reviewView != null) {
			model.addAttribute("reviewView", reviewView);
			return "admin/adminReviewView";
			
		}else {
			MemberController.swalSetMessage(ra, "error", "후기 상세 조회 실패", "해당 후기가 존재하지 않습니다.");
			return "redirect:review";
		}
	}
	
	/** 관리자 후기 삭제 Controller
	 * @param reviewNo
	 * @param ra
	 * @return "redirect:reviewList"
	 */
	@RequestMapping(value="deleteReview", method=RequestMethod.POST)
	public String deleteReview(@RequestParam int reviewNo, RedirectAttributes ra) {
		
		int result =service.deleteReview(reviewNo);
		
		if(result>0) {
			swalSetMessage(ra, "success", "후기 삭제 성공", null);
		}else {
			swalSetMessage(ra, "error", "후기 삭제 실패", null);
		}
		
		return"redirect:review";
	}
	
	// SweetAlert
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
}
