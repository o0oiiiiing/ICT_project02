<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 적용 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<!-- css 적용 -->
<link rel="stylesheet" href="resources/common-css/header.css" />
<link rel="stylesheet" href="resources/common-css/reset.css" />

<script type="text/javascript">
	// 아이콘 눌렀을 때 텍스트박스 글 지우기
	function clearInput() {
		var searchField = document.getElementsByClassName("search-field")

		for (var i = 0; i < searchField.length; i++) {
			searchField[i].value = "";
		}
	}
</script>

</head>
<body>
	<header class="header">
		<ul class="nav">
			<li>
				<h1 class="title">
					<a href="home" class="a_tag">제주여행</a>
				</h1>
			</li>
 			<li class="nav_list"><a href="category_page.do?vi_value=관광지" class="a_tag">관광지</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=음식점" class="a_tag">음식점</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=숙박" class="a_tag">숙박</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=쇼핑" class="a_tag">쇼핑</a></li>
			<li class="nav_list"><a href="category_page.do?vi_value=축제/행사" class="a_tag">축제/행사</a></li>
			<c:if test="${admin_loginChk != 'ok'}">
                <li class="nav_list"><a href="myTripPlan" class="a_tag">나의 여행</a></li> 
            </c:if>
            <c:if test="${admin_loginChk == 'ok'}">
                <li class="nav_list"><a href="admin_list.do" class="a_tag">관리자 게시판</a></li> 
            </c:if>
		</ul>

		<c:choose>
			<c:when test="${loginChk == 'ok'}">
				<ul class="nav-list__right" style="width: 600px;">
					<li>
						<form method="post" action="search">
							<div class="search-bar">
								<span class="material-symbols-outlined icon">search</span> <input
									class="search-field" type="text" name="keyword" value=""
									placeholder="검색어를 입력해주세요." /> <span
									class="material-symbols-outlined delete-icon"
									onclick="clearInput()">close</span>
							</div>
						</form>
					</li>
					<li>${userVO.u_name}님 환영합니다.</li>
					<li>|</li>
					<li><a href="logout_go.do" class="a_tag">로그아웃</a></li>
				</ul>
			</c:when>
			<c:otherwise>
				<ul class="nav-list__right" style="width: 500px;">
					<li>
						<form method="post" action="search">
							<div class="search-bar">
								<span class="material-symbols-outlined icon">search</span> <input
									class="search-field" type="text" name="keyword" value=""
									placeholder="검색어를 입력해주세요." /> <span
									class="material-symbols-outlined delete-icon"
									onclick="clearInput()">close</span>
							</div>
						</form>
					</li>
					<li><a href="login_go.do" class="a_tag">로그인</a></li>
					<li>|</li>
					<li><a href="join_go.do" class="a_tag">회원가입</a></li>
				</ul>
			</c:otherwise>
		</c:choose>
	</header>
</body>
</html>