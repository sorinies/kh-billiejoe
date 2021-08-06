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

    #profileImg{
      display: none;
    }

    #profileImg-area{
      text-align: center;
    }

    #profileImg-area > div{
      width: 150px;
      height: 150px;
      background-color: #eee;
      border-radius:50%;
      display: inline-block;
      border: 1px solid black;
      background-image: url("sample4.gif");
      background-size: 120%;
      background-position: center;
      background-repeat: no-repeat;

    }
    #profileImg-area > div > p{
      margin-top: 50px;
    }

   

  </style>
</head>

<body>
  <main>
    <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
      <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
        <span class="fs-5 fw-semibold">마이페이지</span>
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
      <div class="bg-white rounded container p-3">
        <form method="POST" action="" onsubmit="return " class="form-horizontal" role="form">


          <a href="#" class="col-md-6 offset-md-7" style="color: gray;">탈퇴하기</a> <br><br>

          <div class="row mb-3 form-row">

            <div class="col-md-2">
              <h6>이메일</h6>
            </div>
            <div class="col-md-6">
              <input type="email" class="form-control" id="userEmail" name="userEmail">
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
              <input type="text" class="form-control" id="userName" name="userName">
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
              <input type="number" class="form-control input-email" id="userNum" name="userNum" autocomplete="off"
                required>
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
                <div>
                  <!-- <p>여기를 눌러 <br>
                    이미지 선택</p> -->
                </div>
            </div>

            <input type="file" id="profileImg" name="profileImg">
          
        </div>
        
          

          <div class="col-md-6 offset-md-3">
            <span>&nbsp;</span>
          </div>

          <button class="btn btn-md btn-block btn-primary" type="submit" id="update-btn">정보 수정</button>
          <br>
          <br>
        
        </div>
        </form>
      </div>

    </div>
  </main>

  <script src="../dist/js/admin_sidebars.js"></script>


</body>

</html>