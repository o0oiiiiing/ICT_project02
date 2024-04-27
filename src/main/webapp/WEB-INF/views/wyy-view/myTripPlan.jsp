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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fwqqugcxzu"></script>

<script type="text/javascript">
	
</script>
<script type="text/javascript">
// 나의 여행일정, 좋아요한 여행지 클릭시 숨김 및 보이기
$(document).ready(function() {

    $(".myTrip").click(function() {
        $(".myTripDetail").show();     
        $(".likeTripDetail").hide();   
    });

    $(".likeTrip").click(function() {
        $(".likeTripDetail").show();    
        $(".myTripDetail").hide();    
    });
});

// 캘린더 일정추가 
	function addCalList(){
		location.href="addCalList";
	}
</script>
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
				<p>
					$(이름) 님&nbsp;
					<button onclick="/">정보수정</button>
				</p>
				<p>나의 여행일정 ($값)</p>
				<p>나의 리뷰 ($값)</p>
				<p>좋아요한 여행지 ($값)</p>
			</div>
		</div>
		<!-- 카카오 지도 -->
		<div id="map"></div>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	9b1dad637e1ccb6b94f973b276b012bd"></script>
		<script type="text/javascript">
			$(document).ready(function() {
			    $.ajax({
			        url: "myTripMap",
			        method: "post",
			        dataType: "json",
			        success: function(data) {
			            var mapContainer = document.getElementById('map'); // 지도를 표시할 div  
			            var mapOption = { 
			                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			                level: 3 // 지도의 확대 레벨
			            };
	
			            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			         
			            for (var i = 0; i < data.length; i++) {
			                var marker = new kakao.maps.Marker({
			                    map: map, // 마커를 표시할 지도
			                    position: new kakao.maps.LatLng(data[i].latitude, data[i].longitude), // 마커를 표시할 위치
			                    title : data[i].title // 마커의 타이틀
			                });
			            }
	
			            // 마커 이미지의 이미지 주소입니다
			            var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
			            
			            for (var i = 0; i < positions.length; i ++) {
			                
			                // 마커 이미지의 이미지 크기 입니다
			                var imageSize = new kakao.maps.Size(24, 35); 
			                
			                // 마커 이미지를 생성합니다    
			                var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
			                
			                // 마커를 생성합니다
			                var marker = new kakao.maps.Marker({
			                    map: map, // 마커를 표시할 지도
			                    position: positions[i].latlng, // 마커를 표시할 위치
			                    title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			                    image : markerImage // 마커 이미지 
			                });
			            }
			        } // success 콜백 함수 괄호
			    }); // $.ajax 함수 괄호
			}); // $(document).ready 함수 괄호
		</script>
		<div class="myTripLikeTrip">
			<button class="myTrip" onclick="/">나의 여행일정</button>
			&nbsp;|&nbsp;
			<button class="likeTrip" onclick="/">좋아요한 여행지</button>
			<br>
		</div>
		<div class="myTripDetail">
			<div class="detail_calendar">
				<iframe src="calendar" width="500px" height="500px" frameborder="0"></iframe>
			</div>
			<div class="detail_calList">
				<c:choose>
					<c:when test="${empty list}">
						<h3>여행일정이 없습니다.</h3>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${list}" varStatus="vs">
							<div class="calList_content">
								<p>${k.vi_title}</p>
								<p>${k.vi_address}</p>
								<p>${k.vi_phoneno}</p>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>

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
								<img src="${k.vi_image}" class="likeTrip_Image"/>
								<p>${k.vi_value}</p>
								<p>여행 이름 : ${k.vi_title}</p>
								<button onclick="addCalList()">일정 추가</button>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div id="content"></div>
	</div>
</body>
</html>