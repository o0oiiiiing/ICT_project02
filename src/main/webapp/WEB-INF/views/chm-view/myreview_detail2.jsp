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
<link href="<c:url value="/resources/chm-css/myreview_detail2.css"/>" rel='stylesheet' />
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
		<div id="board_detail">
			<table>
				<caption>내가 쓴 리뷰</caption>
				<tbody>
					<tr>
					
						<th>카테고리</th>
						<td>${title}</td>
					</tr>
					
					<tr>
						<th>작성자</th>
						<td>${reviewDetail.u_name}</td>
					</tr>
	
					<tr>
						<th>날짜</th>
						<td>${reviewDetail.re_regdate.substring(0,10)}</td>
					</tr>
					
					<tr>
						<th>이미지</th>
						<td><img src="/resources/upload/${image}"></td>
					</tr>
					<tr>
						<th>별점</th>
						<c:choose>
							<c:when test="${reviewDetail.re_grade == 1}">
								<td><span style="color: #FFDF6B;" class="star">★</span><span style="color: #f0f0f0;" class="star">★★★★</span></td>
							</c:when>
							<c:when test="${reviewDetail.re_grade == 2}">
								<td><span style="color: #FFDF6B;" class="star">★★</span><span style="color: #f0f0f0;" class="star">★★★</span></td>
							</c:when>
							<c:when test="${reviewDetail.re_grade == 3}">
								<td><span style="color: #FFDF6B;" class="star">★★★</span><span style="color: #f0f0f0;" class="star">★★</span></td>
							</c:when>
							<c:when test="${reviewDetail.re_grade == 4}">
								<td><span style="color: #FFDF6B;" class="star">★★★★</span><span style="color: #f0f0f0;" class="star">★</span></td>
							</c:when>
							<c:otherwise>
								<td><span style="color: #FFDF6B;">★★★★★</span></td>
							</c:otherwise>
						</c:choose>
					</tr>
					
					<tr>
						<th>내용</th>
						<td>
							<textarea rows="10" cols="60" id="bo_content" name="bo_content" readonly style="margin: 5px;">${reviewDetail.re_content}</textarea>
						</td>
					</tr>
					
				</tbody>
			</table>
			</div>
			<c:choose>
				<c:when test="${bovo.active eq 0}">
					<div id="board_detail_btn">
						<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
						<input type="hidden" value="${cPage}" name="cPage">  
						<input type="button" value="삭제" onclick="myreview_delete(this.form)" />
					</div>
				</c:when>
				<c:otherwise>
					<div id="board_detail_btn">
						<input type="hidden" value="${bovo.bo_idx}" name="bo_idx"> 
						<input type="hidden" value="${cPage}" name="cPage"> 
						<input type="button" value="삭제" onclick="myreview_delete(this.form)" />
					</div>
				</c:otherwise>
			</c:choose>
	</form>
<%@include file="../common/footer.jsp"%>
</body>
</html>