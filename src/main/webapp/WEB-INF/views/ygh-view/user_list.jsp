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
	/* $(document).ready(function() {
		let pwdchk = "${pwdchk}";
		if (pwdchk == 'fail') {
			alert("비밀번호 틀림");
			return;
		}
	}); */
/* 	$(document).ready(function() {
		let del = "${del}";
		if (del == 'ok') {
			alert("해당 회원 계정을 삭제했습니다.");
			return;
		}
	}); */
</script>
<script type="text/javascript">
	let msg = "${msg}";
	if (msg !== "") {
	    alert(msg);
	}
	
	// 계정 삭제
 	function user_del_ok(f) {
		console.log(f.a_pwd.value);
		f.action="user_del_ok.do"
		f.submit();
	} 
	// 계정 복구
 	function user_restore_ok(f) {
		f.action="user_restore_ok.do"
		f.submit();
	} 
	
	// 계정 삭제 토글
 	document.addEventListener('DOMContentLoaded', function() {
 	    let writeButtons = document.querySelectorAll('.write_button');
 	    let delWrite = document.getElementById('del_write');

 	    // 초기에 del_write 요소를 숨김
 	    delWrite.style.display = 'none';

 	    // 계정 삭제 버튼에 대한 이벤트 설정
 	    writeButtons.forEach(function(writeButton) {
 	        writeButton.addEventListener('click', function(event) {
 	            // 해당 버튼이 속한 행의 u_idx 값을 가져오기
 	            let u_idx = this.parentNode.parentNode.querySelector('.u_idx').value;

 	            // del_write 폼에 u_idx 값 설정
 	            delWrite.querySelector('input[name="u_idx"]').value = u_idx;

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
 	
	// 계정 복구 토글
 	document.addEventListener('DOMContentLoaded', function() {
 	    let restoreButtons = document.querySelectorAll('.restore_button');
 	    let restoreWrite = document.getElementById('restore_write');

 	    // 초기에 restore_write 요소를 숨김
 	    restoreWrite.style.display = 'none';

 	    // 계정 복구 버튼에 대한 이벤트 설정
 	    restoreButtons.forEach(function(restoreButton) {
 	        restoreButton.addEventListener('click', function(event) {
 	            // 해당 버튼이 속한 행의 u_idx 값을 가져오기
 	            let u_idx = this.parentNode.parentNode.querySelector('.u_idx').value;

 	            // restore_write 폼에 u_idx 값 설정
 	            restoreWrite.querySelector('input[name="u_idx"]').value = u_idx;

 	            // 요소의 display를 토글
 	            if (restoreWrite.style.display === 'block') {
 	                restoreWrite.style.display = 'none';
 	            } else {
 	                restoreWrite.style.display = 'block';
 	            }
 	            event.preventDefault(); // 기본 동작 취소
 	        });
 	    });
 	});
	
	
 // 회원정보 토글
 	
/* 	
 	document.addEventListener('DOMContentLoaded', function() {
 	    let userButtons = document.querySelectorAll('.user_button');
 	    let userDetail = document.getElementById('user_detail');

 	    // 초기에 user_detail 요소를 숨김
 	    userDetail.style.display = 'none';

 	    // 상세정보 버튼에 대한 이벤트 설정
 	    userButtons.forEach(function(userButton) {
 	        userButton.addEventListener('click', function(event) {
 	            // 해당 버튼이 속한 행의 u_idx 값을 가져오기
 	            let u_idx = this.parentNode.parentNode.querySelector('.u_idx').value;

 	            // user_detail 폼에 u_idx 값 설정
 	            userDetail.querySelector('input[name="u_idx"]').value = u_idx;

 	            // 요소의 display를 토글
 	            if (userDetail.style.display === 'block') {
 	                userDetail.style.display = 'none';
 	            } else {
 	                userDetail.style.display = 'block';
 	            }
 	            event.preventDefault(); // 기본 동작 취소
 	        });
 	    });

 	    // 닫기 버튼에 대한 이벤트 설정
 	    let closeButton = userDetail.querySelector('.user_button');
 	    closeButton.addEventListener('click', function(event) {
 	        userDetail.style.display = 'none';
 	        event.preventDefault();
 	    });
 	}); */
 	
 	
	
  	function showUserDetail(u_idx) {
		location.href="user_detail.do?u_idx="+u_idx;
 	}  
 	
 	
/*  	function showUserDetail(u_idx) {
 	    // AJAX를 이용하여 페이지 새로고침 없이 데이터를 가져옴
 	    var xhttp = new XMLHttpRequest();
 	    xhttp.onreadystatechange = function() {
 	        if (this.readyState == 4 && this.status == 200) {
 	            // 요청이 완료되면, 받은 데이터를 처리함
 	            // 예를 들어 받은 데이터를 사용하여 모달 창에 정보를 보여줄 수 있음
 	            // 이 예제에서는 console.log를 사용하여 받은 데이터를 출력함
 	            console.log(this.responseText);
 	        }
 	    };
 	    // 요청 보냄
 	    xhttp.open("GET", "user_detail.do?u_idx="+u_idx, true);
 	    xhttp.send();
 	} */
	
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	
	<div id="user_t">
		<div id="user_h">
			<h1>회원관리 ${uvo} </h1>
		</div>
		<div>
		<table>
			<thead>
				<tr>
					<th class="name">회원이름</th>
					<th class="id">회원아이디</th>
					<th class="email">회원E-mail</th>
					<th class="reg">가입일</th>
					<th class="reg">탈퇴일</th>
					<th class="report">신고누적</th>
					<th class="del">상세정보</th>
					<th class="del">계정</th>
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
								<c:set var="activeRow" value="${k.active == 1 ? 'active-row' : ''}" />
								<td class="${activeRow}">${k.u_name}</td>
								<td class="${activeRow}">${k.u_id}</td>
								<td class="${activeRow}">${k.u_email}</td>
								<td class="${activeRow}">${k.u_regdate.substring(0,10)}</td>
								<td class="${activeRow}">${k.out_regdate.substring(0,10)}</td>
								<td class="${activeRow}">${k.u_report}</td>
								<td class="${activeRow}"><button class="user_button" onclick="showUserDetail(${k.u_idx})" >상세정보</button></td>
								<td>
									<c:forEach begin="1" end="${k.step}">&nbsp;[Re]</c:forEach> 
									<c:choose>
										<c:when test="${k.active == 1}">
											<input type="hidden" class="u_idx" value="${k.u_idx}">
											<button class="restore_button" >계정복구</button>
										</c:when>
										<c:otherwise>
											<input type="hidden" class="u_idx" value="${k.u_idx}">
											<button class="write_button" >계정삭제</button>
										</c:otherwise>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8">
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
							<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
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
		</div>
	</div>
	
	<!-- 계정삭제 -->
	<form  method="post">
	<div id="del_write">
		<div class="del_container">
			<div class="del_content">
				<table style="margin: auto;">
					<tbody>
						<tr>
							<td style="width: 30%">사유</td>
							<td>
								<input type="text" name="u_del" required size="40">
							</td>
						</tr>
						<tr>
							<td style="width: 30%">비밀번호</td>
							<td>
							<input type="password" name="a_pwd" id="passwordInput" required size="40">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="del_buttons">
				<input type="hidden" value="${k.u_idx}" name="u_idx"> 
				<input type="hidden" value="${adminVO.a_idx}" name="a_idx"> 
				<input type="hidden" value="${paging.nowPage}" name="cPage"> 
				<input class="del_button" type="reset" value="취소">
				<button class="del_button" onclick="user_del_ok(this.form)">삭제</button>
			</div>
		</div>
		</div>
		</form>
		
	<form  method="post">
	<!-- 계정복구 -->
	 <div id="restore_write">
		<div class="restore_container">
			<div class="restore_content">
				<table style="margin: auto;">
					<tbody>
						<tr>
							<td style="width: 30%">사유</td>
							<td>
								<input type="text" name="u_restore" required size="40">
							</td>
						</tr>
						<tr>
							<td style="width: 30%">비밀번호</td>
							<td>
							<input type="password" name="a_pwd" id="passwordInput" required size="40">
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="restore_buttons">
				<input type="hidden" value="${k.u_idx}" name="u_idx"> 
				<input type="hidden" value="${adminVO.a_idx}" name="a_idx"> 
				<input type="hidden" value="${paging.nowPage}" name="cPage"> 
				<input class="restore_button2" type="reset" value="취소">
				<button class="restore_button2" onclick="user_restore_ok(this.form)">복구</button>
			</div>
		</div>
		</div>
	</form>
	
	<!-- 회원 상세 -->
	<%-- 
	 <div id="user_detail">
		<div class="user_container">
			<div class="user_content">
				<table style="margin: auto;">
				<caption>회원정보</caption>
					<tbody>
						<tr><td style="width: 40%">아이디</td><td>${uvo.u_id}</td></tr>
						<tr><td>이름</td><td>${uvo.u_name}</td></tr>
						<tr><td>생년월일</td><td>${uvo.u_birth}</td></tr>
						<tr><td>이메일</td><td>${uvo.u_email}</td></tr>
						<tr><td>전화번호</td><td>${uvo.u_phone}</td></tr>
						<tr><td>우편번호</td><td>${uvo.u_postcode}</td></tr>
						<tr><td>주소</td><td>${uvo.u_addr}</td></tr>
						<tr><td>상세주소</td><td>${uvo.u_detail_addr}</td></tr>
						<tr><td>상세주소2</td><td>${uvo.u_detail_addr2}</td></tr>
						<tr><td>성별</td><td>${uvo.u_gender}</td></tr>
						<tr><td>신고누적</td><td>${uvo.u_report}</td></tr>
						<tr><td>가입일</td><td>${uvo.u_regdate.substring(0,10)}</td></tr>
						<tr><td>탈퇴일</td><td>${uvo.out_regdate.substring(0,10)}</td></tr>
						<tr><td>탈퇴사유</td><td>${uvo.u_del}</td></tr>
						<tr><td>복구일</td><td>${uvo.re_regdate}</td></tr>
						<tr><td>복구사유</td><td>${uvo.u_restore}</td></tr>
					</tbody>
				</table>
			</div>
			<div class="user_buttons">
				<input type="hidden" value="${k.u_idx}" name="u_idx"> 
				<input type="hidden" value="${paging.nowPage}" name="cPage"> 
				<button class="user_button">닫기</button>
			</div>
		</div>
		</div> --%>
		
<%@include file="../common/footer.jsp"%>	
</body>
</html>