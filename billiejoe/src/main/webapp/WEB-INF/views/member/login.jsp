<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>로그인</title>

	<link href="${contextPath}/resources/css/memberStyle.css" rel="stylesheet">
  
</head>
<body>
	<!-- // header.jsp -->
	<jsp:include page="../common/header.jsp"></jsp:include>

	<!-- 본문 시작 -->
	<!-- 각 페이지의 jsp 파일은 header와 footer를 제외한 본문만 남겨서 작성해주세요. (이클립스에서 보여주는 빨간줄 표시는 무시하셔도 됩니다.) -->
	<!-- !!! 강사님은 알아서 합쳐주니 괜찮다고 하셨지만 세 부분으로 나누어 졌을 때 겹치는 곳이 없고 셋이 합쳐 하나의 완성된 html 파일이 되도록 include 되어야 합니다 !!! -->
	<div class="container py-5 outer">
	
		<form action="login" method="post" class="form-signin" onsubmit="return loginValidate();">
			
			<div class="row text-center login">
				<h1>BillieJoe</h1>
			</div>
	
			<div class="row login">
				<input class="form-control" type="text" id="memberEmail" name="memberEmail" placeholder="이메일을 입력하세요" value="${cookie.saveEmail.value }">
			</div>
	
			<div class="row login">
				<input class="form-control" type="password" id="memberPw" name="memberPw" placeholder="비밀번호를 입력하세요">
			</div>
	
			<c:if test="${ !empty cookie.saveEmail.value }">
				<c:set var="ch" value="checked" />
			</c:if>
	
			<div class="row text-center login">
				<label> <input type="checkbox" name="save" id="save" ${ch}>
					이메일 저장
				</label>
			</div>
	
			<div class="row login">
				<button type="submit" class="btn btn-secondary">로그인</button>
			</div>
	
			<div class="row text-center login">
				<a href="${contextPath}/member/signUp">아직 회원이 아니신가요?</a>
			</div>
		</form>
	</div>

		<%-- 로그인 실패와 같은 메세지가 서버로부터 전달되어 온 경우 출력 --%>
		<c:if test="${!empty title}">
			<script>
				swal({
					"icon" : "${icon}",
					"title" : "${title}",
					"text" : "${text}"
				});
			</script>
		</c:if>

	<!-- // 본문 끝 -->

	<!-- footer -->
	<jsp:include page="../common/footer.jsp"></jsp:include>
	
	<script src="${contextPath}/resources/js/member.js"></script>
</body>
</html>