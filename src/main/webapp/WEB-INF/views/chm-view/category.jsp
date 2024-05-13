<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/chm-css/category.css?after">
<link rel="stylesheet" href="resources/chm-css/map.css?after">
<link rel="stylesheet" href="resources/common-css/reset.css?after">
<link href="resources/common-css/reset.css" rel="stylesheet" />
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fwqqugcxzu"></script>
<script type="text/javascript" src="resources/chm-js/category.js"></script>           
<script type="text/javascript"> 
		function optionSelect(f) {
				
				let option = document.getElementById("optionList").value
				let vi_value = document.getElementById("vi_value").value
				
				console.log(option)
				f.action = "category_page.do?option="+option+"&vi_value=" + vi_value;
				f.submit();
			}
	</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>
	<form method="post">
	<!-- 전체 틀 -->
	<div class="background">

		<!-- 소개 -->
		
			<div class="wrapper_top">
				<div class="wrapper_top_inner">
					<div class="wrapper_top_left">
						<span class="wrapper_top_category_id">${vi_value}</span> 
						<span class="wrapper_top_category_name"> 
						<select class="option_search" id="optionList" onchange="optionSelect(this.form)" name="option_select">
							<option disadbled selected>옵션을 선택해주세요</option>
							<option value="option1">조회순</option>
							<option value="option2">이름순(ㄱ)</option>
							<option value="option3">이름순(ㅎ)</option>
						</select> 
						</span>
					</div>
					<div class="wrapper_top_right"></div>
						
				</div>
			</div>
		
		<!-- DB에서 가져와서 c:foreach 반복문 돌릴 관광지 카테고리 보여주는 구간  -->
		<div class="wrapper_bottom">
			<div class="wrapper_left">
				<c:forEach var="k" items="${category_list}">
					<div class="category_box" onclick="toggleCollapse(this)" >
						<img src='${k.vi_image}' class="category_img">
						<p class="category_id">${k.vi_value}</p>
						<p class="category_title">${k.vi_title}</p>
						<p class="category_hits">조회수 : ${k.vi_hit}</p>

						<!-- 해당 카테고리에 관한 위도 / 경도 값 가져오기 -->
						<input type="hidden" value="${k.vi_latitude}" class="wdo">
						<input type="hidden" value="${k.vi_longitude}" class="gdo">
						<input type="hidden" value="${k.vi_title}" class="vt" id="vi_title"> 
						<input type="hidden" value="${k.vi_image}" class="vi"> 
						<input type="hidden" value="${k.vi_roadaddress}" class="va"> 
						<input type="hidden" value="${k.vi_phoneno}" class="vn"> 
						<input type="hidden" value="${k.contentsid}" class="contentsid">
						<input type="hidden" value="${k.vi_hit}" id="vi_hit">
						<input type="hidden" value="${k.vi_value}" id="vi_value">
					</div>
				</c:forEach>
			</div>
			<!-- 5c981699760a3bdf28409228b0baa4e5 -->
			<!-- 지도 -->
			<div class="wrapper_right">
				<div id="map" style="width: 40.9vw; height: 60.5vh;"></div>
				<div id="clickLatlng"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c981699760a3bdf28409228b0baa4e5"></script>
				<script>
				let markers = [];
					var mapContainer = document.getElementById('map'); // 지도를 표시할 div
					var mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성

					var marker = null; // 초기에는 마커를 null로 초기화

					function toggleCollapse(element) {
						element.classList.toggle("collapsed");

						var wdoValue = element.querySelector('.wdo').value;
						var gdoValue = element.querySelector('.gdo').value;
						var vt = element.querySelector('.vt').value;
						var vi = element.querySelector('.vi').value;
						var va = element.querySelector('.va').value;
						var vn = element.querySelector('.vn').value;
						var contentsid = element.querySelector('.contentsid').value;

						console.log("클릭된 요소의 wdo 값:", wdoValue);
						console.log("클릭된 요소의 gdo 값:", gdoValue);

						var latlng = new kakao.maps.LatLng(wdoValue, gdoValue);

						// 새로운 마커를 생성.
						marker = new kakao.maps.Marker({
							position : latlng
						// 마커의 위치를 설정
						});

						// 마커를 지도에 표시
						marker.setMap(map);

						// 마커를 중심으로 지도를 이동
						map.setCenter(latlng);

						var content = '<div class="wrap">'
								+ '    <div class="info">'
								+ '        <div class="title">'
								+ vt
								+ '            <div class="close" onclick="toggleWrapDisplay()" title="닫기"></div>'
								+ '        </div>'
								+ '        <div class="body">'
								+ '            <div class="img">'
								+ '				<img src="'
								+				vi
								+				'" class="img2">'
								+ '           </div>'
								+ '            <div class="desc">'
								+ '                <div class="ellipsis">'
								+ va
								+ '</div>'
								+ '                <div class="jibun ellipsis">전화번호 : '
								+ vn
								+ '</div>'
								+ '                <div><a href="'
								+ 'detail?contentsid='
								+ contentsid
								+ '"class="link">상세페이지</a></div>'
								+ '            </div>'
								+ '        </div>'
								+ '    </div>' + '</div>';
					
						// 마커 위에 커스텀오버레이를 표시합니다
						// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
						var overlay = new kakao.maps.CustomOverlay({
							content : content,
							map : map,
							position : marker.getPosition()
						});
					}
					
						// Close button element
						var closeBtn = overlay.getContent().querySelector(
								'.close');

						// Add click event listener to close button
						closeBtn.addEventListener('click', function() {
							closeOverlay(overlay);
						});
						
						// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
						kakao.maps.event.addListener(marker, 'click',
								function() {
									overlay.setMap(map);
								});

						// 커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
						function closeOverlay() {
							overlay.setMap(null);
							content = null;
						}
						

						// 마커 제거 함수(타이틀 기반)
						function marker_del(position) {
						    for (let i = 0; i < markers.length; i++) {
						        if (markers[i].getTitle() == position.title) {
						            markers[i].setMap(null);
						        }
						    }
						    for (let i = 0; i < infos.length; i++) {
						        console.log("info", infos[i].getPosition())
						        console.log("position", position.latlng)
						        console.log(infos[i].getPosition().equals(position.latlng))
						        if (infos[i].getPosition().equals(position.latlng)) {
						            infos[i].close();
						        }
						    }
						}
				</script>
			</div>
		</div>
		<div class="wrapper_footer">
			<!-- 페이징 시작.. -->
			<div class="footer_left">
				<tr>
					<td colspan="4">
						<ol class="paging">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${paging3.beginBlock <= paging3.pagePerBlock }">
									<li class="disable">&#8249;</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="category_page.do?cPage=${paging3.beginBlock - paging3.pagePerBlock }&vi_value=${vi_value}&option=${option}">&#8249;</a></li>
								</c:otherwise>
							</c:choose>

							<!-- 페이지번호들 -->
							<c:forEach begin="${paging3.beginBlock }"
								end="${paging3.endBlock }" step="1" var="k">
								<c:choose>
									<c:when test="${k == paging3.nowPage }">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="category_page.do?cPage=${k}&vi_value=${vi_value}&option=${option}">${k }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<!-- 이후 버튼 -->
							<c:choose>
								<c:when test="${paging3.endBlock >= paging3.totalPage }">
									<li class="disable">&#8250;</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="category_page.do?cPage=${paging3.beginBlock + paging3.pagePerBlock }&vi_value=${vi_value}&option=${option}">&#8250;</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</div>
			<div class="footer_right"></div>
		</div>

	</div>
	</form>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>