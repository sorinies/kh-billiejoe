<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>billieJoe</title>
  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- sweetalert API 추가 --> 
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<!-- <!-- 달력 ui -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
</head>
<body>
  <header class="sticky-top shadow">
    <nav class="navbar navbar-light flex-md-nowrap p-0 container">
      <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">billieJoe</a>
      <div class="input-group">
        <select class="form-select form-control-dark" id="placeSearchCond">
          <option value="1" selected>장소명</option>
          <option value="2">태그</option>
          <option value="3">주소</option>
        </select>
        <input class="form-control form-control-dark" type="text" placeholder="Search">
      </div>
      
      <ul class="navbar-nav">
		<c:choose>
			<c:when test="${ empty loginMember }">
				<li class="nav-item text-nowrap">
				  <a class="nav-link px-3" href="${contextPath}/member/login">로그인</a>
				</li>
		        <li class="nav-item text-nowrap">
		          <a class="nav-link px-3" href="${contextPath}/member/signUp">회원가입</a>
		        </li>
			</c:when>	
		      
			<c:otherwise>
			<%-- 로그아웃 버튼 --%>
				<li class="nav-item text-nowrap">
					<a class="nav-link px-3" href="${contextPath}/member/myPage">${loginMember.memberName}</a>
				</li>
				<li class="nav-item text-nowrap">
					<a class="nav-link px-3" href="${contextPath}/member/logout">Logout</a>
				</li>
			</c:otherwise>
		</c:choose>	
      </ul>
      
      <%-- swal 창 --%>
	  <c:if test="${!empty title}">
		  <script>
			  swal({
				  "icon" : "${icon}",
	   			  "title" : "${title}",
				  "text" : "${text}"
			  });
		  </script>
	  </c:if>
      
      <button class="navbar-toggler me-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvas" type="button"><span class="navbar-toggler-icon"></span></button>
      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvas">
        <div class="offcanvas-header">
          <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
          <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
          대충 메뉴 들어가는 부분
        </div>
      </div>
    </nav>
  </header>