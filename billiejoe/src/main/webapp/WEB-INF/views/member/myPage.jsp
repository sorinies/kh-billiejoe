<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="myPage" value="active"/>
<jsp:include page="../common/header.jsp"></jsp:include>
    <style>
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
        
        .place{
        	width : 750px;
        }
    </style>

<!-- 본문 시작 -->
  <div class="container py-5">
    <div class="content-header row">
      <h2 class="col">내 정보</h2>
    </div>
    <div class="row">
    
        <jsp:include page="../common/mypageSidebar.jsp"></jsp:include>

        <div class="col-md-9">
            


                <div class="listForm">

                    <div class="listForm-area1">
                        <div class="col-md-6" id="profileImg-area">
                            <div id="picture">
                                <img class="img-thumbnail rounded-circle" id="memberPic"
                                    src="${contextPath}/${loginMember.memberPic}">
                            </div>
                        </div>

                        <input type="file" id="profileImg" name="profileImg" onchange="LoadImg(this,0)">
                    </div>

                    <div id="userDetail">
                        <h4>${loginMember.memberName}</h4>
                        <h5>${loginMember.memberEmail}</h5>
                    </div>
                        <a href="${contextPath}/member/updateMyPage" id="updateDetail" class="btn btn-primary">내 정보 수정하기</a>
                    <div class="col-md-6 offset-md-3">
                        <span>&nbsp;</span>
                    </div>
                </div>

                <hr>
                <h4>이용 예정인 공간</h4>

                <div class="card mb-3 place">
                    <div class="row g-0">
                      <div class="place-thumb col-md-4" style="background-image:url(${latestPlace.atList[0].filePath }${latestPlace.atList[0].fileName })"></div>
                      <div class="col-md-8">
                        <div class="card-body">
                          <h3 class="card-title"><a href="#" class="stretched-link">${latestPlace.placeName}</a></h3>
                          <p class="card-text">${latestPlace.placeSummary}</p>
                          <ul class="place-tag list-inline">
                          	 <c:forEach items="${tagList}" var="tag"  >
	                            <li class="list-inline-item"><a class="badge rounded-pill bg-secondary" href="#"><i class="bi bi-hash"></i>${tag.tagName}</a></li>
			            	</c:forEach> 
                          </ul>
                        </div>
                        <div class="card-footer">
                          <ul class="list-inline place-info">
                            <li class="list-inline-item"><fmt:formatNumber value="${latestPlace.placeCharge }" pattern="#,###" />원<small>/시간</small></li>
                            <li class="list-inline-item"><i class="bi bi-chat-square-text"></i> ${latestPlace.reviewCount}</li>
                            <li class="list-inline-item"><i class="bi bi-heart-fill"></i> ${latestPlace.likeCount }</li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <hr id="reserPlaceHr">
                  <h4 id="reserPlaceT">내 장소에 접수된 예약</h4>
                  <a href="#" id="moreReservPlace"  class="btn btn-primary">더보기</a>
				 <c:forEach items="${reservedPlace}" var="reservedPlace">
                  <div id="reservPlace">
                    <div id="leftPlace">
                        <div>장소 <b>${reservedPlace.placeName} </b></div>
                        <div>상태 <b>${reservedPlace.stateName} </b></div>
                        <div>예약자명 <b>${reservedPlace.memberName} </b></div>

                    </div>
                    
                    <div id="rightPlace">
                        <div>이용일시  <b>${reservedPlace.useDate} </b></div>
                        <div>결제금액  <b>${reservedPlace.placeCharge} </b></div>
                        <div>번호<b> ${reservedPlace.memberPhone} </b></div>
                    </div>

                  </div>
                  <br>
                  </c:forEach>


            
        </div>
        </div>
        </div>

    <jsp:include page="../common/footer.jsp"></jsp:include>
