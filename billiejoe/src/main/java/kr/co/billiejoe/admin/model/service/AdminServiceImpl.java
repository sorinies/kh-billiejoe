package kr.co.billiejoe.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.billiejoe.admin.model.dao.AdminDAO;
import kr.co.billiejoe.member.model.vo.Member;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO dao;
	
	// 암호화 객체 생성
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	// 로그인 Service
	@Override
	public Member login(Member inputMember) {
		
		// 암호화
		String encPw = bCryptPasswordEncoder.encode(inputMember.getMemberPw());
		
		Member loginMember = dao.login(inputMember.getMemberEmail());
		
		if(loginMember != null) {
			
			if( !bCryptPasswordEncoder.matches(inputMember.getMemberPw(), loginMember.getMemberPw()) ) {
				loginMember = null;
			
			}else {
				loginMember.setMemberPw(null); 
			}
		
		}	
		
		return loginMember;
	}

}
