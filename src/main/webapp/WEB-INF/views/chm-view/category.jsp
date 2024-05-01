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
					</div>
				</c:forEach>
			</div>

			<!-- 지도 -->
			<div class="wrapper_right">
				<div id="map" style="width: 850px; height: 880px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5c981699760a3bdf28409228b0baa4e5"></script>
				<script>
					var mapContainer = document.getElementById('map'),
					mapOption = {
						center : new kakao.maps.LatLng(33.450701, 126.570667), 
						level : 3
					
					};

					var map = new kakao.maps.Map(mapContainer, mapOption);
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
										<li><a href="category_page.do?cPage=${paging3.beginBlock - paging3.pagePerBlock }&vi_value=${vi_value}">&#8249;</a></li>
									</c:otherwise>
								</c:choose>
							
								<!-- 페이지번호들 -->
								<c:forEach begin="${paging3.beginBlock }" end="${paging3.endBlock }" step="1" var="k">
									<c:choose>
										<c:when test="${k == paging3.nowPage }">
											<li class="now">${k}</li>
										</c:when>
										<c:otherwise>
											<li><a href="category_page.do?cPage=${k}&vi_value=${vi_value}">${k }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							
								<!-- 이후 버튼 -->
									<c:choose>
									<c:when test="${paging3.endBlock >= paging3.totalPage }">
										<li class="disable">&#8250;</li>
									</c:when>
									<c:otherwise>
										<li><a href="category_page.do?cPage=${paging3.beginBlock + paging3.pagePerBlock }&vi_value=${vi_value}">&#8250;</a></li>
									</c:otherwise>
								</c:choose>
							</ol>	
						</td>
					</tr>
				</div>
				<div class="footer_right">
					
				</div>
			</div>
		
	</div>
	<%@ include file="../common/footer.jsp"%>
</body>
</html>