<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 여행(관리자)</title>
<link href="<c:url value="/resources/ygh-css/report_list.css"/>"
	rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 첫 번째 로드 시 저장된 탭 상태가 있는지 확인
	let tabState2 = sessionStorage.getItem('tabState2');
    if (tabState2 === 'show') {
        $("#report_t").show();
    } else {
        $("#report_t").hide();
    }
    
    $(".tab_bar2").click(function() {
    	location.href="report_list.do";
    	if ($("#report_t").css("display") == "none") {
    		$("#report_t").show();
    		// 탭 상태를 세션 스토리지에 저장
    		sessionStorage.setItem('tabState2', 'show');
		} else {
    		$("#report_t").hide();
    		sessionStorage.setItem('tabState2', 'hide');
		}
    });
});
</script>
</head>
<body>


		<div class="tab_bar2">신고</div>
		<div id="report_t">
			<table>
			<caption>신고()</caption>
				<thead>
					<tr class="title">
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
							<c:forEach var="k" items="${report_list}" varStatus="vs">
								<tr>
									<td>${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage + vs.index)}</td>
									<td style="text-align: left;">
									<c:forEach begin="1" end="${k.step}">&nbsp;[Re]</c:forEach> <c:choose>
											<c:when test="${k.report_active == 1}">
												<span style="color: lightgray;">삭제된 게시물입니다.</span>
											</c:when>
											<c:otherwise>
												<a
													href="report_detail.do?report_idx=${k.report_idx}&cPage=${paging.nowPage}">${k.report_title}</a>
											</c:otherwise>
										</c:choose></td>
									<td>${k.report_writer}</td>
									<td>${k.report_regdate.substring(0,10)}</td>
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
									<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
										<li class="disable">&#8249;</li>
									</c:when>
									<c:otherwise>
										<li><a
											href="report_list.do?cPage=${paging.beginBlock - paging.pagePerBlock}">&#8249;</a>
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
											<li><a href="report_list.do?cPage=${k}">${k}</a></li>
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
											href="report_list.do?cPage=${paging.beginBlock + paging.pagePerBlock}">&#8250;</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ol>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>


</body>
</html>