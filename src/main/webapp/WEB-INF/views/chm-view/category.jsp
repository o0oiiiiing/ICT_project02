<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<link rel="stylesheet" href="resources/chm-css/category.css?after">
<link rel="stylesheet" href="resources/common-css/reset.css?after">
<script type="text/javascript"
	src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fwqqugcxzu"></script>
<script type="text/javascript">
	
</script>
</head>
<body>

	<%@include file="../common/header.jsp"%>

	<!-- 전체 틀 -->
	<div class="background">

		<!-- 소개 -->
		<div class="wrapper_top">
			<div class="wrapper_top_inner">
				<div class="wrapper_top_category_id">${vi_value}</div>
				<div class="wrapper_top_category_name">
					이름순<span id="">↓</span>
				</div>
			</div>
		</div>
		<!-- DB에서 가져와서 c:foreach 반복문 돌릴 관광지 카테고리 보여주는 구간  -->
		<div class="wrapper_bottom">
			<div class="wrapper_left">
				<c:forEach var="k" items="${category_list}">
					<div class="category_box" onclick="toggleCollapse(this)">
						<img src='${k.vi_image}' class="category_img">
						<p class="category_id">${k.vi_value}</p>
						<p class="category_title">${k.vi_title}</p>
						<p class="category_hits">조회수 : 30</p>

						<!-- 해당 카테고리에 관한 위도 / 경도 값 가져오기 -->
						<input type="hidden" value="${k.vi_latitude}" class="wdo">
						<input type="hidden" value="${k.vi_longitude}" class="gdo">
					</div>
				</c:forEach>
			</div>
			<!-- 5c981699760a3bdf28409228b0baa4e5 -->
			<!-- 지도 -->
			<div class="wrapper_right">
				<div id="map" style="width: 850px; height: 880px;"></div>
				<p>
					<em>지도를 클릭해주세요!</em>
				</p>
				<div id="clickLatlng"></div>

				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c981699760a3bdf28409228b0baa4e5"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
						level : 3
					// 지도의 확대 레벨
					};

					var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

					// 지도를 클릭한 위치에 표출할 마커입니다
					var marker = new kakao.maps.Marker({
						// 지도 중심좌표에 마커를 생성합니다 
						position : new kakao.maps.LatLng(33.450701, 126.570667)
					});

					// 지도에 마커를 표시합니다
					marker.setMap(map);

					function toggleCollapse(element) {
						console.log("1")
						console.log(element)
						element.classList.toggle("collapsed");

						var wdoValue = element.querySelector('.wdo').value;
						var gdoValue = element.querySelector('.gdo').value;

						console.log("클릭된 요소의 wdo 값:", wdoValue);
						console.log("클릭된 요소의 gdo 값:", gdoValue);

						var latlng = new kakao.maps.LatLng(wdoValue, gdoValue);
						var marker = new kakao.maps.Marker({
							// 지도 중심좌표에 마커를 생성합니다 
							position : latlng

						});

						// 지도에 마커를 표시합니다
						marker.setMap(map);
						map.setCenter(latlng)
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
										href="category_page.do?cPage=${paging3.beginBlock - paging3.pagePerBlock }&vi_value=${vi_value}">&#8249;</a></li>
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
											href="category_page.do?cPage=${k}&vi_value=${vi_value}">${k }</a></li>
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
										href="category_page.do?cPage=${paging3.beginBlock + paging3.pagePerBlock }&vi_value=${vi_value}">&#8250;</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</div>
			<div class="footer_right"></div>
		</div>

	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>