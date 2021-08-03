package kr.co.billiejoe.admin.model.service;

import kr.co.billiejoe.member.model.vo.Member;

public interface AdminService {

	/** 관리자 로그인 Service
	 * @param inputMember
	 * @return loginMember
	 */
	public abstract Member login(Member inputMember);

}
