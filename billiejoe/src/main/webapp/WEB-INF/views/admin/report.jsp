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
  <style type="text/css">
  	button {
		height: 35px;	
	}
  </style>
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
      <h2>신고 목록</h2>
        <table class="table table-striped table-hover w-100">
          <thead>
            <tr>
              
              <th scope="col">글번호</th>
              <th scope="col">신고사유</th>
              <th scope="col">리뷰 내용</th>
              <th scope="col">신고자</th>
              <th scope="col">신고날짜</th>
              <th scope="col">처리현황</th>
            </tr>
          </thead>
          <tbody>
          
          <c:forEach items="${reportList }" var="report">
          
            <tr>
              <td>${report.reviewNo }</td>
              <td>${report.reportContent }</td>
              <td>${report.reviewContent }</td>
              <td>${report.memberName }</td>
              <td><fmt:formatDate value="${ report.reportDate }" pattern="yyyy.MM.dd"/>  </td>
              <td>
              <c:if test="${report.reviewStatus eq 'N' }">
               <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary " >
                  완료
                </button>
              
              </c:if>
              <c:if test="${report.reviewStatus eq 'Y' }">
                <button type="button" class="btn btn-danger del-btn" data-bs-toggle="modal" data-bs-target="#exampleModal">
                  <input type="hidden" class="report-no" value="${report.reviewNo }">
                  삭제
                </button>
              </c:if>
              </td>
              <td>
              </td>
            </tr>

          </c:forEach>
           
          </tbody>
        </table>
        
       <c:set var="prev" value="report?cp=${pagination.prevPage}" />
	  <c:set var="next" value="report?cp=${pagination.nextPage}" />
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
									<li><a class="page-link" href="${pageURL}?cp=${p}">${p}</a></li>
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
     <!-- Modal -->
     <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content" >
          <div class="modal-header">
            <p >정말 삭제 하시겠습니까?</p>
          </div>
          <form action="reportCheck" method="POST">
              <div class="modal-footer">
                  <button type="submit" class="btn btn-primary modal-btn">네</button>
                  <button type="button" class="btn btn-primary modal-btn" data-bs-dismiss="modal">아니오</button>
                <input type="hidden" name="reviewNo" id="modal-report-no">
              </div>
          </form>
        </div>
      </div>
    </div>
  
  

  <script src="../dist/js/admin_sidebars.js"></script>
  <script>
    $(document).ready(function(){
        $(".del-btn").on("click",function(){
            console.log($(event.target))
            var number = $(event.target).children().val();
            var number2 = $(event.target).children().last().val();
            $("#modal-report-no").val(number);
        })
    })
</script>
</body>

</html>