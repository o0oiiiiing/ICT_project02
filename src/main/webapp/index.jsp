<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/chm-css/header.css?after">
</head>
<body>
	<div class="inner">
        <div class="logo">
          <h1><a href="/">로고</a></h1>
        </div>
        <c:choose>
        	<c:when test="${loginChk ne 'ok'}">
        <!-- 로그아웃 유틸 -->
	        <div class="util logout_util">
	          <ul class="info">
	            <li><a href="login_page.do">로그인</a></li>
	            <li><a href="signup_page.do">회원가입</a></li>
	            <li><a href="community_page.do">고객센터</a></li>
	          </ul>
	        </div>
        </c:when>
        <c:otherwise>
        <!-- 로그인 유틸 -->
	        <div class="util login_util">
	          <ul class="info">
	            <li>${userVO.u_name }님</li>
	            <li>보유 포인트: <fmt:formatNumber value="${userVO.u_point}" pattern="#,##0" /></li>
	            <li><a href="logout.do">로그아웃</a></li>
	            <li><a href="mypage_page.do">마이페이지</a></li>
	            <li><a href="basket_page.do">장바구니</a></li>
	            <li><a href="community_page.do">고객센터</a></li>
	          </ul>
	        </div>
        </c:otherwise> 
        </c:choose>
        

        <div class="gnb_wrappr">
          <ul class="gnb">
             <li class="category">
              <a href="category_page.do?vi_value=관광지">관광지</a>
            </li>
            <li class="category">
              <a href="category_page.do?vi_value=쇼핑">쇼핑</a>
            </li>
            <li class="category">
              <a href="category_page.do?vi_value=숙박">숙박</a>
            </li>
            <li class="category">
              <a href="category_page.do?vi_value=음식점">음식점</a>
            </li>
            <li class="category">
              <a href="category_page.do?vi_value=축제/행사">축제/행사</a>
            </li>
          </ul>
        </div>
      </div>
	
	<h1>안녕</h1>
	<a href="home">박다현</a>
	<a href="user_update.do">회원정보수정(비밀번호변경)</a>
	<a href="admin_list.do">나의여행(관리자)</a>
	<a href="wyyhome">원유영</a>

</body>
</html>