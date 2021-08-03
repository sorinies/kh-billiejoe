package kr.co.billiejoe.member.model.service;

import java.io.File;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.billiejoe.member.exception.SaveFileException;
import kr.co.billiejoe.member.model.dao.MemberDAO;
import kr.co.billiejoe.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO dao;
	
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

	// 이메일(ID) 중복검사 Service
	@Override
	public int emailDupCheck(String email) {
		return dao.emailDupCheck(email);
	}

	// 회원 가입 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int signUp(Member inputMember, MultipartFile images, String webPath, String savePath) {
		
		// 비밀번호 암호화
		String encPwd = bCryptPasswordEncoder.encode( inputMember.getMemberPw() );
		inputMember.setMemberPw(encPwd);
		
			// 업로드한 프로필 사진이 있을 경우 
			if( !images.getOriginalFilename().equals("") ) {
				// DB에 저장할 이미지 파일명을 가공 및 inputMember에 세팅
				String fileName = rename( images.getOriginalFilename() );
				String pictureADDR = webPath+fileName;
				inputMember.setMemberPic(pictureADDR);
				
				// 파일저장
				try {
					images.transferTo(new File( savePath + fileName ));
					
				} catch (Exception e) {
					e.printStackTrace();
					
					throw new SaveFileException();
					
				}
				
			}else { // 업로드한 프로필 사진이 없는 경우(null방지)
				inputMember.setMemberPic("/img/....png");
			}
			
			int result = dao.signUp(inputMember);
		
		return result; 
	}
	
	// 파일명 변경 메소드
	private String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
		
		String str = "_" + String.format("%05d", ranNum);
		
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}

}
