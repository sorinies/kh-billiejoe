<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>billieJoe admin</title>
 
  
  <style>
        #content{
            margin: auto;
            width: 700px;
            height: 400px;
            text-align: center;
        }
        #complete{
            font-size: 35px;
        }
        a{
            width: 300px;
        }
    </style>
</head>

<body>
<jsp:include page="../common/header.jsp"></jsp:include><br><br><br><br>
${reservation}
${place }
   <div class="container">
        <div id="content">
            <p id="complete">예약이 완료 되었습니다.</p>
            <p>예약 날짜 : ${reservation.useDate}</p>
            <p>예약 시간 : ${reservation.useStart}시 ~ ${reservation.useEnd}시</p>
            <p>${place.placeAddr }</p>
            <a href="#" class="btn btn-primary" >예약 내역 확인</a>
            <a href="${contextPath}/chat/room?placeMemberNo=${place.memberNo}&placeNo=${place.placeNo}&joinMemberNo=${loginMember.memberNo}" class="btn btn-secondary">호스트와 채팅하기</a>
        </div>

    </div>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>


</html>