<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- header.jsp -->
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mypageSidebar</title>
  <!-- Default Style -->
  <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  
</head>

<body>
    
      <nav class="col-md-3">
      	<div class="list-group" id="mp">
          <a href="${contextPath}/member/myPage" class="list-group-item list-group-item-action">내 정보</a>
          <a href="${contextPath}/member/updateMyPage" class="list-group-item list-group-item-action">내 정보 수정</a>
          <a href="${contextPath}/member/changePwd" class="list-group-item list-group-item-action">비밀번호 변경</a>
          <hr>
          <a href="${contextPath}/place/myReservation" class="list-group-item list-group-item-action">내가 예약한 장소</a>
          <a href="${contextPath}/place/myLikePlace" class="list-group-item list-group-item-action">내가 찜한 장소</a>
          <a href="${contextPath}/review/reviewList" class="list-group-item list-group-item-action">내가 작성한 후기</a>
          <hr>
          <a href="${contextPath}/review/reviewList" class="list-group-item list-group-item-action">내가 등록한 장소</a>
          <a href="${contextPath}/place/myReservation" class="list-group-item list-group-item-action">예약 접수 내역</a>
        </div>
      </nav>
      
      <script>
     	  // 해당 내용을 클릭했을 때 클릭 이벤트가 발생하는 곳에 css효과
	      $('#mp a').click(function () {
	
	    	 $(this).parent().children("a").removeClass("active");
	         $(this).addClass("list-group-item list-group-item-action active");
	         
	      });
      </script>
      
      

</body>

</html>
        
        
        
        
        
        
        
        
        
        
