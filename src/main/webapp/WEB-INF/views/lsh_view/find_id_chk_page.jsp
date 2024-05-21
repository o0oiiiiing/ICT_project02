<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FiND_ID | Jeju_travel</title>
		<!-- 파비콘 -->
		<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/find_id_chk.css" rel="stylesheet" />
		<style type="text/css">
			.findID_chk_page {
				padding: 8% 0 0;
			  	margin: auto;
			  	width: 100%;
			  	height: 600px;
			  	background-image: url('resources/lsh_images/jeju_island.jpg');
			  	background-position: center;
			  	background-size: cover;
			}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="findID_chk_page">
			<div class="findID_chk_container">
				<h2 class="findID_chk_text">아이디 찾기</h2>
				<c:choose>
					<c:when test="${empty find_list}">
						<p class="findID_chk_result">해당 아이디는 존재하지 않습니다.</p>
					</c:when>
			        <c:otherwise>
			        	<c:forEach var="k" items="${find_list}">
			        		<c:if test="${k.active == 0}">
					            <p class="findID_chk_result">ID : ${k.u_id} </p>
			        		</c:if>
				            <c:if test="${k.active == 1}">
				            	<p class="findID_chk_result">이미 탈퇴한 회원입니다.</p>
				            </c:if>
			        	</c:forEach>
			        </c:otherwise>
				</c:choose>
				
				<div class="findID_chk_box">
					<a href="login_go.do" >Login &nbsp;&nbsp; | </a>
					<a href="findpwd_go.do" >find your Password</a>
				</div>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>


