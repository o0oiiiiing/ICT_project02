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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	// 링크 복사하기 버튼
	function copyLink() {
		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("링크가 복사되었습니다.")
	}
	
	// 일정 추가하기 버튼
	function addSchedule() {
		location.href = "addSchedule?contentsid=${placeDetail.contentsid}";
	}
	
	// 아이콘 눌렀을 때 텍스트박스 글 지우기
	function clearInput() {
		var searchField = document.getElementsByClassName("search-field")

		for (var i = 0; i < searchField.length; i++) {
			searchField[i].value = "";
		}
	}
	
	document.addEventListener('DOMContentLoaded', function() {
	    var writeButton = document.querySelector('.write_button');
	    var testDiv = document.getElementById('test01');

	    writeButton.addEventListener('click', function() {
	        // 요소의 display를 토글
	        if (testDiv.style.display === 'block') {
	            testDiv.style.display = 'none';
	        } else {
	            testDiv.style.display = 'block';
	        }
	    });
	});
</script>

</head>

<body>
	<img class="main_image" src="${placeDetail.vi_image}">
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
			<li class="nav_list"><a href="myTripPlan" class="a_tag">나의 여행</a></li> 
		</ul>

		<ul class="nav-list__right">
			<li>
				<form method="post" action="search">
					<div class="search-bar">
						<span class="material-symbols-outlined search-icon">search</span> 
						<input class="search-field" type="text" name="keyword" value="" placeholder="검색어를 입력해주세요." />
						<span class="material-symbols-outlined delete-icon" onclick="clearInput()">close</span>
					</div>
				</form>
			</li>
			<li>로그인</li>
			<li>|</li>
			<li>회원가입</li>
		</ul>
	</header>

	<p class="place_name">${placeDetail.vi_title}</p>

	<table class="icons">
		<tbody>
			<tr class="icons-section">
				<td class="border-right"><span
					class="material-symbols-outlined icon">favorite</span></td>
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
				<td class="icons-number border-right"><fmt:formatNumber value="${likeNum}" pattern="#,##0" /></td>
				<td class="border-right"><input class="icons-button"
					type="button" value="추가하기" onclick="addSchedule()"></td>
				<td class="icons-number border-right"><fmt:formatNumber value="${reviewNum}" pattern="#,##0" /></td>
				<td class="icons-number border-right"><fmt:formatNumber value="${placeDetail.vi_hit}" pattern="#,##0" /></td>
				<td class="no-border-right"><input class="icons-button"
					type="button" value="복사하기" onclick="copyLink()"></td>
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
						center : new kakao.maps.LatLng(${placeDetail.vi_latitude}, ${placeDetail.vi_longitude}), // 지도의 중심좌표
						level : 4
					// 지도의 확대 레벨
					};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);
					
					// 마커 표시하기
					// 마커가 표시될 위치입니다 
					var markerPosition = new kakao.maps.LatLng(${placeDetail.vi_latitude}, ${placeDetail.vi_longitude});

					// 마커를 생성합니다
					var marker = new kakao.maps.Marker({
						position : markerPosition
					});

					marker.setMap(map);
					
					// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
					var iwContent = '<div style="padding:5px;">${placeDetail.vi_title}</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
						content : iwContent,
						removable : iwRemoveable
					});

					// 마커에 mouseover 이벤트를 등록합니다
					kakao.maps.event.addListener(marker, 'mouseover', function() {
						// 마커 위에 인포윈도우를 표시합니다
						infowindow.open(map, marker);
					});
					
					// mouse나가면 인포윈도우 없애기
					kakao.maps.event.addListener(marker, 'mouseout', function() {
						// 마커 위에 인포윈도우를 제거
						infowindow.close();
					});
				</script>
			</div>
		</div>

		<div class="detail-section">
			<div class="detail-section__bar">
				<p class="detail-title">Q&A</p>
				<span class="material-symbols-outlined expand_icon">expand_more</span>
			</div>
			<div class="qa_title__section">
				<p class="qa_title">Q&A (18)</p>
				<input class="write_button" type="button" value="질문작성">
			</div>
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
						<td style="padding-left: 10px;">제목이에요</td>
						<td style="text-align: center;">아무개</td>
						<td style="text-align: center;">2024.01.01</td>
						<td style="text-align: center;">N</td>
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
	
	<form id="test01">
		<label>제목</label>
		<input type="text" name="title"><br>
		<label>비밀번호</label>
		<input type="password" name="pwd">
		<input type="submit" value="작성하기">
		<%@ include file="../pdh-view/qa_write.jsp"%>
	</form>
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