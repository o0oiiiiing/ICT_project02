<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내가 쓴 리뷰</title>
<link href="<c:url value="/resources/ygh-css/board_list.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">

document.addEventListener("DOMContentLoaded", function() {
    var starElements = document.querySelectorAll('.re_grade');
    var gradeStarElements = document.querySelectorAll('.grade_star');

    starElements.forEach(function(starElement, index) {
        var star = starElement.value;
        if (star == "1") {
            gradeStarElements[index].innerText = "★☆☆☆☆";
        } else if (star == "2") {
            gradeStarElements[index].innerText = "★★☆☆☆";
        } else if (star == "3") {
            gradeStarElements[index].innerText = "★★★☆☆";
        } else if (star == "4") {
            gradeStarElements[index].innerText = "★★★★☆";
        } else if (star == "5") {
            gradeStarElements[index].innerText = "★★★★★";
        }
    });
});
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<div id="board_t">
		<div id="board_h">
			<h1>내가 쓴 리뷰</h1>
		</div>
		<form method="post">
		<table>
			<thead>
				<tr>
					<th class="no">번호</th>
					<th class="subject">카테고리</th>
					<th class="writer">리뷰 제목</th>
					<th class="reg">날짜</th>
					<th class="grade">별점</th>
					
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty myreview_list}">
						<tr>
							<td colspan="6"><h3>내가 작성한 리뷰가 존재하지 않습니다.</h3></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${myreview_list}" varStatus="vs">
							<tr>
								<td>${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage + vs.index)}</td>
								<td>${k.contentsid}</td>
								<td>${k.re_content}</td>
								<td>${k.re_regdate.substring(0,10)}</td>
								<td class="grade_star">${k.re_grade}</td>
							</tr>
							<input type="hidden" value="${k.re_grade}" class="re_grade">
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
									<li class="disable">&#8249;</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="admin_board_list.do?cPage=${paging.beginBlock - paging.pagePerBlock}">&#8249;</a>
									</li>
								</c:otherwise>
							</c:choose>

							<!-- 페이지번호들 -->
							<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}"
								step="1" var="k">
								<c:choose>
									<c:when test="${k == paging.nowPage}">
										<li class="now">${k}</li>
									</c:when>
									<c:otherwise>
										<li><a href="admin_board_list.do?cPage=${k}">${k}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<!-- 이후 버튼 -->
							<c:choose>
								<c:when test="${paging.endBlock >= paging.totalPage}">
									<li class="disable">&#8250;</li>
								</c:when>
								<c:otherwise>
									<li><a
										href="admin_board_list.do?cPage=${paging.beginBlock + paging.pagePerBlock}">&#8250;</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</tfoot>
		</table>
		</form>
	</div>
	
<%@include file="../common/footer.jsp"%>	
</body>
</html>