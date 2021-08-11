package kr.co.billiejoe.member.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	}

	/**
	 * 로그아웃 Controller
	 * 
	 * @param status
	 * @param referer
	 * @return "redirect:" + referer
	 */
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(SessionStatus status, @RequestHeader("referer") String referer) {
		status.setComplete();
		return "redirect:" + referer;
	}

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
	}

	/** 아이디 중복 검사 Controller(ajax)
	 * @param email
	 * @return result
	 */
	@ResponseBody
	@RequestMapping(value = "emailDupCheck", method = RequestMethod.POST)
	public int emailDupCheck(@RequestParam("email") String email) {

		int result = service.emailDupCheck(email);

		return result;

	}
	
	// 마이페이지 화면 전환용 Controller
	@RequestMapping(value="myPage", method=RequestMethod.POST)
	public String myPage() {
		return "member/myPage";
	}
	
	// 마이페이지 Controller
	public String myPage(@ModelAttribute("loginMember") Member loginMember)
	
	
	// 내 정보 수정 화면 전환용 Controller 
	// /member/myPage 주소로 요청이 오면
	// /WEB-INF/views/member.myPage.jsp로 요청 위임(forward)
	@RequestMapping(value="updateMyPage", method=RequestMethod.GET)
	public String updateMyPage() {
		return "member/updateMyPage";
	}
	
	// 회원 정보 수정 Controller
	@RequestMapping(value="updateMyPage", method=RequestMethod.POST)
	public String updateMember(@ModelAttribute("loginMember") Member loginMember, String memberName, String memberPhone, 
			@RequestParam("profileImg")	MultipartFile image, /*업로드된 이미지 파일*/
			Member inputMember, RedirectAttributes ra, HttpServletRequest request) {
		
		inputMember.setMemberNo(loginMember.getMemberNo());
		inputMember.setMemberName(memberName);
		inputMember.setMemberPhone(memberPhone);
		//inputMember.setMemberPic(images);
		
		System.out.println(inputMember);
		
		String savePath = request.getSession().getServletContext().getRealPath("/");
				
		int result = service.updateMember(inputMember, image, savePath);
		
		
		
		System.out.println("result : " + result);
		
		if (result > 0) {
			loginMember.setMemberName(memberName);
			loginMember.setMemberPhone(memberPhone);
			
			if(!image.getOriginalFilename().equals("")) {
				loginMember.setMemberPic(inputMember.getMemberPic());
			}
			
			swalSetMessage(ra, "success", "회원 정보 수정 성공", null);
		} else {
			swalSetMessage(ra, "error", "회원 정보 수정 실패", null);

		}
		return "redirect:updateMyPage";
	}
	

	// SweetAlert
	public static void swalSetMessage(RedirectAttributes ra, String icon, String title, String text) {

		ra.addFlashAttribute("icon", icon);
		ra.addFlashAttribute("title", title);
		ra.addFlashAttribute("text", text);
	}

	
	
	// 비밀번호 변경 화면 전환 Controller
		@RequestMapping(value="changePwd", method=RequestMethod.GET)
		public String changePwd() {
			
			return "member/changePwd";
		}
		
		// 주소 매핑, 파라미터 전달받기, 세션에서 로그인 정보 얻어오기
		@RequestMapping(value="changePwd", method=RequestMethod.POST)
		public String changePwd(@RequestParam("currentPwd") String currentPwd,
								@RequestParam("newPwd1") String newPwd,
								@ModelAttribute("loginMember") Member loginMember,
								RedirectAttributes ra) {
			
			int result = service.changePwd(currentPwd, newPwd, loginMember);
		
			String path = "redirect:";
			
			if(result > 0) { // 비밀번호 변경 성공
				swalSetMessage(ra, "success", "비밀번호 변경 성공", null);
				path += "updateMyPage";
				loginMember.setMemberPw(newPwd);
				
			}else { // 실패
				swalSetMessage(ra, "error", "비밀번호 변경 실패", null);
				path += "changePwd";
			}		
			
			return path;
		}
		
		
}
