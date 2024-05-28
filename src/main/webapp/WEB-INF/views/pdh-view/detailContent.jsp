<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보</title>
</head>
<body>
<div class="detail-section">
		<div class="detail-section__bar">
			<p class="detail-title">상세정보</p>
			<span id="detailOpenIcon" class="material-symbols-outlined expand_icon" onclick="detailOpen('detailDiv', 'detailOpenIcon')">keyboard_arrow_up</span>
		</div>
		<div id="detailDiv">
			<div id="map"></div>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b1dad637e1ccb6b94f973b276b012bd"></script>
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
</body>
</html>