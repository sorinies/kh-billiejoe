<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>내가 예약한 장소</title>
  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
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
    h6{
      width: 110%;
    }

    #update-btn{
      margin-left: 30%;
      width: 20%;
    }

    .input-group{
        width: 20%;
    }

   

 
  </style>
</head>

<body>
  <main>
    <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
      <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
        <span class="fs-5 fw-semibold">내가 예약한 장소</span>
      </a>
      <ul class="list-unstyled ">
        <li class="mb-1">
          <a href="#">내 정보 </a><br>
          <a href="#">내 정보 수정</a><br>
          <a href="#">비밀번호 변경 </button>
        </li>
        <hr>
        <li class="mb-1">
          <a href="#">내가 예약한 장소 </a><br>
          <a href="#">내가 찜한 장소</a><br>
          <a href="#">내가 작성한 후기</a>
        </li>
        <hr>
        <li class="mb-1">
          <a href="#">내가 등록한 장소</a><br>
          <a href="#">예약 접수 내역</a><br>
        </li>
        <hr>


      </ul>
    </div>
    <div class="container py-5">
        <div class="input-group  mb-3 w-50">
            <select class="form-select" id="searchUserCond" name="searchUserCond">
              <option selected>지역</option>
              <option value="userEmail">이메일</option>
              <option value="userNickname">닉네임</option>
            </select> 
            &ensp;
       
            <select class="form-select" id="searchUserCond" name="searchUserCond">
              <option selected>등록일 최신순</option>
              <option value="userEmail">이메일</option>
              <option value="userNickname">닉네임</option>
            </select>
        </div>
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
              <li class="page-item disabled">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true">&laquo;</span>
                </a>
              </li>
              <li class="page-item active"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item"><a class="page-link" href="#">4</a></li>
              <li class="page-item"><a class="page-link" href="#">5</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true">&raquo;</span>
                </a>
              </li>
            </ul>
          </nav>
    </div>
  </main>

  <script src="../dist/js/admin_sidebars.js"></script>
  <jsp:include page="../common/footer.jsp"></jsp:include>


</body>

</html>