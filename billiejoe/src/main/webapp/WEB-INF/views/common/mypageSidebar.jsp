<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
      <nav class="col-md-3">
      	<div class="list-group">
          <a href="${contextPath}/member/myPage" class="list-group-item list-group-item-action ${myPage}">내 정보</a>
          <a href="${contextPath}/member/updateMyPage" class="list-group-item list-group-item-action ${updateMyPage}">내 정보 수정</a>
          <a href="${contextPath}/member/changePwd" class="list-group-item list-group-item-action ${changePwd}">비밀번호 변경</a>
          <hr>
          <a href="${contextPath}/place/myReservation" class="list-group-item list-group-item-action ${myReservation}">내가 예약한 장소</a>
          <a href="${contextPath}/place/myLikePlace" class="list-group-item list-group-item-action ${myLikePlace}">내가 찜한 장소</a>
          <a href="${contextPath}/review/reviewList" class="list-group-item list-group-item-action ${reviewList}">내가 작성한 후기</a>
          <hr>
          <a href="${contextPath}/review/reviewList" class="list-group-item list-group-item-action ${reviewList}">내가 등록한 장소</a>
          <a href="${contextPath}/mypage/bookedList" class="list-group-item list-group-item-action ${myReservation}">예약 접수 내역</a>
        </div>
      </nav>