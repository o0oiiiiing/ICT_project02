<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MY REVIEW | Jeju_travel</title>
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/chm-css/myreview_list.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<div class="myreview_box">
	<div id="board_t">
		<div id="board_h">
			<c:forEach var="k" items="${review_count}" varStatus="vs">
			<h1>내가 쓴 리뷰</h1><span> 총 :&nbsp<mark>${k.review_count}</mark> 건</span>
			</c:forEach>
		</div>
		<input type="hidden" value="${vi_value}" id="v_title" class="v_value">
		<form method="post">
		<table>
			<thead>
				<tr class="table_head">
					<th class="subject">카테고리</th>
					<th class="writer">리뷰 내용</th>
					<th class="reg">날짜</th>
					<th class="grade">별점</th>				
			</tr>
			</thead>
			<tbody class="table_body">
				<c:choose>
					<c:when test="${empty myreview_list}">
						<tr>
							<td colspan="6"><h3>내가 작성한 리뷰가 존재하지 않습니다.</h3></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${myreview_list}" varStatus="vs">
							<tr>
								<td>${k.vi_title}</td>
								<c:choose>
    								<c:when test="${fn:length(k.re_content) >= 8}">
    									<td><a href="myreview_detail.do?&re_idx=${k.re_idx}"><span>${k.re_content.substring(0, 8)}...</span></a></td>
    								</c:when>
								    <c:otherwise>
								        <td><a href="myreview_detail.do?&re_idx=${k.re_idx}">${k.re_content}</a></td>
								    </c:otherwise>
								</c:choose>
								<td>${k.re_regdate.substring(0,10)}</td>
								<c:choose>
									<c:when test="${k.re_grade == 1}">
										<td>
										<span style="color: #FFDF6B;" class="star">★</span><span style="color: #f0f0f0;" class="star">★★★★</span>
										</td>
									</c:when>
									<c:when test="${k.re_grade == 2}">
										<td>
										<span style="color: #FFDF6B;" class="star">★★</span><span style="color: #f0f0f0;" class="star">★★★</span>
										</td>
									</c:when>
									<c:when test="${k.re_grade == 3}">
										<td>
										<span style="color: #FFDF6B;" class="star">★★★</span><span style="color: #f0f0f0;" class="star">★★</span>
										</td>
									</c:when>
									<c:when test="${k.re_grade == 4}">
										<td>
										<span style="color: #FFDF6B;" class="star">★★★★</span><span style="color: #f0f0f0;" class="star">★</span>
										</td>
									</c:when>
									<c:otherwise>
										<td><span style="color: #FFDF6B;">★★★★★</span></td>
									</c:otherwise>
								</c:choose>
							</tr>
							<input type="hidden" value="${k.re_grade}" class="re_grade">
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot class="table_foot">
				<tr>
					<td colspan="5" >
						<ol class="paging" style="margin-top:3vh;">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
									<li class="disable">&#8249;</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="myreview_list.do?cPage=${paging.beginBlock - paging.pagePerBlock}">&#8249;</a>
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
										<li><a href="myreview_list.do?cPage=${k}">${k}</a></li>
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
										href="myreview_list.do?cPage=${paging.beginBlock + paging.pagePerBlock}">&#8250;</a>
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
	</div>
	
<%@include file="../common/footer.jsp"%>	
</body>
</html>