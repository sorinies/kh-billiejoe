package kr.co.billiejoe.admin.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.billiejoe.admin.model.service.AdminService;
import kr.co.billiejoe.member.model.vo.Member;

@Controller
@RequestMapping("/admin/*")
@SessionAttributes({ "loginMember" })
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
		return "admin/adminMain";
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

	// SweetAlert
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {
		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}
}
