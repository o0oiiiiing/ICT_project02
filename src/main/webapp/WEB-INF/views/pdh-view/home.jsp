<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>HOME | Jeju_travel</title>
<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 적용 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<!-- css 적용 -->
<link rel="stylesheet" href="resources/pdh-css/home.css" />
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css" />
<link rel="stylesheet" href="resources/common-css/reset.css" />
</head>

<body>
	<img class="main_image" src="resources/pdh-image/main01.jpg">
	<header class="header">
		<ul class="nav">
			<li>
				<h1 class="title">
					<a href="home" class="a_tag">제주여행</a>
				</h1>
			</li>
			<li class="nav_list"><a href="detail" class="a_tag">관광지</a></li>
			<li class="nav_list"><a href="map_practice" class="a_tag">음식</a></li>
			<li class="nav_list">숙박</li>
			<li class="nav_list">쇼핑</li>
			<li class="nav_list">축제/행사</li>
			<li class="nav_list">나의 여행</li>
		</ul>

		<ul class="nav-list__right">
			<li>
				<div class="search-bar">
					<span class="material-symbols-outlined icon">search</span> <input
						class="search-field" type="text" placeholder="검색어를 입력해주세요." /><span
						class="material-symbols-outlined icon delete-icon">close</span>
				</div>
			</li>
			<li>로그인</li>
			<li>|</li>
			<li>회원가입</li>
		</ul>
	</header>

	<div class="popular__container">
		<div class="place__container">
			<ul class="place__list">
				<li class="place__title"><p>현재 인기있는 장소</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
				<li class="place"><img alt="장소"
					src="resources/pdh-image/place.jpg">
					<p>조회수 : 30</p>
					<p>관광지</p>
					<p>오설록 녹차밭</p></li>
			</ul>
		</div>
	</div>

	<%@ include file="../common/footer.jsp"%>

	<div>
		<button id="scrollToTopButton">
			<span class="material-symbols-outlined">expand_less</span>
		</button>
	</div>
	<script type="text/javascript">
	// 클릭시에 한 번에 위로 올라가는 버튼
	window.onscroll = function() { scrollFunction() };

	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("scrollToTopButton").style.display = "block";
		} else {
			document.getElementById("scrollToTopButton").style.display = "none";
		}
	}

	document.getElementById("scrollToTopButton").addEventListener("click", () => {
		window.scrollTo({
			top: 0,
			left: 0,
			behavior: 'smooth'
		});
	})
	</script>

</body>
</html>