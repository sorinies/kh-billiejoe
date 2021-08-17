<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
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

  <style>
    a {
      text-decoration: none;
      color: black;
    }
    
    .reviewA{
	    color : blue;
	    text-decoration-line: underline;
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

    #placeImg{
      display: none;
    }

  

    #placeImg-area > img{
      width: 150px;
      height: 150px;
      border-radius:10%;
      display: inline-block;
      border: 1px solid black;
      margin: auto;
      background-size: 120%;
      background-position: center;
      background-repeat: no-repeat;

    }

  
   
    #placeImg-area > div > p{
      margin-top: 50px;
    }

    .listForm{
      border: 1px solid black;
      border-radius:30px;
      width: 750px;
      float: left;
      margin-bottom: 20px;
        
    }

    .listForm-area1{
        margin-top: 10px;
        margin-bottom: 10px;
        margin-left : 10px;
        margin-right: 10px;
        float: left;
    }

    .listForm-area2{
        float: left;

        
    }
    .listForm-area3{
        float: left;


    }

    #Page-navigation{
        clear:left;
       margin-right: 200px;
      
    }

    .justify-content-center{
        margin-top: 500px;
    }

    .listForm-area2 > h5{
        float: left;
        margin-top: 15px;
    }

    .listForm-area2 > p{
        float: left;
        margin-top: 15px;

    }

    .listForm-area2 > h6{
        /* float: left; */
        display: block;
        width: 70%;
        float: left;
    /*     text-align: right; */
        

    }
    .listForm-area2 > h4{
     
       /*  float: right;
        margin-left: -135px; */
        display: block;
        width: 30%;
        float: left;
      
    }

    .listForm-area3 > a{
        text-decoration: underline;
        color: blue;
        text-align: right;
        display: block;
    }

    .listForm-area3 > h5{
        float: right;
        margin-right: -230px;
        color: blue;
        margin-top: -25px;
    }
    
    .flex-shrink-0{

		display : inline-block;
		float :left;
	
	}
    
	 .containerH{
        margin-left: 100px;
        width : 600px;
        }
        
	#navigation{
	display : inline-block;
	margin-top : 0;
	margin-left : 300px;
	}
	
	.pagination{
	margin-top : 0;
	}
 
 	main{
 		max-height: none;
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
					<a href="${contextPath}/member/myPage">내 정보 </a><br> 
					<a href="${contextPath}/member/updateMyPage">내 정보 수정</a><br> 
					<a href="${contextPath}/member/changePwd">비밀번호 변경</a></li>
				<hr>
				<li class="mb-1"><a href="#"><b>내가 예약한 장소 </b></a><br> 
					<a href="${contextPath}/place/myLikePlace">내가 찜한 장소</a><br>
					<a href="#">내가 작성한 후기</a></li>
				<hr>
				<li class="mb-1">
					<a href="#">내가 등록한 장소</a><br> 
					<a href="#">예약 접수 내역</a><br></li>
				<hr>


			</ul>
    </div>
    <div class="containerH py-5">
        <div class="input-group  mb-3 w-25">
         
         
            <select class="form-select" id="searchUserCond" name="searchUserCond">
              <option value="uploadDate" <c:if test="${param.sort == 'uploadDate' }">selected</c:if>  >등록일 최신순</option>
              <option value="reservatioinDate" <c:if test="${param.sort == 'reservatioinDate' }">selected</c:if> >예약일시 최근순</option>
              <option value="useDate" <c:if test="${param.sort == 'useDate' }">selected</c:if> >이용일시 임박순</option>
            </select>
        </div>
        
        <c:forEach items="${reservationList}" var="myReserv">
        <a href="${myReserv.placeNo}/reservationView?reserveNo=${myReserv.reserveNo }">
	        <div class="listForm">
	            <div class="listForm-area1"> 
	                <div  id="placeImg-area">
	                    
	                    <img src="${myReserv.atList[0].filePath }${myReserv.atList[0].fileName }" id="placeImg" name="placeImg">
	                    
	                </div>
	
	            </div>
	            <div class="listForm-area2">
	                <%-- <h5><fmt:formatDate pattern= "MM월 dd일" value="${myReserv.reserveDate}"/>&ensp;</h5> --%>
	                <h5>${myReserv.useDate}&nbsp;</h5>
	                (<fmt:formatDate pattern= "MM월 dd일" value="${myReserv.reserveDate}"/>)
	                <p>(<fmt:formatDate value="${myReserv.reserveDate}" pattern="E"/>요일) ${myReserv.useStart}:00 ~ ${myReserv.useEnd }:00</p>
	                <h6>${myReserv.placeName}</h6> 
	                <h4>\<fmt:formatNumber value="${myReserv.placeCharge }" pattern="#,###" /></h4>
	            </div>
	            </a>
	            <hr>
	            <div class="listForm-area3">
	                <p>${myReserv.placeAddr}</p>
	                
	                <c:if test="${myReserv.stateNo == 3 }">
	                <div class="text-end"> <a href="${contextPath}/review/insertReview" class="reviewA">이용후기 작성하러 가기</a> </div>
	                </c:if>
	                
	                <h5>${myReserv.stateName }</h5>
	            </div>
	
	        </div>
        
        
        </c:forEach>

      
          <c:if test="${!empty param.sort }">
     		 <c:set var="sort" value="&sort==${param.sort}"  />
		  </c:if>
	    	  <c:set var="prev" value="myReservation?cp=${pagination.prevPage}${sort }" />
			  <c:set var="next" value="myReservation?cp=${pagination.nextPage}${sort }" />
		  
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
									<li><a class="page-link" href="${pageURL}?cp=${p}${sort}">${p}</a></li>
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


  <jsp:include page="../common/footer.jsp"></jsp:include>
   
   
	<script>
		$("#searchUserCond").on("change", function(){
			const sort = $("#searchUserCond").val();
			
			location.href = "myReservation?cp=1&sort=" + sort;
			
		});
	</script>
   
</body>

</html>