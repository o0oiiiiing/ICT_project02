<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>DETAIL | Jeju_travel</title>
<!-- 구글 아이콘 -->
<link
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined"
	rel="stylesheet" />
<!-- 폰트 적용 -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<!-- css 적용 -->
<link rel="stylesheet" href="resources/pdh-css/detail.css" />
<link rel="stylesheet" href="resources/pdh-css/scroll-to-top-button.css" />
<link rel="stylesheet" href="resources/common-css/reset.css" />
</head>

<body>
	<img class="main_image" src="resources/pdh-image/detail01.jpg">
	<header class="header">
		<ul class="nav">
			<li>
				<h1 class="title">
					<a href="home" class="a_tag">제주여행</a>
				</h1>
			</li>
			<li class="nav_list">관광지</li>
			<li class="nav_list">음식</li>
			<li class="nav_list">숙박</li>
			<li class="nav_list">쇼핑</li>
			<li class="nav_list">축제/행사</li>
			<li class="nav_list">나의 여행</li>
		</ul>

		<ul class="nav-list__right">
			<li>
				<div class="search-bar">
					<span class="material-symbols-outlined search-icon">search</span> <input
						class="search-field" type="text" placeholder="검색어를 입력해주세요." /><span
						class="material-symbols-outlined delete-icon">close</span>
				</div>
			</li>
			<li>로그인</li>
			<li>|</li>
			<li>회원가입</li>
		</ul>
	</header>

	<p class="place_name">성산일출봉</p>

	<table class="icons">
		<tbody>
			<tr class="icons-section">
				<td class="border-right"><span
					class="material-symbols-outlined icon">search</span></td>
				<td class="border-right"><span
					class="material-symbols-outlined icon">calendar_today</span></td>
				<td class="border-right"><span
					class="material-symbols-outlined icon">edit</span></td>
				<td class="border-right"><span
					class="material-symbols-outlined icon">mouse</span></td>
				<td class="no-border-right"><span
					class="material-symbols-outlined icon">link</span></td>
			</tr>
			<tr class="icons-section">
				<td class="icons-detail border-right">좋아요</td>
				<td class="icons-detail border-right">일정 추가</td>
				<td class="icons-detail border-right">리뷰</td>
				<td class="icons-detail border-right">조회수</td>
				<td class="icons-detail no-border-right">링크 복사</td>
			</tr>
			<tr class="icons-section">
				<td class="icons-number border-right">398</td>
				<td class="border-right"><input class="icons-button"
					type="button" value="추가하기"></td>
				<td class="icons-number border-right">56</td>
				<td class="icons-number border-right"><fmt:formatNumber
						value="2000" pattern="#,##0" /></td>
				<td class="no-border-right"><input class="icons-button"
					type="button" value="복사하기"></td>
			</tr>
		</tbody>
	</table>

	<div>
		<div class="detail-section">
			<div class="detail-section__bar">
				<p class="detail-title">상세정보</p>
				<span class="material-symbols-outlined expand_icon">expand_more</span>
			</div>
			<div>
				<div id="map"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=227e2b54f64068104ae49efbe75cc7fe"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

					mapOption = {
						center : new kakao.maps.LatLng(33.458528, 126.94225), // 지도의 중심좌표
						level : 4
					// 지도의 확대 레벨
					};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					// 마커 표시하기
					// 마커가 표시될 위치입니다 
					var markerPosition = new kakao.maps.LatLng(33.458528, 126.94225);

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position : markerPosition
					});

					marker.setMap(map);
					
					// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					var iwContent = '<div style="padding:5px;">성산일출봉</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
						content : iwContent,
						removable : iwRemoveable
					});

					// 마커에 클릭이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'mouseover', function() {
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);
					});
					
					// mouse나가면 인포윈도우 없애기
				</script>
			</div>
		</div>

		<div class="detail-section">
			<div class="detail-section__bar">
				<p class="detail-title">Q&A</p>
				<span class="material-symbols-outlined expand_icon">expand_more</span>
			</div>
			<p class="qa_title">Q&A (18)</p>
			<table class="qa_table">
				<thead>
					<tr>
						<td style="width: 50%">제목</td>
						<td style="width: 20%">작성자</td>
						<td style="width: 20%">작성일</td>
						<td style="width: 10%">답변 여부</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><span class="material-symbols-outlined">lock</span>제목이에요</td>
						<td>아무개</td>
						<td>2024.01.01</td>
						<td>N</td>
					</tr>
				</tbody>
			</table>
		</div>

		<div class="detail-section">
			<div class="detail-section__bar">
				<p class="detail-title">리뷰</p>
				<span class="material-symbols-outlined expand_icon">expand_more</span>
			</div>
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