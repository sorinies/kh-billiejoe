<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>채팅방</title>
</head>
<body>
<jsp:include page="../common/header.jsp"></jsp:include>
	<div class="chatting-area">
        <div id="chat-header" class="row">
            <div class="col-sm-6" id="header-left">
                <a href="list"><i class="bi bi-arrow-left"></i></a>
                <img src="${member.memberPic }" alt="" id ="prople"style="border-radius: 50%;">
                <strong id="name" >${member.memberName }</strong>
            </div>
            <div class="col-sm-6" id="chat-content">
                <table >
                    <tr>
                        <td rowspan="2">
                            <img src="${chatPlace.atList[0].filePath }${chatPlace.atList[0].fileName}" alt="">
                        </td>
                        <td class="td">${chatPlace.placeName }</td>
                    </tr>
                    <tr>
                        <td class="td"><strong><fmt:formatNumber value="${chatPlace.placeCharge }" pattern="#,###" />원/시간</strong></td>
                    </tr>
                </table>

            </div>
        </div>
		<ul class="display-chatting">
            
			<c:forEach items="${list}" var="msg">
				<fmt:formatDate var="chatDate" value="${msg.chatMsgDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
				<c:if test="${msg.memberNo == loginMember.memberNo }">
					<li class="myChat">
						<span class="chatDate">${chatDate}</span>
						<p class="chat">${msg.chatMsgContent }</p>
					</li>
				</c:if>
				
				<c:if test="${msg.memberNo != loginMember.memberNo }">
					<li>
						<b>${msg.memberName }</b>	<br>
						<p class="chat">${msg.chatMsgContent }</p>
						<span class="chatDate">${chatDate}</span>
					</li>
				</c:if>
			</c:forEach>
		</ul>	
	</div>
	<div class="input-area">
		<textarea id="inputChatting" rows="3"></textarea>
		<button id="send" class=""><i class="bi bi-cursor"></i></button>
	</div><br><br>
	<jsp:include page="../common/footer.jsp"></jsp:include>
	<jsp:include page="../../../resources/js/chatViewJs.jsp"></jsp:include> 
	
     
</body>
</html>