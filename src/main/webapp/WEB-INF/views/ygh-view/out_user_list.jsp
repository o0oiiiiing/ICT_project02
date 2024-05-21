<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원관리</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/user_list.css"/>"
	rel='stylesheet' />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	let msg = "${msg}";
	if (msg !== "") {
	    alert(msg);
	}

 	// 회원상세정보
  	function showUserDetail(u_idx) {
		location.href="user_detail.do?u_idx="+u_idx;
 	}  
	
	// 계정 복구
 	function user_restore_ok(f) {
		f.action="user_restore_ok.do"
		f.submit();
	} 
	
	// 계정 복구 토글
 	document.addEventListener('DOMContentLoaded', function() {
 	    let restoreButtons = document.querySelectorAll('.restore_button');
 		let restoreModal = document.getElementById('restoreModal');
 	    let close2Modal = document.querySelector('.close2');
 	    let restoreWrite = document.getElementById('restore_write');
		
 		// 모달 숨기기
 	    function hideModal() {
 	        restoreModal.style.display = 'none';
 	    }
 	    // 모달 보이기
 	    function showModal() {
 	        restoreModal.style.display = 'block';
 	    }
 	    
 	    // 계정 복구 버튼에 대한 이벤트 설정
 	    restoreButtons.forEach(function(restoreButton) {
 	        restoreButton.addEventListener('click', function(event) {
 	            // 해당 버튼이 속한 행의 u_idx 값을 가져오기
 	            let u_idx = this.parentNode.parentNode.querySelector('.u_idx').value;

 	            // restore_write 폼에 u_idx 값 설정
 	            restoreWrite.querySelector('input[name="u_idx"]').value = u_idx;
					
 	      		// 모달 보이기
 	            showModal();
 	            event.preventDefault(); // 기본 동작 취소
 	        });
 	    });
 		// 모달 닫기 버튼 이벤트 설정
 	    close2Modal.addEventListener('click', function() {
 	        hideModal();
 	    });

 	    // 모달 내부 클릭 시 닫기 방지
 	    restoreModal.addEventListener('click', function(event) {
 	        event.stopPropagation();
 	    });
 	});
	
	
</script>
</head>
<body>
	<%@include file="../common/header.jsp"%>

	<div id="user_t">
		<div id="user_h">
			<button>전체회원</button>
			<button>현재회원</button>
			<button>탈퇴회원</button>
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
									<c:if test="${k.active == 1}">
									<td class="${activeRow}">${k.u_name}</td>
									<td class="${activeRow}">${k.u_id}</td>
									<td class="${activeRow}">${k.u_email}</td>
									<td class="${activeRow}">${k.u_regdate.substring(0,10)}</td>
									<td class="${activeRow}">${k.out_regdate.substring(0,10)}</td>
									<td class="${activeRow}">${k.u_report}</td>
									<td class="${activeRow}">
										<button class="user_button" onclick="showUserDetail(${k.u_idx})">상세정보</button>
									</td>
									<td><c:forEach begin="1" end="${k.step}">&nbsp;[Re]</c:forEach>
										<c:choose>
											<c:when test="${k.active == 1}">
												<input type="hidden" class="u_idx" value="${k.u_idx}">
												<button class="restore_button">계정복구</button>
											</c:when>
											<c:otherwise>
												<input type="hidden" class="u_idx" value="${k.u_idx}">
												<button class="del_button">계정삭제</button>
											</c:otherwise>
										</c:choose>
									</td>
									</c:if>
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
										<li><a
											href="user_list.do?cPage=${paging.beginBlock - paging.pagePerBlock}">&#8249;</a>
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
		</div>
	</div>

	<!-- 계정삭제 -->
	<div id="delModal" class="modal">
		<div class="modal-content">
			<span class="close">&times;</span>
			<form method="post">
				<div id="del_write">
					<div class="del_container">
						<div class="del_content">
							<table style="margin: auto;">
								<tbody>
									<tr>
										<td style="width: 30%">사유</td>
										<td><input type="text" name="u_del" required size="40"> </td>
									</tr>
									<tr>
										<td style="width: 30%">비밀번호</td>
										<td><input type="password" name="a_pwd" id="passwordInput" required size="40"></td>
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
		</div>
	</div>
	
	<!-- 계정복구 -->
	<div id="restoreModal" class="modal">
		<div class="modal-content">
			<span class="close2">&times;</span>
			<form method="post">
				<div id="restore_write">
					<div class="restore_container">
						<div class="restore_content">
							<table style="margin: auto;">
								<tbody>
									<tr>
										<td style="width: 30%">사유</td>
										<td><input type="text" name="u_restore" required size="40"></td>
									</tr>
									<tr>
										<td style="width: 30%">비밀번호</td>
										<td><input type="password" name="a_pwd" id="passwordInput" required size="40"></td>
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
		</div>
	</div>
	<%@include file="../common/footer.jsp"%>
</body>
</html>