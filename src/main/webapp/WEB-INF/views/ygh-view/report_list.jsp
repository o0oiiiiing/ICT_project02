<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A 게시판</title>
<link href="<c:url value="/resources/ygh-css/report_list.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function board_write_go() {
		location.href="board_write_go.do"
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<div class="tab_bar2">신고</div>
		<div id="report_t">
			<table>
			<caption>신고()</caption>
				<thead>
					<tr>
						<th class="no">번호</th>
						<th class="subject">제목</th>
						<th class="writer">글쓴이</th>
						<th class="reg">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty report_list}">
							<tr>
								<td colspan="5"><h3>게시물이 존재하지 않습니다.</h3></td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k2" items="${report_list}" varStatus="vs">
								<tr>
									<td>${paging2.totalRecord - ((paging2.nowPage2 -1) * paging2.numPerPage2 + vs.index)}</td>
									<td style="text-align: left;">
									<c:forEach begin="1" end="${k2.step}">&nbsp;[Re]</c:forEach> 
										<c:choose>
											<c:when test="${k2.report_active == 1}">
												<span style="color: lightgray;">삭제된 게시물입니다.</span>
											</c:when>
											<c:otherwise>
												<a href="report_detail.do?report_idx=${k2.report_idx}&cPage2=${paging2.nowPage2}">${k2.report_title}</a>
											</c:otherwise>
										</c:choose></td>
									<td>${k2.report_writer}</td>
									<td>${k2.report_regdate.substring(0,10)}</td>
								</tr>
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
									<c:when test="${paging2.beginBlock <= paging2.pagePerBlock}">
										<li class="disable">&#8249;</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="admin_list.do?cPage2=${paging2.beginBlock - paging2.pagePerBlock}&cPage=${paging.nowPage}">&#8249;</a>
										</li>
									</c:otherwise>
								</c:choose>

								<!-- 페이지번호들 -->
								<c:forEach begin="${paging2.beginBlock}" end="${paging2.endBlock}"
									step="1" var="k2">
									<c:choose>
										<c:when test="${k2 == paging2.nowPage2}">
											<li class="now">${k2}</li>
										</c:when>
										<c:otherwise>
											<li><a href="admin_list.do?cPage2=${k2}&cPage=${paging.nowPage}">${k2}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>

								<!-- 이후 버튼 -->
								<c:choose>
									<c:when test="${paging2.endBlock >= paging2.totalPage}">
										<li class="disable">&#8250;</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="admin_list.do?cPage2=${paging2.beginBlock + paging2.pagePerBlock}&cPage=${paging.nowPage}">&#8250;</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ol>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	
<%@include file="../common/footer.jsp"%>	
</body>
</html>