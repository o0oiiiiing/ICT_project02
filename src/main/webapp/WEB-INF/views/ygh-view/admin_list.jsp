<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>나의 여행(관리자)</title>
<!-- 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/admin_board.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/ygh-css/admin_report.css"/>" rel='stylesheet' />
<link href="<c:url value="/resources/ygh-css/admin_bar.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	// 첫 번째 로드 시 저장된 탭 상태가 있는지 확인
	let tabState = sessionStorage.getItem('tabState');
    if (tabState != 'show') {
        $("#board_t").show();
    } else {
        $("#board_t").hide();
    }
    
    $(".tab_bar").click(function() {
    	if ($("#board_t").css("display") == "none") {
    		$("#board_t").show();
    		// 탭 상태를 세션 스토리지에 저장
    		sessionStorage.setItem('tabState', 'show');
		} else {
    		$("#board_t").hide();
    		sessionStorage.setItem('tabState', 'hide');
		}
    });
   
});

$(document).ready(function() {
	// 첫 번째 로드 시 저장된 탭 상태가 있는지 확인
	let tabState2 = sessionStorage.getItem('tabState2');
    if (tabState2 != 'show') {
        $("#report_t").show();
    } else {
        $("#report_t").hide();
    }
    
    $(".tab_bar2").click(function() {
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

/* //a링크 postmapping 으로 변경
function admin_board_detail_go(bo_idx, cPage) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "admin_board_detail.do");

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
//a링크 postmapping 으로 변경
function admin_report_detail_go(report_idx, cPage2) {
    var form = document.createElement("form");
    form.setAttribute("method", "post");
    form.setAttribute("action", "admin_report_detail.do");

    var report_idxField = document.createElement("input");
    report_idxField.setAttribute("type", "hidden");
    report_idxField.setAttribute("name", "report_idx");
    report_idxField.setAttribute("value", report_idx);
    form.appendChild(report_idxField);

    var cPage2Field = document.createElement("input");
    cPage2Field.setAttribute("type", "hidden");
    cPage2Field.setAttribute("name", "cPage2");
    cPage2Field.setAttribute("value", cPage2);
    form.appendChild(cPage2Field);

    document.body.appendChild(form);
    form.submit();
} */

</script>
</head>
<body>

<%@include file="../common/header.jsp"%>

 	<div id="menubar">
		<h1>나의 여행(관리자)</h1>
		<table>
			<tr>
				<td><span class="material-symbols-outlined">finance</span><br><a href="dashboard.do">대시보드</a></td>
				<td><span class="material-symbols-outlined">manage_accounts</span><br><a href="user_list.do">회원관리</a></td>
				<td><span class="material-symbols-outlined">mark_chat_read</span><br><a href="admin_list2.do">답변</a></td>
				<td><span class="material-symbols-outlined">mark_chat_unread</span><br><a href="admin_list.do">미답변</a></td>
				<td><span class="material-symbols-outlined">calendar_add_on</span><br><a href="admin_insert">장소추가</a></td>
				<c:if test="${adminVO.a_status == '1'}">
					<td><span class="material-symbols-outlined">person_add</span><br><a href="admin_join.do">관리자 생성</a></td>
				</c:if>
			</tr>
		</table>
	</div>
	 
	
	<div id="inner_body">
		<aside class="side_bar js-side_bar">
			<ul>
				<li><span class="material-symbols-outlined">finance</span><a href="dashboard.do">대시보드</a></li>
				<li><span class="material-symbols-outlined">manage_accounts</span><a href="user_list.do">회원관리</a></li>
				<li><span class="material-symbols-outlined">mark_chat_read</span><a href="admin_list2.do">답변</a></li>
				<li><span class="material-symbols-outlined">mark_chat_unread</span><a href="admin_list.do">미답변</a></li>
				<li><span class="material-symbols-outlined">calendar_add_on</span><a href="admin_insert">장소추가</a></li>
				<c:if test="${adminVO.a_status == '1'}">
					<li><span class="material-symbols-outlined">person_add</span><a href="admin_join.do">관리자 생성</a></li>
				</c:if>
			</ul>
		</aside>
	</div>
	
	
	<div class="tab_bar">미답변 Q&A</div>
	<div id="board_t">
		<table>
			<caption>미답변 Q&A (${paging.totalRecord})</caption>
			
			<thead>
				<tr>
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">작성자</th>
					<th class="reg">작성일</th>
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
								<td>${paging.totalRecord - ((paging.nowPage -1) * paging.numPerPage2 + vs.index)}</td>
								<td style="text-align: left;">
									<c:forEach begin="1" end="${k.step}">&nbsp;[Re]</c:forEach>
									<a href="admin_board_detail.do?bo_idx=${k.bo_idx}&cPage=${paging.nowPage}">${k.bo_title}</a>
									<%-- <a href="#" onclick="admin_board_detail_go('${k.bo_idx}', '${paging.nowPage}')">${k.bo_title}</a> --%>
								</td>
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
										<a href="admin_list.do?cPage=${paging.beginBlock - paging.pagePerBlock}&cPage2=${paging2.nowPage2}">&#8249;</a>
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
										<li><a href="admin_list.do?cPage=${k}&cPage2=${paging2.nowPage2}">${k}</a></li>
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
										href="admin_list.do?cPage=${paging.beginBlock + paging.pagePerBlock}&cPage2=${paging2.nowPage2}">&#8250;</a>
									</li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	
	
	<div class="tab_bar2">미답변 신고</div>
		<div id="report_t">
			<table>
			<caption>미답변 신고 (${paging2.totalRecord})</caption>
				<thead>
					<tr>
						<th class="no">번호</th>
						<th class="subject">제목</th>
						<th class="writer">작성자</th>
						<th class="reg">작성일</th>
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
										<a href="admin_report_detail.do?report_idx=${k2.report_idx}&cPage2=${paging2.nowPage2}&re_idx=${k2.re_idx}">${k2.report_title}</a>
										<%-- <a href="#" onclick="admin_report_detail_go('${k2.report_idx}', '${paging2.nowPage2}')">${k2.report_title}</a> --%>
									</td>
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