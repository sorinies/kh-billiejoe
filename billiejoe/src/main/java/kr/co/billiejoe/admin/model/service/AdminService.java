package kr.co.billiejoe.admin.model.service;

import java.util.List;
import java.util.Map;

import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.vo.Pagination;

public interface AdminService {

	/** 관리자 로그인 Service
	 * @param inputMember
	 * @return loginMember
	 */
	public abstract Member login(Member inputMember);

	public abstract List<Member> selectMemberList(Pagination pg);

	public abstract Pagination getMemberPg(Pagination pg);

	public abstract Pagination getMemberPg(Pagination pg, Map<String, String> search);

	public abstract List<Member> selectMemberList(Pagination pg, Map<String, String> search);

	public abstract int deleteMember(int memberNo);

	public abstract Pagination getUnRegMemberPg(Pagination pg);

	public abstract List<Member> selectUnRegMemberList(Pagination pg);

	public abstract Pagination getUnRegMemberPg(Pagination pg, Map<String, String> search);

	public abstract List<Member> selectUnRegMemberList(Pagination pg, Map<String, String> search);


}
