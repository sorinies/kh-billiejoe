package kr.co.billiejoe.member.model.service;

import org.springframework.web.multipart.MultipartFile;

import kr.co.billiejoe.member.model.vo.Member;

public interface MemberService {

	/** // 로그인 Service
	 * @param inputMember
	 * @return loginMember
	 */
	public abstract Member login(Member inputMember);

	/** 이메일(ID) 중복검사
	 * @param email
	 * @return result
	 */
	public abstract int emailDupCheck(String email);

	/** 회원 가입 Service
	 * @param inputMember
	 * @param savePath 
	 * @param webPath 
	 * @param images 
	 * @return result
	 */
	public abstract int signUp(Member inputMember, MultipartFile images, String webPath, String savePath);


}
