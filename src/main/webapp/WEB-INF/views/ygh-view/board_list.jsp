<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Q&A | Jeju_travel</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/board_list.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function board_write_go() {
		location.href="board_write_go.do"
	}
	
	// a링크 postmapping 으로 변경
	function board_detail_go(bo_idx, cPage) {
	    var form = document.createElement("form");
	    form.setAttribute("method", "post");
	    form.setAttribute("action", "board_detail.do");
	
	    var bo_idxField = document.createElement("input");
	    bo_idxField.setAttribute("type", "hidden");
	    bo_idxField.setAttribute("name", "bo_idx");
	    bo_idxField.setAttribute("value", bo_idx);
	    form.appendChild(bo_idxField);
	
	    var cPageField = document.createElement("input");
	    cPageField.setAttribute("type", "hidden");
	    cPageField.setAttribute("name", "cPage");
	    cPageField.setAttribute("value", cPage);
	    form.appendChild(cPageField);
	
	    document.body.appendChild(form);
	    form.submit();
	}

</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<div id="board_t">
		<div id="board_h">
			<h1>Q&A 게시판</h1>
			<button onclick="board_write_go()">글쓰기</button>
		</div>
		<form method="post">
		<table>
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
					<c:when test="${empty board_list}">
						<tr>
							<td colspan="5"><h3>게시물이 존재하지 않습니다.</h3></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${board_list}" varStatus="vs">
							<tr>
								<td>${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage + vs.index)}</td>
								<td style="text-align: left;">
								<c:forEach begin="1" end="${k.step}">&nbsp;[Re]</c:forEach>
								 <c:choose>
										<c:when test="${k.active == 1}">
											<%-- <a href="board_detail.do?bo_idx=${k.bo_idx}&cPage=${paging.nowPage}">[답변완료] ${k.bo_title}</a> --%>
											 <a href="#" onclick="board_detail_go('${k.bo_idx}', '${paging.nowPage}')">[답변완료] ${k.bo_title}</a>
										</c:when>
										<c:otherwise>
											<%-- <a href="board_detail.do?bo_idx=${k.bo_idx}&cPage=${paging.nowPage}">${k.bo_title}</a> --%>
											<a href="#" onclick="board_detail_go('${k.bo_idx}', '${paging.nowPage}')">${k.bo_title}</a>
									</c:otherwise></c:choose></td>
								<td>${k.bo_writer}</td>
								<td>${k.bo_regdate.substring(0,10)}</td>
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
									<li>
										<a href="board_list.do?cPage=${paging.beginBlock - paging.pagePerBlock}">&#8249;</a>
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
										<li><a href="board_list.do?cPage=${k}">${k}</a></li>
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
										href="board_list.do?cPage=${paging.beginBlock + paging.pagePerBlock}">&#8250;</a>
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