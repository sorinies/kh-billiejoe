<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" scope="application"
	value="${pageContext.servletContext.contextPath}" />

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>billieJoe</title>
	  <!-- Google Webfonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@400;700&display=swap" rel="stylesheet">
    
    
    <!-- Default Style -->
  	<link href="${contextPath}/resources/css/style.css" rel="stylesheet">
  	<link href="${contextPath}/resources/css/reviewStyle.css" rel="stylesheet">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
   
</head>

<body>
  <!-- 본문 시작 -->
  <div class="container py-5">
    <div class="row ">
      <div>
        <h4>총 후기 : ${add.reviewCount}개</h4>
      </div>
      <span>
        <h4>평점 : 
		              <c:choose>
			              <c:when test="${add.reviewAvg==1}">
				              <i id="red">★</i>
				              <i>★</i>
				              <i>★</i>
				              <i>★</i>
				              <i>★</i>
			              </c:when>
			              <c:when test="${add.reviewAvg==2}">
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i>★</i>
				              <i>★</i>
				              <i>★</i>
			              </c:when>
			              <c:when test="${add.reviewAvg==3}">
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i>★</i>
				              <i>★</i>
			              </c:when>
			              <c:when test="${add.reviewAvg==4}">
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i>★</i>
			              </c:when>
			              <c:otherwise>
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i id="red">★</i>
				              <i id="red">★</i>
			              </c:otherwise>
		              </c:choose>
                      <i>&nbsp;&nbsp;${add.reviewAvg}점</i></h4>
      </span>
      
    </div>
    
    <hr>
	<c:choose>
	
		<c:when test="${empty reviewListPlace}">
			<div>후기글이 존재하지 않습니다.</div>
		</c:when>
      
		<c:otherwise>				
			<c:forEach items="${reviewListPlace}" var="review">
	
		    <div class="row viewWrapper">
		       
		    	<div class="col-3 profile content text-center">
		        	<img src="${contextPath}/${review.memberPic}">
		    	</div>
		
			<div class="col content">
			
		        
		        <%-- 작성일 --%>
				<div class="reviewDate">
					작성일 : &nbsp;
					<fmt:formatDate var="reviewDate" value="${review.reviewDate}"  pattern="yyyy-MM-dd"/>                          
					<fmt:formatDate var="today" value="<%= new java.util.Date() %>"  pattern="yyyy-MM-dd"/>                          
				
					<c:choose>
		
		                <%-- 글 작성일이 오늘이 아닐 경우 --%>
		                <c:when test="${reviewDate != today}">
		                	${reviewDate}
		                </c:when>
		                
		                <%-- 글 작성일이 오늘일 경우 --%>
		                <c:otherwise>
		                    <fmt:formatDate value="${review.reviewDate}"  pattern="HH:mm"/>                          
		                </c:otherwise>
		                
			        </c:choose>
			     </div>
			
		        <div class="memName">
		          <h3>${review.memberName}</h3>
		        </div>
		
		          <div class="rate">
		              <p class="star">
		              <c:choose>
			              <c:when test="${review.reviewRate==1}">
				              <i id="gold">★</i>
				              <i>★</i>
				              <i>★</i>
				              <i>★</i>
				              <i>★</i>
			              </c:when>
			              <c:when test="${review.reviewRate==2}">
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i>★</i>
				              <i>★</i>
				              <i>★</i>
			              </c:when>
			              <c:when test="${review.reviewRate==3}">
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i>★</i>
				              <i>★</i>
			              </c:when>
			              <c:when test="${review.reviewRate==4}">
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i>★</i>
			              </c:when>
			              <c:otherwise>
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i id="gold">★</i>
				              <i id="gold">★</i>
			              </c:otherwise>
		              </c:choose>
		              <i>&nbsp;&nbsp;${review.reviewRate}점</i>
		          </div>
		          
		          <hr>
		            
			          <div class="placeContent">
						${review.reviewContent}
			          </div>
			          <form method="POST" action="#modal-container-1">
						  <div align="right" >
						  	<a class="btn btn-primary"  data-toggle="modal" href="#modal-container-1" onclick="fnReviewNo(${review.reviewNo});">신고</a>
						  </div>
					  </form>
		      </div>
	      </div>
	      
			    <hr>
			    
			</c:forEach>
		</c:otherwise>				
	</c:choose>	
</div>	  
<%---------------------- Pagination start----------------------%>
            <%-- 페이징 처리 시 주소를 쉽게 작성할 수 있도록 필요한 변수를 미리 선언 --%>
            
            <c:set var="pageURL" value="view"  />
            
            <c:set var="prev" value="${pageURL}?cp=${pagination.prevPage}" />
            <c:set var="next" value="${pageURL}?cp=${pagination.nextPage}" />
            
            
            <div class="my-5">
                
                <ul class="pagination">
            
                    <%-- 현재 페이지가 10페이지 초과인 경우 --%>
                    <c:if test="${pagination.currentPage > pagination.pageSize }">
                    	<li><a class="page-link" href="${prev}">&lt;&lt;</a></li>
                    </c:if>
                    
                    <%-- 현재 페이지가 2페이지 초과인 경우 --%>
                    <c:if test="${pagination.currentPage > 2 }">
                    	<li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage - 1}">&lt;</a></li>
                    </c:if>
                        
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
                    
                    <%-- 현재 페이지가 마지막 페이지 미만인 경우 --%>
                    <c:if test="${pagination.currentPage < pagination.maxPage }">
                    <li><a class="page-link" href="${pageURL}?cp=${pagination.currentPage + 1}">&gt;</a></li>
                    </c:if>
                    
                    <%-- 현재 페이지가 마지막 페이지가 아닌 경우 --%>
                    <c:if test="${pagination.currentPage - pagination.maxPage + pagination.pageSize < 0}">
                    <li><a class="page-link" href="${next}">&gt;&gt;</a></li>
                    </c:if>

                </ul>
            </div>
            <%---------------------- Pagination end----------------------%>
        	<%---------------------- 신고하기 모달----------------------%>
				<div class="modal" id="modal-container-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			        <div class="modal-dialog" role="document">
			
			            <div class="modal-content">
			                <div class="modal-body">
			                    <form class="report" method="POST" action="report">
			                       	신고 사유
			                        <div class="curse">
			                        	<input class="form-control curse" maxlength="30" type="text" id="reportContent" name="reportContent" placeholder="30자내로 내용을 입력하세요.(ex. 욕설, 허위)">
							          	<input type="hidden" name="reviewNo" id="reviewNo" >
			                        </div>        
			                        <button class="btn btn-lg btn-primary btn-block" type="submit" id=curse >신고하기</button>
			                    </form>
			                </div>
			                <div class="modal-footer">
			                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
			                </div>
			            </div>
			        </div>
			    </div>

			    <script>
					function fnReviewNo(rid){
						$('#reviewNo').val(rid)
						console.log(rid);
					}
			    </script>
			    
			    
</body>

</html>
<!-- //footer -->