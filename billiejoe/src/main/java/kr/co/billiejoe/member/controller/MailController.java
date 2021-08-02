package kr.co.billiejoe.member.controller;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mail/*")
public class MailController {

	@Autowired
	private JavaMailSender mailSender; // 메일 (root-context)
	
	@RequestMapping("findPwd")
	public String findPwd() {
		return null;
	}
	
	@RequestMapping("sendMail")
	public String sendMail() {
		  String setfrom = "zxcvzvv55@gmail.com";
	      String tomail = "HyeJ@student.kenvale.edu.au"; // 받는 사람 이메일
	      String title = "이메일 테스트"; //제목
	      
	      String content = "임시 비밀번호는  \n 1234입니다."; // 내용
	      String key = ""; 
	      
	      // 1) 입력받은 이름과 이메일이 실제로 DB에 있는 회원인지 확인
	      // 2) 있다면 임시비밀번호 생성 및 DB에 저장 + (Service에서 암호화진행)
	      // 3) 있다면 임시 비밀번호 메일 보내기 구문 실행 
	      
	      System.out.println(tomail);
	      try {
	            
	         MimeMessage message = mailSender.createMimeMessage();
	         MimeMessageHelper messageHelper = new MimeMessageHelper(message,true, "UTF-8");

	         messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	         messageHelper.setTo(tomail); // 받는사람 이메일
	         messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	         messageHelper.setText(content + key); // 메일 내용

	         mailSender.send(message);
	      } catch (Exception e) {
	         System.out.println(e);
	      }

	      return "redirect:/";
	   }
	}

