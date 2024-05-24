<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="<c:url value="/resources/common-css/summernote-lite.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/chm-css/myreview_detail.css"/>" rel='stylesheet' />
<script type="text/javascript">

	function board_delete(f) {
		f.action="myreview_delete.do";
		f.submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<form method="post">
		<div class="wrapper">
			<div class="wrapper_head">
				<div><span class="user">${reviewDetail.u_name}</span>님이 작성하신 리뷰</div>
			</div>
			<div class="wrapper_buttom">
				<div class="buttom_image"><img src="/resources/upload/${image}" style="width: 500px; height: 460px;"></div>
				<div class="buttom_comment">
					<span class="buttom_title"><a href="detail?contentsid=${contentsid}">${title}</a></span>
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
					<div>${reviewDetail.re_content}</div>
				</div>
			</div>
			<div class="wrapper_footer">
				<div class="footer_day">${reviewDetail.re_regdate.substring(0,10)}</div>
			</div>
		</div>
	</form>
<%@include file="../common/footer.jsp"%>
</body>
</html>