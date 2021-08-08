<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>billieJoe admin</title>
  <!-- 제이쿼리 -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
              <li><a href="#" class="link-dark rounded">Sign out</a></li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
    <div class="b-example-divider"></div>
    <div class="container py-5">
      <h2>회원관리</h2>
      <form method="get" action="unRegMember">
        <div class="input-group mb-3 w-50">
          <select name="sk" class="form-select" id="searchUserCond" >
            <option value="name">이름</option>
            <option value="id">아이디</option>
          </select>
          <input type="text" class="form-control" name="sv" placeholder="이름 혹은 아이디로 검색하세요">
          <button class="btn btn-outline-secondary" type="submit" id="searchUser" >검색</button>
        </div>
        <table class="table table-striped table-hover w-100">
          <thead>
            <tr>
              
              <th scope="col">회원번호</th>
              <th scope="col">이름</th>
              <th scope="col">아이디</th>
              <th scope="col">연락처</th>
              <th scope="col">가입일자</th>
              <th scope="col">탈퇴일자</th>
            </tr>
          </thead>
          <tbody>
          <c:forEach items="${memberList }" var="member">
          
            <tr>
              <td>${member.memberNo }</td>
              <td>${member.memberName }</td>
              <td>${member.memberEmail }</td>
              <td>${member.memberPhone }</td>
              <fmt:formatDate var="regDate" value="${member.regDate}" pattern="yyyy.MM.dd"/>
              <td>${regDate }</td>
              <fmt:formatDate var="unRegDate" value="${member.unRegDate}" pattern="yyyy.MM.dd"/>
              <td>${unRegDate}</td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </form>
      
	  <c:if test="${!empty param.sk }">
     	 <c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}"  />
	  </c:if>
      <c:set var="prev" value="unRegMember?cp=${pagination.prevPage}${searchStr }" />
	  <c:set var="next" value="unRegMember?cp=${pagination.nextPage}${searchStr }" />
	  
	  
      <!-- 페이징 -->
      <nav aria-label="Page navigation">
        <ul class="pagination justify-content-center">
          <li class="page-item">
            <a class="page-link" href="${prev}" aria-label="Previous">
              <span aria-hidden="true">&laquo;</span>
            </a>
          </li>
          <%-- 페이지 목록 --%>
					<c:forEach var="p" begin="${pagination.startPage}" end="${pagination.endPage}">
						
							<c:choose>
								<c:when test="${p == pagination.currentPage }">
									<li class="page-item active"><a class="page-link">${p}</a></li>
								</c:when>
								
								<c:otherwise>
									<li><a class="page-link" href="${pageURL}?cp=${p}${searchStr}">${p}</a></li>
								</c:otherwise>
							</c:choose>						
					</c:forEach>
          <li class="page-item">
            <a class="page-link" href="${next }" aria-label="Next">
              <span aria-hidden="true">&raquo;</span>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </main>
    
  

  <script src="../dist/js/admin_sidebars.js"></script>
  <script>
    $(document).ready(function(){
        var searchKey = "${param.sk}"; 
		// 파라미터 중 sk가 있을 경우   ex)  "abc"
		// 파라미터 중 sk가 없을 경우   ex)  ""
		var searchValue = "${param.sv}";
		
		// 검색창 select의 option을 반복 접근
		$("select[name=sk] > option").each(function(index, item){
			// index : 현재 접근중인 요소의 인덱스
			// item : 현재 접근중인 요소
						// content            content
			if( $(item).val() == searchKey  ){
				$(item).prop("selected", true);
			}
		});		
		
		// 검색어 입력창에 searcValue 값 출력
		$("input[name=sv]").val(searchValue);
    })
</script>
</body>

</html>