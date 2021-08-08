<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지</title>
<!-- Bootstrap core CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
    crossorigin="anonymous"></script>
<link href="../dist/css/admin_sidebars.css" rel="stylesheet">
<jsp:include page="../common/header.jsp"></jsp:include>
<!-- jQuery -->
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
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
				<li class="mb-1"><a href="#">내 정보 </a><br> <a href="#">내
						정보 수정</a><br> <a href="#">비밀번호 변경 </a></li>
				<hr>
				<li class="mb-1"><a href="#">내가 예약한 장소 </a><br> <a
					href="#">내가 찜한 장소</a><br> <a href="#">내가 작성한 후기</a></li>
				<hr>
				<li class="mb-1"><a href="#">내가 등록한 장소</a><br> <a href="#">예약
						접수 내역</a><br></li>
				<hr>


			</ul>
		</div>
		<div class="container py-5">
			<div class="bg-white rounded container p-3">
				<form method="POST" enctype="multipart/form-data"
					action="${contextPath}/member/updateMyPage"
					onsubmit="return memberUpdateValidate();" class="form-horizontal"
					role="form">


					<a href="#" class="col-md-6 offset-md-7" style="color: gray;">탈퇴하기</a>
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
								<img class="img-thumbnail rounded-circle" id="memberPic">
								<!-- <p>여기를 눌러 <br>
                        이미지 선택</p> -->
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

	<jsp:include page="../common/footer.jsp"></jsp:include>
	<script src="../dist/js/admin_sidebars.js"></script>
	<script>
		// 선택시 프로필 이미지 선택
		$(function() {
			$("#picture").on("click", function() {
				$("#profileImg").click();
			});
		});
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				reader.readAsDataURL(value.files[0]);
				reader.onload = function(e) {
					$("#memberPic").attr("src", e.target.result);
				}
			}
		}

		// 이미지 영역을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$(function() {
			$(".profileImg").on("click", function() {
				var index = $(".profileImg").index(this);
				$("#profileImg").click();
			});

		});

		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value, num) {
			if (value.files && value.files[0]) {
				var reader = new FileReader();
				// 자바스크립트 FileReader
				// 웹 애플리케이션이 비동기적으로 데이터를 읽기 위하여 읽을 파일을 가리키는 File 혹은 Blob객체를 이용해 파일의 내용을 읽고 사용자의 컴퓨터에 저장하는 것을 가능하게 해주는 객체

				reader.readAsDataURL(value.files[0]);
				// FileReader.readAsDataURL()
				// 지정된의 내용을 읽기 시작합니다. Blob완료되면 result속성 data:에 파일 데이터를 나타내는 URL이 포함 됩니다.

				// FileReader.onload
				// load 이벤트의 핸들러. 이 이벤트는 읽기 동작이 성공적으로 완료 되었을 때마다 발생합니다.
				reader.onload = function(e) {
					// e.target.result
					// -> 파일 읽기 동작을 성공한 객체에(fileTag) 올라간 결과(이미지 또는 파일)

					$(".profileImg").eq(num).children("img").attr("src",
							e.target.result);
				}

			}
		}
	</script>


</body>

</html>