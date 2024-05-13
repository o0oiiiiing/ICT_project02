<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="resources/wyy-css/myTripPlan.css" rel="stylesheet" />
<link href="resources/common-css/reset.css" rel="stylesheet" />
<!-- 카카오 지도 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b1dad637e1ccb6b94f973b276b012bd"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- jQuery Modal -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<!-- 폰트? -->
<link
	href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css"
	rel="stylesheet">
<!-- 구글 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type="text/javascript">
	// 나의 여행일정, 좋아요한 여행지 클릭시 숨김 및 보이기
	$(document).ready(function() {
		myTripLike();
	    $(".myTrip").click(function() {
	        $(".detail_calendar").show();   
	        myTripPlan();
	        $(".likeTripDetail").hide();
	        $(".paging_mytrip").hide(); 
	    });
	
	    $(".likeTrip").click(function() {
	        $(".likeTripDetail").show();  
	        myTripLike();
	        $(".detail_calendar").hide();    
	    });
	    
	    $(".chatbot_image").click(function() {
	        $(".chatbot_modal").toggle();  
	    });
	    
	});
	
	// 좋아요 삭제
	function removeHeart(like_idx, element) {
    	$.ajax({
        	url: "removeHeart",
        	type: "POST",
        	data: {like_idx: like_idx },
        	dataType: "text",
        	success: function(data) {
            	alert('관심상품에서 해제되었습니다.');
            	$(element).closest('.likeTrip_content').remove();
            	myTripLike();
        	},
        	error: function() {
            	alert('에러');
        	}
    	});
	};

	
</script>
<script type="text/javascript">
			function myTripPlan() {
				let u_idx = '<%= session.getAttribute("u_idx") %>';
			    $.ajax({
			        url: "myTripMap",
			        method: "post",
			        dataType: "json",
			        data: { u_idx: u_idx },
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
			            		'관광지': 'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',	// 관광지
			            		'쇼핑': 'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png',	// 쇼핑
			            		'숙박': 'https://maps.gstatic.com/mapfiles/ms2/micons/pink-dot.png', 	// 숙박
			            		'음식점': 'https://maps.gstatic.com/mapfiles/ms2/micons/yellow-dot.png',	// 음식 
			            		'축제/행사': 'https://maps.gstatic.com/mapfiles/ms2/micons/purple-dot.png'	// 축제/행사
			            	};
			            
			         	// 카테고리에 따라 마커를 생성하고 지도에 표시하는 함수
			            function createMarkers(value, positions) {
						    var markers = [];
						    var markerImage = new kakao.maps.MarkerImage(markerImages[value], new kakao.maps.Size(32, 32));
						    for (var i = 0; i < positions.length; i++) {
						        (function(position) {
						            var marker = new kakao.maps.Marker({
						                map: map,
						                position: new kakao.maps.LatLng(position.vi_latitude, position.vi_longitude),
						                title: position.vi_title, 
						                contentsid: position.contentsid,
						                image: markerImage
						            });
						
						            // 인포윈도우 내용
						            var iwContent = '<div style="padding:5px; text-align:center;">' 
						                + position.vi_title
						                + '<br><a href="detail?contentsid='+position.contentsid+'">상세페이지</a>'
						                + '</div>';
						
						            // 인포윈도우 생성
						            var infowindow = new kakao.maps.InfoWindow({
						                content: iwContent
						            });
						
						         	// 클릭 이벤트 추가
						            kakao.maps.event.addListener(marker, 'click', function() {
						                // 인포윈도우가 열려있으면 닫고, 닫혀있으면 열기
						                if (infowindow.getMap()) {
						                    infowindow.close();
						                } else {
						                    infowindow.open(map, marker);
						                }
						            });
						
						            markers.push(marker);
						        })(positions[i]);
						    }
						    return markers;
						}
						
			         	// 선언
			            const values = ['관광지', '쇼핑', '숙박', '음식점', '축제/행사'];
			            const markers = {};

			            // 각 카테고리에 대한 마커를 생성하고 지도에 표시
			            values.forEach(value => {
			                markers[value] = createMarkers(value, data.filter(item => item.vi_value === value));
			            });
			            
			        }
			    });
			};
			
			function myTripLike() {
				// 세션에서 u_idx값 가지고오기
				let u_idx = '<%= session.getAttribute("u_idx") %>';
			    $.ajax({
			        url: "myTripMapLike",
			        method: "post",
			        dataType: "json",
			        data: { u_idx: u_idx },
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
			            		'관광지': 'https://maps.gstatic.com/mapfiles/ms2/micons/blue-dot.png',	// 관광지
			            		'쇼핑': 'https://maps.gstatic.com/mapfiles/ms2/micons/green-dot.png',	// 쇼핑
			            		'숙박': 'https://maps.gstatic.com/mapfiles/ms2/micons/pink-dot.png', 	// 숙박
			            		'음식점': 'https://maps.gstatic.com/mapfiles/ms2/micons/yellow-dot.png',	// 음식 
			            		'축제/행사': 'https://maps.gstatic.com/mapfiles/ms2/micons/purple-dot.png'	// 축제/행사
			            	};
			            
			         	// 카테고리에 따라 마커를 생성하고 지도에 표시하는 함수
			            function createMarkers(value, positions) {
						    var markers = [];
						    var markerImage = new kakao.maps.MarkerImage(markerImages[value], new kakao.maps.Size(32, 32));
						    for (var i = 0; i < positions.length; i++) {
						        (function(position) {
						            var marker = new kakao.maps.Marker({
						                map: map,
						                position: new kakao.maps.LatLng(position.vi_latitude, position.vi_longitude),
						                title: position.vi_title,
						                image: markerImage
						            });
						            markers.push(marker);
						        })(positions[i]);
						    }
						    return markers;
						}

						
			         	// 선언
			            const values = ['관광지', '쇼핑', '숙박', '음식점', '축제/행사'];
			            const markers = {};

			            // 각 카테고리에 대한 마커를 생성하고 지도에 표시
			            values.forEach(value => {
			                markers[value] = createMarkers(value, data.filter(item => item.vi_value === value));
			            });
			        	
			        	 // 인포윈도우 생성
			            var infowindow = new kakao.maps.InfoWindow({
			                content: ''
			            });

			            $('.likeTrip_content').click(function() {
			                var latitude = $(this).data('vi_latitude'); 
			                var longitude = $(this).data('vi_longitude');
			                var title = $(this).data('vi_title'); 
			                var contentsid = $(this).data('contentsid'); 
			                var vi_image = $(this).data('vi_image'); 

			                // 인포윈도우 내용 업데이트
			                let iwContent = '<div style="padding:5px; text-align:center; position:relative; margin:0 auto;'
			             		+ ' width:200px; ">' 
			             		+ '<img src="'+vi_image+'" style="width:200px; height:50px;"><br>'
			                    + title
			                    + '<br><a href="detail?contentsid='+contentsid+'">상세페이지</a>'
			                    + '</div>';

			                // 인포윈도우에 새로운 내용 적용
			                infowindow.setContent(iwContent);

			             	// 클릭한 위치에 마커와 인포윈도우 표시
			                let markerPosition = new kakao.maps.LatLng(latitude, longitude);
			                let marker = new kakao.maps.Marker({
			                    position: markerPosition
			                });

			                // 인포윈도우를 마커 위에 표시
			                infowindow.open(map, marker);

			                // 지도 중심을 마커 위치로 이동하기
			           		// map.setCenter(markerPosition);
			            });
			        }
			    });
			};
		
		// 모달창 열고닫기
	    function openModal(contentsid) {
	        $(".modal").show();
	        $("#contentsid").val(contentsid);
	    }
	    function closeModal() {
	        $(".modal").hide();
	    }
		
	    // 정보수정 창 이동
	    function mytripPlan_userUpdate(u_idx){
	    	// 나중에 u_idx 넣지말고 user_update.do 에서 세션으로 받기
	    	location.href = "user_update.do?u_idx="+u_idx;
	    }
	    function chatbotgo() {
			
		}
	    
	    // 경화
	    function board_list() {
			location.href="board_list.do"
		}
		function report_list() {
			location.href="report_list.do"
		}
</script>

<style type="text/css">
#chatbot_image{
	width: 50px;
	height: 50px;
	position: fixed;
	bottom: 20px;
	right: 20px;
	z-index: 99;
	line-height: 60px;
	cursor: pointer;
}
.chatbot_modal{
	position: fixed;
	bottom: 20px;
	right: 80px;
	z-index: 2;
	background-color: white;
	display: none;
	border-radius: 10px;
}

</style>
<title>나의 여행</title>
</head>
<body>
	<div>
		<%@include file="../common/header.jsp"%>
	</div>  
	<div class="myTripPlan">
		<div class="myTripPlan_title">
		<h2>나의 여행</h2>
		<hr>
		</div>
		<div class="myTrip_profile">
			<img src="resources/common-image/profile.png" width="150px"
				height="150px" style="margin: auto 30px;">
			<div class="myTrip_profile_content">
				<c:forEach var="k" items="${u_list}" varStatus="vs">
					<p>${k.u_name} 님</p>
					<p>나의 리뷰 ${k.review_count}</p>
					<p>좋아요한 여행지 ${k.like_active_count}</p>
					<button type="button" class="mytripPlan_userUpdate" onclick="mytripPlan_userUpdate(${k.u_idx})">정보수정</button>
					<!-- 경화 -->
					<button onclick="board_list()">문의하기</button>
					<button onclick="report_list()">신고하기</button>
					
				</c:forEach>
			</div>
		</div>
		<!-- 카카오 지도 -->
		<div id="map"></div>

		<div class="myTripLikeTrip">
			<button type="button" class="likeTrip">좋아요한 여행지</button>
			&nbsp;|&nbsp;
			<button type="button" class="myTrip">나의 여행일정</button>
			<br>
		</div>
		<div class="myTripDetail">
			<div class="detail_calendar">
				<iframe src="calendar" width="1200px" height="1100px"
					frameborder="0"></iframe>
			</div>
		</div>
		<!-- 일정추가 모달창  -->
		<div class="modal">
			<div class="screen">
			<form action="calSave" method="post">
				<p>일정 제목 : <input type="text" name="c_title" ></p>
				<p>시작 날짜 : <input type="date" name="c_start"></p>
				<p>끝 날짜 : <input type="date" name="c_end"></p> 
				<input type="submit" value="일정추가">
				<input type="hidden" name="contentsid" id="contentsid" >	
				<button type="button" value="close" class="btn modal--close" onclick="closeModal()">Close</button>
			</form>
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
							<div class="likeTrip_content"
								data-vi_latitude="${k.vi_latitude }"
								data-vi_longitude="${k.vi_longitude }"
								data-vi_title="${k.vi_title }"
								data-contentsid = "${k.contentsid }"
								data-vi_image="${k.vi_image }">
								<img src="${k.vi_image}" class="likeTrip_Image" />
								<p>${k.vi_value}</p>
								<p>${k.vi_title}</p>
								<button type="button" value="open" class="btn modal--open" onclick="openModal('${k.contentsid}')">일정추가</button>
								<span class="material-symbols-outlined" id="heart_icon"onclick="removeHeart('${k.like_idx }', this)" >favorite</span>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<c:if test="${paging.totalPage > 1}">
			<div class="paging_mytrip">
				<c:forEach var="i" begin="1" end="${paging.totalPage}">
					<a href="myTripPlan?u_idx=${u_idx}&cPage=${i}">${i}</a>
				</c:forEach>
			</div>
		</c:if>
	</div>
			<img src="resources/common-image/chatbot.png" id="chatbot_image" class="chatbot_image">
		<div class="chatbot_modal" >
			<%@include file="../common/chatbot.jsp"%>
		</div> 
	<div>
		<%@include file="../common/footer.jsp"%>
	</div>
</body>
</html>