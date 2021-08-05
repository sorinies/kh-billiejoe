<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>billieJoe admin</title>
  <!-- Bootstrap core CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
    crossorigin="anonymous"></script>
  <link href="${contextPath}/resources/css/admin_sidebars.css" rel="stylesheet">
</head>

<body>
  <main>
    <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
      <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
        <span class="fs-5 fw-semibold">billieJoe ADMIN</span>
      </a>
      <ul class="list-unstyled ps-0">
        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
            data-bs-target="#user-collapse" aria-expanded="false">
            회원 관리
          </button>
          <div class="collapse" id="user-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
              <li><a href="#" class="link-dark rounded">회원 목록</a></li>
              <li><a href="#" class="link-dark rounded">탈퇴 회원 목록</a></li>
            </ul>
          </div>
        </li>
        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
            data-bs-target="#apps-collapse" aria-expanded="true">
            apps 게시판 관리
          </button>
          <div class="collapse show" id="apps-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
              <li><a href="#" class="link-dark rounded">게시글 목록</a></li>
              <li><a href="#" class="link-dark rounded">게시글 작성</a></li>
            </ul>
          </div>
        </li>
        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
            data-bs-target="#qna-collapse" aria-expanded="true">
            qna 게시판 관리
          </button>
          <div class="collapse show" id="qna-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
              <li><a href="#" class="link-dark rounded">게시글 목록</a></li>
              <li><a href="#" class="link-dark rounded">게시글 작성</a></li>
              <li><a href="#" class="link-dark rounded">댓글 목록</a></li>
            </ul>
          </div>
        </li>
        <li class="border-top my-3"></li>
        <li class="mb-1">
          <button class="btn btn-toggle align-items-center rounded collapsed" data-bs-toggle="collapse"
            data-bs-target="#account-collapse" aria-expanded="false">
            Account
          </button>
          <div class="collapse" id="account-collapse">
            <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
              <li><a href="${contextPath}/admin/logout" class="link-dark rounded">Sign out</a></li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
    <div class="b-example-divider"></div>
    <div class="container py-5">
    </div>
  </main>

  <script src="../dist/js/admin_sidebars.js"></script>
</body>

</html>