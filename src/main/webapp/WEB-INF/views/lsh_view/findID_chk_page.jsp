<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>아이디 찾기 결과</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section>
			<div>
				<h2>아이디 찾기 결과</h2>
				<c:choose>
					<c:when test="${empty find_list}">
						<p>텅</p>
					</c:when>
			        <c:otherwise>
			        	<c:forEach var="k" items="${find_list}">
				            <p> ${k.u_id} </p>
			        	</c:forEach>
			        </c:otherwise>
				</c:choose>
			</div>
			
			<div>
				<a href="login_go.do">로그인</a> | 
				<a href="findpwd_go.do">비밀번호 찾기</a>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>


