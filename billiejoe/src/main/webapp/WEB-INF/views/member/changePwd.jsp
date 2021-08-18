<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>비밀번호 변경</title>
<!-- Bootstrap core CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
	crossorigin="anonymous"></script>
<link href="../dist/css/admin_sidebars.css" rel="stylesheet">
<jsp:include page="../common/header.jsp"></jsp:include>
<style>
a {
	text-decoration: none;
	color: black;
}

hr {
	width: 70%;
}

.border-bottom {
	width: 70%;
}

h6 {
	width: 110%;
}

#update-btn {
	margin-left: 20%;
	width: 25%;
}

.flex-shrink-0 {
	display: inline-block;
	float: left;
}

.containerH {
	margin-left: 100px;
}
</style>

</head>

<body>
	<!-- // header.jsp -->
	<!-- 본문 시작 -->
	<div class="containerH py-5">
		<div class="content-header row">
			<h2 class="col">비밀번호 변경</h2>
		</div>
		<div class="row">
			<jsp:include page="../common/mypageSidebar.jsp"></jsp:include>

			<div class="col-md-9">

				<div class="bg-white rounded  container p-3">
					<form method="POST" action="${contextPath}/member/changePwd"
						onsubmit="return validate();" class="form-horizontal" role="form">



						<div class="row mb-3 form-row">
							<div class="col-md-2">
								<h6>현재 비밀번호</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="currentPwd"
									name="currentPwd" placeholder="현재 비밀번호를 입력하세요">
							</div>
						</div>
						<div class="col-md-6 offset-md-3">
							<span>&nbsp;</span>
						</div>

						<div class="row mb-3 form-row">
							<div class="col-md-2">
								<h6>새로운 비밀번호</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="newPwd1"
									name="newPwd1" placeholder="영문/숫자/특수문자 혼합 8자리 이상">
							</div>
							<div class="col-md-6 offset-md-3">
								<span id="checkNewPwd1">&nbsp;</span>
							</div>
						</div>
						<div class="row mb-3 form-row">
							<div class="col-md-2">
								<h6>새 비밀번호(확인)</h6>
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control" id="newPwd2"
									name="newPwd2" placeholder="새 비밀번호를 다시 입력하세요">
							</div>

							<div class="col-md-6 offset-md-3">
								<span id="checkNewPwd2">&nbsp;</span>
							</div>
						</div>

						<div class="col-md-6 offset-md-3">
							<span>&nbsp;</span>
						</div>

						<button class="btn btn-md btn-block btn-primary" type="submit"
							id="update-btn">변경하기</button>

					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="../dist/js/admin_sidebars.js"></script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/changePwd.js"></script>
</body>

</html>