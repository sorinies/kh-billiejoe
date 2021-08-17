<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="common/header.jsp"></jsp:include>
  <div class="container py-5">
   		<c:choose>
			<c:when test="${ !empty loginMember }">
			    ${loginMember }
			</c:when>	
   		</c:choose>
  </div>
<jsp:include page="common/footer.jsp"></jsp:include>