<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

</style>
<link href="resources/wyy-css/myTripPlan.css" rel="stylesheet" />
<link href="resources/common-css/reset.css" rel="stylesheet" />
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b1dad637e1ccb6b94f973b276b012bd"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<script type="text/javascript">
// 나의 여행일정, 좋아요한 여행지 클릭시 숨김 및 보이기
$(document).ready(function() {
	test2();
    $(".myTrip").click(function() {
        $(".detail_calendar").show();   
        test1();
        $(".likeTripDetail").hide();   
    });

    $(".likeTrip").click(function() {
        $(".likeTripDetail").show();  
        test2();
        $(".detail_calendar").hide();    
    });
});

</script>
<script type="text/javascript">
			function test1() {
			    $.ajax({
			        url: "myTripMap",
			        method: "post",
			        dataType: "json",
			        success: function(data) {
			        	// 지도를 표시할 div  
			            var mapContainer = document.getElementById('map');
			            
			            var mapOption = { 
			            	// 지도의 중심좌표 -> 한라산으로 지정(제일 가운데인듯)
			                center: new kakao.maps.LatLng(33.36132, 126.54195), 
			                level: 10 // 지도의 확대 레벨
			            };
	
			            var map = new kakao.maps.Map(mapContainer, mapOption);
			         	
			            // 카테고리별로 좌표이미지 설정(나중에 원하는 이미지 넣고싶으면 링크 수정하면 됨.)
			            var markerImages = {
			            	    c1: 'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',	// 관광지
			            	    c2: 'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png',	// 쇼핑
			            	    c3: 'https://maps.gstatic.com/mapfiles/ms2/micons/pink-dot.png', 	// 숙박
			            	  	c4: 'https://maps.gstatic.com/mapfiles/ms2/micons/yellow-dot.png',	// 음식
			            	    c5: 'https://maps.gstatic.com/mapfiles/ms2/micons/purple-dot.png'	// 축제/행사
			            	};
			            
			         // 카테고리에 따라 마커를 생성하고 지도에 표시하는 함수
			            function createMarkers(category, positions) {
    						var markers = [];
    						var markerImage = new kakao.maps.MarkerImage(markerImages[category], new kakao.maps.Size(32, 32));
    						for (var i = 0; i < positions.length; i++) {
        						var marker = new kakao.maps.Marker({
            						map: map,
            						position: new kakao.maps.LatLng(positions[i].vi_latitude, positions[i].vi_longitude),
            						title: positions[i].vi_title,
            						image: markerImage
        						});
        						markers.push(marker);
    						}
    						return markers;
						}
						
			         	// 선언
			            const categories = ['c1', 'c2', 'c3', 'c4', 'c5'];
			            const markers = {};

			            // 각 카테고리에 대한 마커를 생성하고 지도에 표시
			            categories.forEach(category => {
			                markers[category] = createMarkers(category, data.filter(item => item.vi_category === category));
			            });
			            
			        }
			    });
			};
			function test2() {
			    $.ajax({
			        url: "myTripMapLike",
			        method: "post",
			        dataType: "json",
			        success: function(data) {
			        	// 지도를 표시할 div  
			            var mapContainer = document.getElementById('map');
			            
			            var mapOption = { 
			            	// 지도의 중심좌표 -> 한라산으로 지정(제일 가운데인듯)
			                center: new kakao.maps.LatLng(33.36132, 126.54195), 
			                level: 10 // 지도의 확대 레벨
			            };
	
			            var map = new kakao.maps.Map(mapContainer, mapOption);
			         	
			            // 카테고리별로 좌표이미지 설정(나중에 원하는 이미지 넣고싶으면 링크 수정하면 됨.)
			            var markerImages = {
			            	    c1: 'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',	// 관광지
			            	    c2: 'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png',	// 쇼핑
			            	    c3: 'https://maps.gstatic.com/mapfiles/ms2/micons/pink-dot.png', 	// 숙박
			            	  	c4: 'https://maps.gstatic.com/mapfiles/ms2/micons/yellow-dot.png',	// 음식
			            	    c5: 'https://maps.gstatic.com/mapfiles/ms2/micons/purple-dot.png'	// 축제/행사
			            	};
			            
			         // 카테고리에 따라 마커를 생성하고 지도에 표시하는 함수
			            function createMarkers(category, positions) {
    						var markers = [];
    						var markerImage = new kakao.maps.MarkerImage(markerImages[category], new kakao.maps.Size(32, 32));
    						for (var i = 0; i < positions.length; i++) {
        						var marker = new kakao.maps.Marker({
            						map: map,
            						position: new kakao.maps.LatLng(positions[i].vi_latitude, positions[i].vi_longitude),
            						title: positions[i].vi_title,
            						image: markerImage
        						});
        						markers.push(marker);
    						}
    						return markers;
						}
						
			         	// 선언
			            const categories = ['c1', 'c2', 'c3', 'c4', 'c5'];
			            const markers = {};

			            // 각 카테고리에 대한 마커를 생성하고 지도에 표시
			            categories.forEach(category => {
			                markers[category] = createMarkers(category, data.filter(item => item.vi_category === category));
			            });
			            
			        }
			    });
			};
		</script>
<style type="text/css">
</style>
<title>나의 여행</title>
</head>
<body>
	<div class="myTripPlan">
		<h2>나의 여행</h2>
		<hr>
		<div class="myTrip_profile">
			<img src="resources/common-image/profile.png" width="150px"
				height="150px" style="margin: 10px">
			<div class="myTrip_profile_content">
				<c:forEach var="k" items="${u_list}" varStatus="vs">
					<p>${k.u_name}
						님&nbsp;
						<button onclick="/">정보수정</button>
					</p>
					<p>나의 여행일정 ($값)</p>
					<p>나의 리뷰 ($값)</p>
					<p>좋아요한 여행지 ${k.like_active}</p>
				</c:forEach>
			</div>
		</div>
		<!-- 카카오 지도 -->
		<div id="map"></div>

		<div class="myTripLikeTrip">
			<button class="likeTrip" >좋아요한 여행지</button>
			&nbsp;|&nbsp;
			<button class="myTrip" >나의 여행일정</button>
			<br>
		</div>
		<div class="myTripDetail">
			<div class="detail_calendar">
				<iframe src="calendar" width="1200px" height="1100px"
					frameborder="0"></iframe>
			</div>
		</div>
		<div class="likeTripDetail">
			<div class="detail_likeTrip">
				<c:choose>
					<c:when test="${empty like_list}">
						<h3>좋아요한 여행지가 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${like_list}" varStatus="vs">
							<div class="likeTrip_content">
								<img src="${k.vi_image}" class="likeTrip_Image" />
								<p>${k.vi_value}</p>
								<p>여행 이름 : ${k.vi_title}</p>
								<button
									onclick="location.href='calendar_add?contentsid=${k.contentsid}'">일정
									추가</button>
							</div>
						</c:forEach>
						<c:if test="${paging.totalPage > 1}">
							<div class="paging">
								<c:forEach var="i" begin="1" end="${paging.totalPage}">
									<a href="myTripPlan?u_idx=${u_idx}&cPage=${i}">${i}</a>
								</c:forEach>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="content"></div>
	</div>
	<div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>