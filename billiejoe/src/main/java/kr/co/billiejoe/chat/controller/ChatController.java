package kr.co.billiejoe.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.billiejoe.chat.model.service.ChatService;
import kr.co.billiejoe.chat.model.vo.ChatList;
import kr.co.billiejoe.chat.model.vo.ChatMsg;
import kr.co.billiejoe.chat.model.vo.ChatRoom;
import kr.co.billiejoe.member.controller.MemberController;
import kr.co.billiejoe.member.model.vo.Member;
import kr.co.billiejoe.place.model.service.PlaceService;
import kr.co.billiejoe.place.model.service.PlaceServiceImpl;
import kr.co.billiejoe.place.model.vo.Place;

@Controller
@RequestMapping("/chat/*")
@SessionAttributes({"loginMember","chatRoomNo"})
public class ChatController {
	@Autowired
	private ChatService service;
	
	
	@RequestMapping(value = "/room", method = RequestMethod.GET)
	public String chatRoom(ChatRoom chatRoom,Model model,int joinMemberNo) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		System.out.println("접속자 번호 : " +loginMember.getMemberNo() );
		String path = null;
//		로그인 안하고 채팅 신청시
		if(loginMember ==null ) {
			System.out.println("안됨");
		}else {
			
			if(chatRoom.getPlaceMemberNo() != loginMember.getMemberNo()) {
				
				chatRoom.setMemberNo(loginMember.getMemberNo());
			}else {
				chatRoom.setMemberNo(joinMemberNo);
			}
			System.out.println("셋팅된 번호 : " +chatRoom.getMemberNo() );
			
			String chatNo = Integer.toString(chatRoom.getPlaceNo())+chatRoom.getPlaceMemberNo()+chatRoom.getMemberNo();
			chatRoom.setChatRoomNo(Integer.parseInt(chatNo));
			System.out.println("최종 번호 : " +chatRoom.getChatRoomNo() );
//			채팅방만들기
			int check = service.openChatRoom(chatRoom);
			if(check>0) {
//				채팅방 만들어져서 채팅방 상세 보기
				List<ChatMsg> list = service.selectList(chatRoom);
//				채팅방 장소 상세정보 가져오기
			
				Place chatPlace = service.chatPlace(chatRoom);
				model.addAttribute("chatRoom", chatRoom);
				model.addAttribute("chatPlace", chatPlace);
				model.addAttribute("list",list);
				model.addAttribute("chatRoomNo",chatRoom.getChatRoomNo());
				path = "chat/chatView";
			}
			
		}
		return path;
	}
	
	
	@GetMapping("/list")
	public String chatList(Model model) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		
		List<ChatList> chatList = service.selectChatList(loginMember.getMemberNo());
		model.addAttribute("chatList", chatList);
		
		System.out.println(chatList);
		
		return "chat/chatList";
	}
	
	@PostMapping("/delete")
	public String chatRoomDelete(ChatRoom chatRoom, Model model, RedirectAttributes ra) {
		Member loginMember = (Member)model.getAttribute("loginMember");
		chatRoom.setMemberNo(loginMember.getMemberNo());
		int result = service.chatRoomDelete(chatRoom);
		if(result>0) {
			MemberController.swalSetMessage(ra, "sucess", "삭제 성공하셨습니다", null);
		}else {
			MemberController.swalSetMessage(ra, "error", "삭제 실패하셨습니다", null);
		}
		
		return "chat/chatList";
	}
}
