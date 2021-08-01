<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>html문서 제목</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
   

<!-- 달력 ui -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
<style>
    /* 화면전체 */
    #main{
        margin-left: 90px;
        margin-right: 150px;
    }
    /* 캐러셀 */
    #carouselExampleControls{
        width: 100%;
        
        
    }
    /* 날짜 시간예약 div */
    #datebox{
        width: 350px;
        height: 700px;
        
        border: black 1px solid;
        align-items: center;
        padding-left: 25px;
    }
    /* 라벨 디자인 */
    #datebox input[type=checkbox]+label{
        border: 1px solid grey;
        width: 45px;
        height: 40px;
        text-align: center;
        margin-bottom: 0px;
     }
    .no-checkbox{
        border: 1px solid grey;
        width: 45px;
        height: 40px;
        text-align: center;
        background-color: grey;
        margin-bottom: 0px;
    }   
    

     #datebox input[type=checkbox]:checked+label {
        border: 1px solid grey;
        width: 45px;
        height: 40px;
        text-align: center;
        background-color: rgb(87, 103, 243);
        margin-bottom: 0px;
     }
    


    /* 체크박스 안보이기 */
    input[type=checkbox]{
         display: none;
    }
    /* 글내용 */
    #content{
        width: 100%;
        
    }
    #price{
        font-size: 20px;
        font-weight: bold;
        color: rgb(97, 143, 243);
    }
    #btnLike{
        float: right;
    }
    #list{
        float: right;
        margin-left: 15px;
    }
    
    #time{
    	width: 300px;
    }
</style>
 <jsp:include page="../common/header.jsp"></jsp:include>
</head>
<body>

    <div id="main">
        <!-- <div class="col-sm-1">
            One of three columns
          </div> -->

        <!--제목 한줄소개 해시태크  -->
        <br><br>
        <div class="row">
            <div>
                <h2>${place.placeName}</h2>
            </div>
            <div>
                <p>${place.placeSummary}</p>
            </div>
            <div class="col-sm-12" id="nav">
                <span class="badge bg-primary">해시태그</span>
                <span class="badge bg-primary">해시태그</span>
                <a href="#" class="btn btn-outline-secondary btn-lg"  id ="list">목록</a>
				<%-- <button type="button" class="btn btn-outline-secondary btn-lg" id="btnLike"><i class="bi bi-heart"></i> <span id="likeCount">${place.likeCount}</span></button> --%>
                <button type="button" class="btn btn-outline-secondary btn-lg" id="btnLike"><i class="bi bi-heart-fill text-danger"></i> <span id="likeCount">${place.likeCount}</span></button>
                
            </div>
        </div><br>

        <div class="row">
            
            
            <div class="col-sm-8">
                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-inner">
                      <div class="carousel-item active">
                        <img src="${place.atList[0].filePath }${place.atList[0].fileName }" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="${place.atList[1].filePath }${place.atList[0].fileName }" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">

                        <img src="${place.atList[2].filePath }${place.atList[0].fileName }" class="d-block w-100" alt="...">
                      </div>
                      <div class="carousel-item">
                        <img src="${place.atList[3].filePath }${place.atList[0].fileName }" class="d-block w-100" alt="...">
                      </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                      <span class="carousel-control-next-icon" aria-hidden="true"></span>
                      <span class="visually-hidden">Next</span>
                    </button>
                  </div>

                <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
  
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div><br>
                <!-- 글내용 -->
                <div id="content">${place.placeContent }</div>
                <hr>
                <p style="font-size: x-large;">찾아오시는 길</p>
                <p>${place.placeAddr}</p>
                <!-- 지도 -->
                <div id="map" style="width:100%;height:350px;"></div><br><br>
            </div>
            <div class="col-sm-1"></div>
            <div class="col-sm-3" style="padding-left: 15px;">
                <div id="datebox">
                    <br>

                    <!-- 달력 -->
                    <div type="text" name="date" id="date3" size="12"></div><br>
                    <!-- 시간선택 -->
                    
                    <div id="time">
                        <p style="font-size: x-large;">날짜를 선택해주세요</p>
                    </div>
                    <div id="price-zone">
                        <p>가격</p>
                        <p>${place.placeCharge}/시간 </p>
                        <p id="price">예약 시간을 선택해주세요</p>
                    </div>
                    <button class="btn btn-secondary" type="button">채팅문의</button>
                    <button class="btn btn-primary" type="submit">예약하기</button><br><br>

                </div>
            </div>
        </div>
    </div>
    <!-- 달력 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a523483cb174903a659b77049c5b0ee7&libraries=services"></script>
<script>
	const addr = '${place.placeAddr}'
	const name = '${place.placeName}'
	const price = '${place.placeCharge}'
	const priceInt = parseInt(price);
    $(function(){
        /* 날짜 선택 관련 스크립트 */
        $("#date3").datepicker({
            onSelect:function(dateText, inst) {
                $("#time").children().remove()
                
               
                const date = inst.selectedYear +'-'+(inst.selectedMonth+1)+'-'+inst.selectedDay;
                
                $.ajax({
                	url :"reservationCheck",
                	data : {"date" : date},
                	type : "post",
                	success : function(){},
                	error : function(){}
                });
                for(i=0; i<24; i++){
                    if(i==1){
                        let label = $("<label class='no-checkbox'>"+i+"</label>")
                        $("#time").append(label);

                    }else{
                        let inputPhone = $("<input>",{type : "checkbox",id:"check"+i, name : "checkbox", value : i,ONCLICK:"check_all();"})
                        let label = $("<label for = check"+i+">"+i+"</label>")
                        $("#time").append(inputPhone).append(label);

                    }
                }
            },
            minDate: '-0d'
        });
    });



 /** 
    * 동시에 여러개를 선택 혹은 해제 할 경우 사용. (단, 아래서 위로의 선택 혹은 해제는 안되고 각 체크 박스의 값은 유일한 값이어야 한다.)
    * 같은 이름의 체크 박스 객체 배열에서 사용..
    * <input type="checkbox" name="체크박스명" onClick="javascript: check_shift();">
    * created by anthunt01@edmsoft.com 2005/08/31
    **/
   var count = 0;
   var oldCheckValue = "";    // 기존 클릭한 체크 박스의 값을 저장하기 위한 변수 : 시작점을 구분하기 위함
   
   function check_all() {
       
       var obj = window.event.srcElement;                    // 클릭한 체크 박스 객체
       var oObject = document.getElementsByName(obj.name); // 동일한 이름을 가진 체크 박스 객체 배열
       var vCheck = (obj.checked == true) ? true : false;  // 선택 혹은 해제 여부
       var vBreak = false;                                    // 선택 혹은 해제를 시작/종료 여부
       var input = document.querySelectorAll("input");
        count++
         //  3번째 카운트일때 모든 선택값 취소하고 3번째 선택값을 체크 카운트횟수는 1로 변경 check_shift()
         if(count >=3) {
               $("input").prop('checked', false); 
               oldCheckValue = "";
               vCheck = false;
               vBreak = false;
               count = 1;
               event.target.checked = true;
               // console.log(count)
               oldCheckValue = event.target.value;
           }
        if(oldCheckValue != "") {
            // 체크 박스 객체 갯수만큼 루프
            for(var i = 0; i < oObject.length; i++) {
                // 기존 클릭한 체크 박스값이 존재하는가를 확인하여
                // 값이 없으면 처음부터 적용하고 그렇지 않으면 기존
                // 클릭한 체크 박스 부터 지금 클릭한 체크 박스 까지 선택 혹은 해제를 적용한다.
                if(oldCheckValue == "") {
                    if(oObject[i].value == obj.value) break;    // 지금 클릭한 체크 박스의 값과 루프의 체크 박스의 값이 같으면 루프를 빠져나간다.
                    else oObject[i].checked = vCheck;            // 값이 다르면 선택/해제를 적용한다.
                }else {
                    // 기존 체크 박스의 값과 같으면 선택/해제 여부를 결정하고
                    // 적용을 시작한다.
                    if(oObject[i].value == oldCheckValue) {
                        vCheck = (oObject[i].checked == true) ? true : false;
                        vBreak = true;
                    }
                    if(vBreak) {
                        oObject[i].checked = vCheck; 
                    }   // 적용이 종료 되지 않았으면 적용한다.
                    if(oObject[i].value == obj.value) {
                        break;    // 지금 클릭한 체크 박스의 값과 같으면 적용을 종료 한다.
                    }
                 }
            }
            
            
            $("#price-zone").children().remove()
            var price = $("<p> 가격</p>");
            var hourlyPrice = $("<p>"+priceInt.toLocaleString()+"원/시간</p>");
            var sumPrice = $("<p id = 'price'>"+ (priceInt*$("input:checkbox[name='checkbox']:checked").length).toLocaleString()+"원</p>");
            $("#price-zone").append(price).append(hourlyPrice).append(sumPrice);
        }else {
            oldCheckValue = obj.value;    // 체크된 값이 없으면 처음 체크된 값을 oldCheckValue 담아준해준다.
        }
        
    }
	

    // 지도스크립트

    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  

    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 

    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();

    // 주소로 좌표를 검색합니다
    geocoder.addressSearch(addr, function(result, status) {

        // 정상적으로 검색이 완료됐으면 
        if (status === kakao.maps.services.Status.OK) {

            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });

            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+name+'</div>'
            });
            infowindow.open(map, marker);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
    }); 

</script>
     
</body>
</html>