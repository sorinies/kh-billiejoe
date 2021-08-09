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
  
    <!-- 아임포트 -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <style>
        img{
            width: 350px;
            height: 300px;
        }
        span{
            display: inline-block;
        }
        button{
            width: 200px;
        }
        #payment{
            margin-left: 50px;
        }
        #title{
            font-size: x-large;
        }
        #pay{
            font-size: large;
        }
        #Price{
            font-size: xx-large;
        }
        #content{
            margin-left: 15px;
        }
    </style>
</head>

<body>
  <div class="container">
  <jsp:include page="../common/header.jsp"></jsp:include><br>
  
        <h2>예약하기</h2><br>
        <span>
            <img src="${place.atList[0].filePath}${place.atList[0].fileName}" alt="" >
        </span>
        <span id="content">
            <p id="title">${place.placeName }</p>
            <p>${place.placeSummary }</p>
            <c:set var="tagList" value="${place.tagList}"></c:set>
            <c:forEach items="${tagList}" var="tag"  >
                <span class="badge bg-primary">${tag.tagName}</span>
            </c:forEach> 
            <br><br><p id="pay">${place.placeCharge}원/시간</p>
        </span>
        <form action="payComplete" method="POST" id="sub">
	        <hr>
	        <h4>예약정보</h4><br>
	        <p>예약날짜 : ${reservation.useDate }</p>
	        <p>예약 시간 : ${reservation.useStart}시 ~ ${reservation.useEnd}시</p>
	        <p>결제 금액 :</p>
	        <p id="Price">${sumPrice }원</p><br>
	        <button type="button" class="btn btn-secondary">취소하기</button>
	        <button type="button" class="btn btn-primary" id="payment" onclick="iamport();">결제하기</button>
        	<input type="hidden" name="useDate" value="${reservation.useDate}">
        	<input type="hidden" name="useStart" value="${reservation.useStart}">
        	<input type="hidden" name="useEnd" value="${reservation.useEnd}">
        	<input type="hidden" name="payAmount" value="${sumPrice}">
        	<input type="hidden" name="merchantUid"  id="merchantUid">
        	
        </form>
    </div>
    
    <script >
    	var placeName = '${place.placeName}'
    	var price = '${sumPrice}'
		var name = '${loginMember.memberName}'
		var phone = '${loginMember.memberPhone}'
		var emaile = '${loginMember.memberEmail}'
    function iamport(){
		
		//가맹점 식별코드
		IMP.init('imp04401960');
		IMP.request_pay({
		    pg : 'kakaopay',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : placeName , //결제창에서 보여질 이름
		    amount : price, //실제 결제되는 가격
		    buyer_email : emaile,
		    buyer_name : name,
		    buyer_tel : phone,
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	$("#merchantUid").val(rsp.merchant_uid);
		    	$("#sub").submit();
		    	
		    	/* var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num; */
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		   	 alert(msg); 
		});
	}
    
    </script>
    <br><br><jsp:include page="../common/footer.jsp"></jsp:include>
</body>


</html>