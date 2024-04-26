<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.myTripPlan{
		margin: 0 auto;
		text-align: center;
		width: 1500px;
	}
	.myTrip_profile{
		width: 750px;
		display: flex;
		margin: 30px auto ;
		background-color: #d9d9d9;
		
	}
	.myTrip_profile_content{
		text-align: left;
		margin-left: 40px;
	}
	#map{
		width:1200px;
		height:500px;
		margin: 0 auto;"
	}
	.myTripLikeTrip{
		display: flex;
		margin-left: 150px;
		margin-top: 20px;
    	font-size: 22px;
	}
	.myTrip:hover, .likeTrip:hover{
		font-weight: bold;
		border-style: none;
		background-color: white;
	}
	.myTrip, .likeTrip{
		border-style: none;
		color: black;
		background-color: white;
	}
	.myTripDetail, .likeTripDetail {
        display: none;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fwqqugcxzu"></script>
<script type="text/javascript">
// 지도 api
$(document).ready(function() {
    $.ajax({
        url: "myTripMap",
        method: "post",
        dataType: "json",
        success: function(data) {
            var centerLatLng = new naver.maps.LatLng(data.items[0].latitude, data.items[0].longitude);

            var map = new naver.maps.Map('map', {
                center: centerLatLng,
                zoom: 10
            });
            
            //인포윈도우
            var infowindow = new naver.maps.InfoWindow();
            
            $.each(data.items, function(index, item) {
                var contentString = [
                    '<div class="iw_inner">',
                    '   <h3>' + item.title + '</h3>',
                    '   <p>' + item.address + ' | ' + item.roadaddress + '</p>',
                    '<img src="'+item.repPhoto.photoid.thumbnailpath+'" width="55" height="55" alt="'+item.title+'"  /><br>',
                    '       <a href="http://www.naver.com" target="_blank">자세히 보기</a>',
                    '</div>'
                ].join(''); 

                var marker = new naver.maps.Marker({
                    position: new naver.maps.LatLng(item.latitude, item.longitude),
                    map: map
                });

                // 마커 클릭했을 때
                naver.maps.Event.addListener(marker, 'click', function(e) {
                    infowindow.setContent(contentString);
                    if (infowindow.getMap()) {
                        infowindow.close();
                    } else {
                        infowindow.open(map, marker);
                    }
                });
            });
        },
        error: function() {
            alert("읽기 실패");
        }
    });
});
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
</script>
<title>나의 여행</title>
</head>
<body>
<div class="myTripPlan">
	<h2>나의 여행</h2>
	<hr>
	<div class="myTrip_profile">
		<img src="resources/common-image/profile.png" width="150px" height="150px" style="margin:10px">
		<div class="myTrip_profile_content">
			<p>$(이름) 님&nbsp;<button onclick="/" >정보수정</button></p>
			<p>나의 여행일정 ($값)</p>
			<p>나의 리뷰 ($값)</p>
			<p>좋아요한 여행지 ($값)</p>
		</div>
	</div>
	<div id="map" ></div>
	<div class="myTripLikeTrip">
		<button class="myTrip" onclick="/">나의 여행일정</button>&nbsp;|&nbsp;
		<button class="likeTrip" onclick="/">좋아요한 여행지</button>
	</div>
		<div class="myTripDetail">
			<p>여행일정내용~</p>
		</div>
		<div class="likeTripDetail">
			<p>좋아요내용~</p>
		</div>
	<div id="content"></div>
</div>	
</body>
</html>