<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>아이디 찾기 결과</title>
		<link href="resources/lsh-css/findID_chk.css" rel="stylesheet">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="findID_chk_page">
			<div class="findID_chk_container">
				<h2 class="findID_chk_text">아이디 찾기 결과</h2>
				<c:choose>
					<c:when test="${empty find_list}">
						<p class="findID_chk_result">텅</p>
					</c:when>
			        <c:otherwise>
			        	<c:forEach var="k" items="${find_list}">
				            <p class="findID_chk_result"> ${k.u_id} </p>
			        	</c:forEach>
			        </c:otherwise>
				</c:choose>
				
				<div class="findID_chk_box">
					<a href="login_go.do">로그인</a> | 
					<a href="findpwd_go.do">비밀번호 찾기</a>
				</div>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>

