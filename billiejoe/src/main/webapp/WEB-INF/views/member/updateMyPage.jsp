<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	margin-left: 30%;
	width: 20%;
}

#profileImg {
	display: none;
}

#profileImg-area {
	text-align: center;
}

#profileImg-area>div {
	width: 150px;
	height: 150px;
	background-color: #eee;
	border-radius: 50%;
	display: inline-block;
	border: 1px solid black;
	background-size: 120%;
	background-position: center;
	background-repeat: no-repeat;
}

.flex-shrink-0{

	display : inline-block;
	float :left;
	
	}

#profileImg-area>div>p {
	margin-top: 50px;
}

#memberPic {
	width: 150px;
	height: 150px;
}
</style>
</head>

<body>


	<main>
		<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
			<a href="#"
				class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
				<span class="fs-5 fw-semibold">마이페이지</span>
			</a>
			<ul class="list-unstyled ">
				<li class="mb-1">
					<a href="${contextPath}/member/myPage">내 정보 </a><br> 
					<a href="#"><b>내 정보 수정</b></a><br> 
					<a href="${contextPath}/member/changePwd">비밀번호 변경</a></li>
				<hr>

				<li class="mb-1"><a href="#">내가 예약한 장소 </a><br> <a
					href="#">내가 찜한 장소</a><br> <a href="${contextPath}/review/reviewList">내가 작성한 후기</a></li>
				<hr>
				<li class="mb-1">
					<a href="#">내가 등록한 장소</a><br> 
					<a href="#">예약 접수 내역</a><br></li>
				<hr>


			</ul>
		</div>
		<div class="container py-5">
			<div class="bg-white rounded container p-3">
				<form method="POST" enctype="multipart/form-data"
					action="${contextPath}/member/updateMyPage"
					onsubmit="return updateValidate();" class="form-horizontal"
					role="form">


					<a href="${contextPath}/member/secession" class="col-md-6 offset-md-7" style="color: gray;">탈퇴하기</a>
					<br> <br>

					<div class="row mb-3 form-row">

						<div class="col-md-2">
							<h6>이메일</h6>
						</div>
						<div class="col-md-6">
							<h5>${loginMember.memberEmail}</h5>
						</div>
					</div>
					<div class="col-md-6 offset-md-3">
						<span>&nbsp;</span>
					</div>

					<div class="row mb-3 form-row">
						<div class="col-md-2">
							<h6>이름</h6>
						</div>
						<div class="col-md-6">
							<input type="text" class="form-control" id="memberName"
								name="memberName" value="${loginMember.memberName}">
						</div>
						<div class="col-md-6 offset-md-3">
							<span>&nbsp;</span>
						</div>
					</div>
					<div class="row mb-3 form-row">
						<div class="col-md-2">
							<h6>전화번호</h6>
						</div>
						<div class="col-md-6">
							<input type="number" class="form-control input-email"
								id="memberPhone" name="memberPhone"
								value="${loginMember.memberPhone}" autocomplete="off" required>
						</div>
					</div>

					<div class="col-md-6 offset-md-3">
						<span>&nbsp;</span>
					</div>

					<div class="row mb-3 form-row">
						<div class="col-md-2">
							<h6>프로필 이미지</h6>
							<p>(선택사항)</p>
						</div>

						<div class="col-md-6" id="profileImg-area">
							<div id="picture">
								<img class="img-thumbnail rounded-circle" id="memberPic" src="${contextPath}/${loginMember.memberPic}">
								
							</div>
						</div>

						<input type="file" id="profileImg" name="profileImg"
							onchange="LoadImg(this,0)">

					</div>



					<div class="col-md-6 offset-md-3">
						<span>&nbsp;</span>
					</div>

					<button class="btn btn-md btn-block btn-primary" type="submit"
						id="update-btn">정보 수정</button>
					<br> <br>
				</form>
			</div>

		</div>
	</main>
	<script>
		// 선택시 프로필 이미지 선택
		$(function() {
			$("#picture").on("click", function() {
				$("#profileImg").click();
			});
		});
		
		
		// 사진 미리보기 
		
		function LoadImg(value) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);
				reader.onload = function(e) {
					$("#memberPic").attr("src", e.target.result);
				}
			}
		}

	
	</script>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script src="${contextPath}/resources/js/updateMyPage.js"></script>
	