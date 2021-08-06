package kr.co.billiejoe.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.reflection.SystemMetaObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.billiejoe.member.model.service.MemberService;
import kr.co.billiejoe.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
@SessionAttributes({ "loginMember" })
public class MemberController {

	@Autowired
	private MemberService service;

	
	/**
	 * 로그인 화면 전환 Controller
	 * 
	 * @return "member/login"
	 */
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "member/login";
	}

	
	
	/**
	 * 로그인 Controller
	 * 
	 * @param inputMember
	 * @param model
	 * @param request
	 * @param response
	 * @param ra
	 * @param save
	 * @return "redirect:/"
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
				cookie.setMaxAge(60 * 60 * 24 * 7); // 일주일 유지
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
		return "redirect:/";
	} // login end

	
	
	/**
	 * 로그아웃 Controller
	 * 
	 * @param status
	 * @param referer
	 * @return "redirect:/"
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, @RequestHeader("referer") String referer) {
		status.setComplete();
		return "redirect:/";
	} // logout end

	
	
	/**
	 * 회원가입 화면 전환 Controller
	 * 
	 * @return "member/signUp"
	 */
	@RequestMapping(value = "signUp", method = RequestMethod.GET)
	public String signUp() {
		return "member/signUp";
	}

	
	
	/**
	 * 회원가입 Controller
	 * 
	 * @return result
	 */
	@RequestMapping(value = "signUp", method = RequestMethod.POST)
	public String signUp(@ModelAttribute Member inputMember, RedirectAttributes ra,
			@RequestParam("images") MultipartFile images, HttpServletRequest request) {

		String webPath = "resources/images/";

		String savePath = request.getSession().getServletContext().getRealPath(webPath);

		// DB에 회원 정보를 삽입하는 Service 호출
		int result = service.signUp(inputMember, images, webPath, savePath);

		// 회원 가입 성공 또는 실패 경우에 따라 출력되는 메세지 제어(SweetAlert)
		if (result > 0) {
			swalSetMessage(ra, "success", "회원 가입 성공", inputMember.getMemberName() + "님 환영합니다.");
		} else {
			swalSetMessage(ra, "error", "회원 가입 실패", "고객센터로 문의해주세요.");

		}

		return "redirect:/";
	} // signUp end

	
	
	/** 아이디 중복 검사 Controller(ajax)
	 * @param email
	 * @return result
	 */
	@ResponseBody
	@RequestMapping(value = "emailDupCheck", method = RequestMethod.POST)
	public int emailDupCheck(@RequestParam("email") String email) {

		int result = service.emailDupCheck(email);

		return result;

	} // emailDupCheck end
	
	
	
	/** 회원 탈퇴 화면 전환 Controller
	 * @return "redirect:"
	 */
	@RequestMapping(value="secession", method=RequestMethod.GET)
	public String secession() {
		return "member/secession";
	}
	
	
	
	/** 회원 탈퇴 Controller
	 * @param loginMember
	 * @param memberPw
	 * @param ra
	 * @param status
	 * @return path
	 */
	@RequestMapping(value="secession", method=RequestMethod.POST)
	public String secession(@ModelAttribute("loginMember") Member loginMember, //  로그인 된 회원 정보
							@RequestParam("memberPw") String memberPw, // 입력된 현재 비밀번호
							RedirectAttributes ra, // 메세지 전달용 객체
							SessionStatus status) { // 세션 상태 관리 객체(세션 만료용, 로그아웃 객체)
		
		int result = service.secession(memberPw, loginMember);
		
		String path = "redirect:";
		
		if( result > 0 ) { // 성공
			int result2 = service.secessionInsert(loginMember);
			path += "/";
			swalSetMessage(ra, "success", "회원탈퇴 성공", "이용해 주셔서 감사합니다.");
			
			if(result2>0) {
				status.setComplete(); // 자동 로그아웃
			}
			
		}else { // 실패
			path+="secession";
			swalSetMessage(ra, "error", "회원탈퇴 실패", "모든 예약건은 취소 후 진행해주세요.");
		}
		
		return path;
		
	}// secession end
	
	
	// 마이페이지 작업 시작부분
	
	
	
	
	
	
	
	
	
	
	// 마이페이지 작업 끝
	
	
	
	// SweetAlert(공용, 맨 아래에 위치)
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		
		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
		
	} // swalSetMessage end
	
} // controller class end
