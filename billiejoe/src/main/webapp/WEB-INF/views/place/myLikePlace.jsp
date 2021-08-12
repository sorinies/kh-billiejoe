<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../common/header.jsp"></jsp:include>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>MyLikePlace</title>
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

        .flex-shrink-0 {

            display: inline-block;
            float: left;

        }

        #profileImg-area>div>p {
            margin-top: 50px;
        }

        #memberPic {
            width: 150px;
            height: 150px;
        }

      

        .listForm {
            border: 1px solid black;
            border-radius: 30px;
            width: 750px;
            float: left;
            margin-bottom: 20px;

        }

        .listForm-area1 {
            margin-top: 10px;
            margin-bottom: 10px;
            margin-left: 10px;
            margin-right: 10px;
            float: left;
        }

        .listForm-area2 {
            float: left;


        }

        .listForm-area3 {
            float: left;


        }

        #Page-navigation {
            clear: left;
            margin-right: 200px;

        }

        .justify-content-center {
            margin-top: 500px;
        }

        .listForm-area2>h5 {
            float: left;
            margin-top: 15px;
        }

        .listForm-area2>p {
            float: left;
            margin-top: 15px;

        }

        .listForm-area2>h6 {
            /* float: left; */
            display: block;
            width: 70%;
            float: left;
            /*     text-align: right; */


        }

        .listForm-area2>h4 {

            /*  float: right;
        margin-left: -135px; */
            display: block;
            width: 30%;
            float: left;

        }

        .listForm-area3>a {
            text-decoration: underline;
            color: blue;
            text-align: right;
            display: block;
        }

        .listForm-area3>h5 {
            float: right;
            margin-right: -230px;
            color: blue;
            margin-top: -25px;
        }


        #userDetail {
            margin-top: 40px;
            margin-left: 200px;
        }

        #updateDetail {
            float: left;
            margin-top: -100px;
            margin-left: 550px;
        }

        #leftPlace{
            float: left;
        }

        #rightPlace{
            margin-left: 300px;
        }

        #moreReservPlace{
              margin-left: 630px;
			  margin-top: -30px;
			  margin-bottom: 15px;
			  display: flex;
			  width: 75px;
        }
        
          #reservPlace{
            border: 1px solid black;
            width: 750px;
            margin-bottom: 20px;
        }
        
        .containerH{
        margin-left: 300px;
        }
        
        .place{
        	width : 750px;
        }
    </style>
</head>

<body>


    <main style="min-height:500px">
        <div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
            <a href="#" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
                <span class="fs-5 fw-semibold">마이페이지</span>
            </a>
            <ul class="list-unstyled ">
                <li class="mb-1"><a href="${contextPath}/member/myPage">내 정보 </a><br> 
                <a href="${contextPath}/member/updateMyPage">내 정보 수정</a><br> 
                <a href="${contextPath}/member/changePwd">비밀번호 변경 </a></li>
                <hr>
                <li class="mb-1"><a href="${contextPath}/place/myReservation">내가 예약한 장소 </a><br> 
                <a href="#"><b>내가 찜한 장소</b></a><br>
                 <a href="#">내가 작성한 후기</a>
                </li>
                <hr>
                <li class="mb-1"><a href="#">내가 등록한 장소</a><br>
                 <a href="#">예약 접수 내역</a><br></li>
                <hr>


            </ul>
        </div>
        <div class="containerH py-5">
            

		 <c:forEach items="${myLikePlaceList}" var="likePlace">
                <div class="card mb-3 place">
                    <div class="row g-0">
                      <div class="place-thumb col-md-4" style="background-image:url(${likePlace.atList[0].filePath }${likePlace.atList[0].fileName })"></div>
                      <div class="col-md-8">
                        <div class="card-body">
                          <h3 class="card-title"><a href="#" class="stretched-link">${likePlace.placeName}</a></h3>
                          <p class="card-text">${likePlace.placeSummary}</p>
                          <ul class="place-tag list-inline">
                          	 <c:forEach items="${tagList}" var="tag"  >
	                            <li class="list-inline-item"><a class="badge rounded-pill bg-secondary" href="#"><i class="bi bi-hash"></i>${tag.tagName}</a></li>
			            	</c:forEach> 
                          </ul>
                        </div>
                        <div class="card-footer">
                          <ul class="list-inline place-info">
                            <li class="list-inline-item"><fmt:formatNumber value="${likePlace.placeCharge }" pattern="#,###" />원<small>/시간</small></li>
                            <li class="list-inline-item"><i class="bi bi-chat-square-text"></i> ${likePlace.reviewCount}</li>
                            <li class="list-inline-item"><i class="bi bi-heart-fill"></i> ${likePlace.likeCount }</li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                        <br>
                  </c:forEach>
                

            
        </div>

    </main>
    <jsp:include page="../common/footer.jsp"></jsp:include>
</body>

</html>