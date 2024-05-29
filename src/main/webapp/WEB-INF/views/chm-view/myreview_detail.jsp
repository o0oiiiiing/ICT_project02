<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 리뷰</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<!-- summer note -->
<link href="<c:url value='/resources/common-css/summernote-lite.css'/>" rel='stylesheet' />
<link href="<c:url value='/resources/chm-css/myreview_detail.css'/>" rel='stylesheet' />
<script type="text/javascript">

	function myreview_delete(re_idx) {
		
		var result = confirm("정말 삭제하시겠습니까?");
		if (result) {
			alert("리뷰가 삭제되었습니다.");
			location.href = "myreview_delete.do?re_idx=" + re_idx;
		} else {
			alert("리뷰삭제가 취소되었습니다.");
		}
	}
	
	document.addEventListener('DOMContentLoaded', () => {
	    let currentImageIndex = 0;
	    const images = document.querySelectorAll('.buttom_image img');
	    const totalImages = images.length;

	    if (totalImages > 0) {
	        images[currentImageIndex].style.display = 'block';
	    }

	    document.getElementById('next').addEventListener('click', () => {
	        images[currentImageIndex].style.display = 'none';
	        currentImageIndex = (currentImageIndex + 1) % totalImages;
	        images[currentImageIndex].style.display = 'block';
	    });

	    document.getElementById('prev').addEventListener('click', () => {
	        images[currentImageIndex].style.display = 'none';
	        currentImageIndex = (currentImageIndex - 1 + totalImages) % totalImages;
	        images[currentImageIndex].style.display = 'block';
	    });
	});

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
<form method="post">
	<div class="wrapper">
		<div class="wrapper_head">
			<div style="font-family: 'GmarketSansMedium';"><span class="user">${reviewDetail.u_name}</span>님이 작성하신 리뷰</div>
		</div>
		<div class="wrapper_buttom">	
			<div class="buttom_image">
				<c:choose>
					<c:when test="${empty review_image}">
						<div class="no_image_box">등록하신 이미지가 없습니다.</div>
					</c:when>
					<c:otherwise>	
						<c:choose>
							<c:when test="${fn:length(review_image) > 1}">
								<div class="image_button_box">
									<input type="button" value="<" style="width: 2vw; height: 3vh;" id="prev">
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
						<c:forEach var="k" items="${review_image}">
							<img src="resources/upload/${k.pic_file}" style="width: 26vw; height: 42vh; display: none;">
						</c:forEach>
						<c:choose>
							<c:when test="${fn:length(review_image) > 1}">
								<div class="image_button_box">
									<input type="button" value=">" style="width: 2vw; height: 3vh;" id="next">
								</div>
							</c:when>
							<c:otherwise>
							</c:otherwise>
						</c:choose>
					</c:otherwise>	
				</c:choose>
			</div>
			<div class="buttom_comment">
				<span class="buttom_title"><a href="detail?contentsid=${reviewDetail.contentsid}" style="color: inherit; text-decoration: none;">${title}</a></span>
				<c:choose>
					<c:when test="${reviewDetail.re_grade == 1}">
						<span class="buttom_star">별점 : <span style="color: #FFDF6B;" class="star">★</span><span style="color: #f0f0f0;" class="star">★★★★</span></span>
					</c:when>
					<c:when test="${reviewDetail.re_grade == 2}">
						<span class="buttom_star">별점 : <span style="color: #FFDF6B;" class="star">★★</span><span style="color: #f0f0f0;" class="star">★★★</span></span>
					</c:when>
					<c:when test="${reviewDetail.re_grade == 3}">
						<span class="buttom_star">별점 : <span style="color: #FFDF6B;" class="star">★★★</span><span style="color: #f0f0f0;" class="star">★★</span></span>
					</c:when>
					<c:when test="${reviewDetail.re_grade == 4}">
						<span class="buttom_star">별점 : <span style="color: #FFDF6B;" class="star">★★★★</span><span style="color: #f0f0f0;" class="star">★</span></span>
					</c:when>
					<c:otherwise>
						<span class="buttom_star">별점 : <span style="color: #FFDF6B;">★★★★★</span></span>
					</c:otherwise>
				</c:choose>
			</div>
			<div class="buttom_content">
				<div style="font-family: 'NanumSquare'; font-size: 18px; font-weight: bold;">${reviewDetail.re_content}</div>
			</div>
		</div>
		<div class="wrapper_footer">
			<div class="footer_day">작성 날짜 : ${reviewDetail.re_regdate.substring(0,10)}</div>
		</div>
	</div>
	<div id="myreview_delete">
		<input type="hidden" value="${cPage}" name="cPage">
		<input type="button" value="삭제" style="width: 100px; height: 40px; font-weight: bold; font-size: 16px; font-family: 'GmarketSansMedium';" 
		onclick="myreview_delete(${reviewDetail.re_idx})" />
	</div>
</form>
<%@include file="../common/footer.jsp"%>
</body>
</html>