<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
      margin-left: 20%;
      width: 25%;
    }

    .shadow-sm {
    box-shadow: none;
    }

    .b-example-divider{
        width: 1px;
    }

    th{
        text-align: center;
        border: 1px solid black;
    }

    td{
        text-align: center;
    }

  
    
  </style>
</head>

<body>
  <main>
    <div class="flex-shrink-0 p-3 bg-white" style="width: 200px;">
       
        <ul class="list-unstyled ">
            <br>
            <br>
            <br>
            <br>
          <li class="mb-1">
            <a href="#">회원관리</a><br><br>
            <a href="#">게시물 관리</a><br><br>
            <a href="#">후기관리</a><br><br>
            <a href="#">신고내역</a><br><br>
          </li>
  
  
        </ul>
      </div>
      <div class="b-example-divider"></div>
    <div class="container py-5">
      <form>
        <table class="table table-striped table-hover w-100">
          <thead>
            <tr>
              <th scope="col">글번호</th>
              <th scope="col">장소명</th>
              <th scope="col">가격</th>
              <th scope="col">작성자</th>
              <th scope="col">게시물 삭제</th>
            </tr>
          </thead>
          <tbody>
            <tr>
             <c:forEach items="${boardList}" var="list">
              <td>${list.placeNo}</td>
              <td><a href="#">${list.placeName}</a></td>
              <td>${list.placeCharge}</td>
              <td>0000년 00월 00일 00:00</td>
              <td>
                <a href="#" class="btn btn-primary btn-sm">수정</a>
              </td>
            </tr>
             </c:forEach>
          </tbody>
        </table>
      </form>
<c:if test="${list.status eq Y }">
	<a class="btn"  href ="fasdf/sadf${placeNo }/"></a>
</c:if>
<c:if test="${list.status eq Y }">
	<a class="btn"  href ="fasdf/sadf?placeNo=${placeNo }&status=${status }/"></a>
</c:if>
      
          <c:if test="${!empty param.sk }">
     		 <c:set var="searchStr" value="&sk=${param.sk}&sv=${param.sv}"  />
		  </c:if>
	    	  <c:set var="prev" value="main?cp=${pagination.prevPage}${searchStr }" />
			  <c:set var="next" value="main?cp=${pagination.nextPage}${searchStr }" />
		  
	  
      <!-- 페이징 -->
      <nav aria-label="Page navigation" id="navigation">
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

</body>

</html>