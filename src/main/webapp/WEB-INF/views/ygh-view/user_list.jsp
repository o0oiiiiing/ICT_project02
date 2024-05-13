<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원관리</title>
<link href="<c:url value="/resources/ygh-css/user_list.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	function user_del() {
		f.action="user_del.do"
		
	}
	
	document.addEventListener('DOMContentLoaded', function() {
	    let writeButtons = document.querySelectorAll('.write_button');
	    let delWrite = document.getElementById('del_write');

	    // 초기에 qaWriteDiv 요소를 숨김
	    delWrite.style.display = 'none';

	    // 모든 버튼에 대해 이벤트를 설정
	    writeButtons.forEach(function(writeButton) {
	        writeButton.addEventListener('click', function(event) {
	            // 요소의 display를 토글
	            if (delWrite.style.display === 'block') {
	            	delWrite.style.display = 'none';
	            } else {
	            	delWrite.style.display = 'block';
	            }
	            event.preventDefault(); // 기본 동작 취소
	        });
	    });
	});
	
	
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<div id="user_t">
		<div id="user_h">
			<h1>회원관리</h1>
		</div>
		<form method="post">
		<table>
			<thead>
				<tr>
					<th class="name">회원이름</th>
					<th class="id">회원아이디</th>
					<th class="email">회원E-mail</th>
					<th class="reg">가입일</th>
					<th class="report">신고누적</th>
					<th class="del">계정삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty user_list}">
						<tr>
							<td colspan="5"><h3>회원이 존재하지 않습니다.</h3></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="k" items="${user_list}" varStatus="vs">
							<tr>
								<td>${k.u_name}</td>
								<td>${k.u_id}</td>
								<td>${k.u_email}</td>
								<td>${k.u_regdate.substring(0,10)}</td>
								<td>${k.u_report}</td>
								<td><button class="write_button" >계정삭제</button></td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="6">
						<ol class="paging">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
									<li class="disable">&#8249;</li>
								</c:when>
								<c:otherwise>
									<li>
										<a href="user_list.do?cPage=${paging.beginBlock - paging.pagePerBlock}">&#8249;</a>
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
										<li><a href="user_list.do?cPage=${k}">${k}</a></li>
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
										href="user_list.do?cPage=${paging.beginBlock + paging.pagePerBlock}">&#8250;</a>
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
	
	<form id="del_write" method="post" action="detail">
		<div class="del_container">
			<div class="del_content">
				<table style="margin: auto;">
					<tbody>
						<tr>
							<td style="width: 30%">사유</td>
							<td>
								<input type="text" name="bo_title" required size="40">
							</td>
						</tr>
						<tr>
							<td style="width: 30%">비밀번호</td>
							<td>
							<input type="password" name="bo_pwd" id="passwordInput" required size="40">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="del_buttons">
				<input type="hidden" value="${userVO.u_idx}" name="u_idx"> 
				<input class="del_button" type="reset" value="취소">
				<button type="button" class="del_button"
					onclick="test(this.form)">등록</button>
			</div>
		</div>
	</form>
	
<%@include file="../common/footer.jsp"%>	
</body>
</html>