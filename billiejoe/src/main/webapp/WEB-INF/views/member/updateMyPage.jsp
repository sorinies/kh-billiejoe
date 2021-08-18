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

#profileImg-area>div>p {
	margin-top: 50px;
}

#memberPic {
	width: 150px;
	height: 150px;
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
			<h2 class="col">내 정보 수정</h2>
		</div>
		<div class="row">
			<jsp:include page="../common/mypageSidebar.jsp"></jsp:include>

			<div class="col-md-9">

				<form method="POST" enctype="multipart/form-data"
					action="${contextPath}/member/updateMyPage"
					onsubmit="return updateValidate();" class="form-horizontal"
					role="form">


					<a href="${contextPath}/member/secession"
						class="col-md-6 offset-md-7" style="color: gray;">탈퇴하기</a> <br>
					<br>

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
								<img class="img-thumbnail rounded-circle" id="memberPic"
									src="${contextPath}/${loginMember.memberPic}">

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
	</div>
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