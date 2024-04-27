<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="resources/chm-css/category.css?after">
<script type="text/javascript" src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fwqqugcxzu"></script>
<script type="text/javascript">
function toggleCollapse(element) {
    element.classList.toggle("collapsed");
}
</script>
</head>
<body>
	
	<!-- 전체 틀 -->
  <div class="background">

    <!-- 소개 -->
    <div class="wrapper_top">
      <div class="wrapper_top_inner">
        <div class="wrapper_top_category_id">관광지</div>
        <div class="wrapper_top_category_name">이름순<span id="">↓</span></div>
      </div>
    </div>
	
    <!-- DB에서 가져와서 c:foreach 반복문 돌릴 관광지 카테고리 보여주는 구간  -->
    <div class="wrapper_bottom">
      <div class="wrapper_left">
		<c:forEach var="k" items="${cate_list}">
    <div class="category_box" onclick="toggleCollapse(this)">
        <img src='${k.vi_image}' class="category_img">
        <p class="category_id">${k.vi_value}</p>
        <p class="category_title">${k.vi_title}</p>
        <p class="category_hits">조회수 : 30</p>
    </div>
</c:forEach>
      </div>
      
      <!-- 지도 -->
      <div class="wrapper_right">
		<div id="map" style="width:100%;height:900px;"></div>
		<script>
		
		 var HOME_PATH = window.HOME_PATH || '.';
		var cityhall = new naver.maps.LatLng(37.5666805, 126.9784147),
		    map = new naver.maps.Map('map', {
		        center: cityhall.destinationPoint(0, 500),
		        zoom: 15
		    }),
		    marker = new naver.maps.Marker({
		        map: map,
		        position: cityhall
		    });
		var contentString = [
		        '<div class="iw_inner">',
		        '   <h3>서울특별시청</h3>',
		        '   <p>서울특별시 중구 태평로1가 31 | 서울특별시 중구 세종대로 110 서울특별시청<br />',
		        '       <img src="resources/chm-css/images/img1.png" width="55" height="55" alt="서울시청" class="thumb" /><br />',
		        '       02-120 | 공공,사회기관 &gt; 특별,광역시청<br />',
		        '       <a href="http://www.naver.com" target="_blank">상세페이지 이동</a>',
		        '   </p>',
		        '</div>'
		    ].join('');
		var infowindow = new naver.maps.InfoWindow({
		    content: contentString
		});
		naver.maps.Event.addListener(marker, "click", function(e) {
		    if (infowindow.getMap()) {
		        infowindow.close();
		    } else {
		        infowindow.open(map, marker);
		    }
		});
		infowindow.open(map, marker);
		
		</script>
      </div>
      <div class="wrapper_footer">
      	<div>
      	</div>
      </div>
    </div>
  </div>
</body>
</html>