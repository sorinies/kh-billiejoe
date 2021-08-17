<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application" value="${pageContext.servletContext.contextPath}"/>
<!-- header.jsp -->
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>billieJoe</title>
  <!-- Google Webfonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@400;700&display=swap" rel="stylesheet">
  <!-- Bootstrap -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
    crossorigin="anonymous"></script>
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
  <!-- jQuery Libs -->
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
  <!-- Default Style -->
  <link href="${contextPath}/resources/css/style.css" rel="stylesheet">
  <link href="${contextPath}/resources/css/admin_sidebars.css" rel="stylesheet">
</head>

<body>
  <header class="sticky-top shadow">
    <nav class="navbar navbar-light flex-md-nowrap p-0 container">
      <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="${contextPath}/">billieJoe</a>
      <form action="${contextPath}/place/list" method="get" class="input-group search-bar">
        <select class="form-select form-control-dark" id="placeSearchCond" name="cond">
          <option value="name" selected>장소명</option>
          <option value="tag">태그</option>
          <option value="addr">주소</option>
        </select>
        <input class="form-control form-control-dark" name="q" type="text" value="${param.q}" placeholder="Search">
        <button type="submit">검색</button>
      </form>
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
      <button class="navbar-toggler me-3" data-bs-toggle="offcanvas" data-bs-target="#offcanvas" type="button"><span
          class="navbar-toggler-icon"></span></button>
      <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvas">
        <div class="offcanvas-header">
          <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        </div>
        <div class="offcanvas-body">
          <ul>
            <li><a href="#">내 장소</a></li>
            <li><a href="#">내 예약</a></li>
            <li><a href="#">채팅</a></li>
          </ul>
          <ul>
            <li><a href="${contextPath}/place/list">모든 장소</a></li>
            <li><a href="#">예약 접수 내역</a></li>
            <li><a href="#">내가 남긴 후기</a></li>
            <li><a href="#">찜한 장소</a></li>
          </ul>
        </div>
      </div>
    </nav>
  </header>