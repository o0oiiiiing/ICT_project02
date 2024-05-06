<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
 			<li class="nav_list"><a href="" class="a_tag">관광지</a></li>
			<li class="nav_list"><a href="" class="a_tag">음식</a></li>
			<li class="nav_list"><a href="" class="a_tag">숙박</a></li>
			<li class="nav_list"><a href="" class="a_tag">쇼핑</a></li>
			<li class="nav_list"><a href="" class="a_tag">축제/행사</a></li>
			<li class="nav_list"><a href="myTripPlan" class="a_tag">나의 여행</a></li> 
		</ul>

		<ul class="nav-list__right">
			<li>
				<div class="search-bar">
					<span class="material-symbols-outlined icon">search</span>
					<input class="search-field" type="text" placeholder="검색어를 입력해주세요." /><span
						class="material-symbols-outlined icon delete-icon" onclick="clearInput()">close</span>
				</div>
			</li>
			<li>로그인</li>
			<li>|</li>
			<li>회원가입</li>
		</ul>
	</header>
</body>
</html>