<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- header.jsp -->
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>findPwd</title>
  <!-- Bootstrap core CSS -->
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <link href="dist/css/style.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4" crossorigin="anonymous"></script>
</head>

<style>
.form-control{
  margin-bottom: 10px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
  text-align: center;


}
.form-signin{
    position: relative;
    box-sizing: border-box;
    height: auto;
    padding: 10px;
    font-size: 16px;
    margin-left: 30%;;
}

  #email-btn{
    color : white;
    font-size: medium;
    margin-top: 10px;
    
}

body {
    align-items: center;
    padding-top: 40px;
    padding-bottom: 40px;
}

.form-signin{
  width: 40%;
}

h5, p{
  text-align: center;
}


</style>


<body>
  <header class="sticky-top shadow">
    <nav class="navbar navbar-light flex-md-nowrap p-0 container">
      <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3" href="#">billieJoe</a>
      <div class="input-group">
        <select class="form-select form-control-dark" id="placeSearchCond">
          <option value="1" selected>장소명</option>
          <option value="2">Two</option>
          <option value="3">Three</option>
        </select>
        <input class="form-control form-control-dark" type="text" placeholder="Search">
      </div>
      <ul class="navbar-nav">
        <li class="nav-item text-nowrap">
          <a class="nav-link px-3" href="#">로그인</a>
        </li>
        <li class="nav-item text-nowrap">
          <a class="nav-link px-3" href="#">회원가입</a>
        </li>
      </ul>
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
<!-- // header.jsp -->

<!-- 본문 시작 -->
<!-- 각 페이지의 jsp 파일은 header와 footer를 제외한 본문만 남겨서 작성해주세요. (이클립스에서 보여주는 빨간줄 표시는 무시하셔도 됩니다.) -->
<!-- !!! 강사님은 알아서 합쳐주니 괜찮다고 하셨지만 세 부분으로 나누어 졌을 때 겹치는 곳이 없고 셋이 합쳐 하나의 완성된 html 파일이 되도록 include 되어야 합니다 !!! -->
  <div class="container py-5">


    <form class="form-signin" action="${contextPath}/mail/sendMail">

      <h5><b>비밀번호 찾기</b></h5><br><br>
      <p>가입시 입력한 이메일과 이름으로 비밀번호 찾기가 가능합니다.</p>
      <p>이메일 주소로 임시 비밀번호를 발송합니다.</p><br>
      <input type="email" id="inputEmail" class="form-control" placeholder="ID(이메일)을 입력하세요" required autofocus>

      <input type="text" id="inputName" class="form-control" placeholder="이름을 입력하세요" required autofocus>

      <button class="btn btn-lg btn-block btn-primary" id="email-btn" type="submit">비밀번호 찾기</button>
     
    </form>
  </div>
<!-- // 본문 끝 -->

<!-- footer -->
  <footer>
    <div class="container">
      © 2021 billieJoe All Rights Reserved.
    </div>
  </footer>
</body>
</html>
<!-- //footer -->