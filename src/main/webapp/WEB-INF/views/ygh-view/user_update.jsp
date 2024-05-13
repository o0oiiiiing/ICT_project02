<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원정보수정</title>
<link href="<c:url value="/resources/ygh-css/user_update.css"/>" rel='stylesheet' />
<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		let pwdchk = "${pwdchk}";
		if (pwdchk == 'fail') {
			alert("비밀번호 틀림");
			return;
		}
	});
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
	//주소 api
	function execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				let addr = ''
				let extraAddr = '';
	
				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}
	
				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("u_detail_addr2").value = extraAddr;
				} else {
					document.getElementById("u_detail_addr2").value = '';
				}
				
				document.getElementById('u_postcode').value = data.zonecode;
				document.getElementById('u_addr').value = addr;
				document.getElementById('u_detail_addr').focus();
			}
		}).open();
	}

	function user_update_ok(f) {
		f.action = "user_update_ok.do";
		f.submit();
	}
	
	function repwd_go() {
		location.href = "repwd_go.do";
	}
	
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>

	<div id="update_wrap">
		<form method="post">
			<h1>회원정보수정</h1>
			<div id="update_box">
				<label>아이디</label>
				<input type="text" name="u_id" id="u_id" value="${userVO.u_id}" readonly><br> 
				
				<label>이름</label>
				<input type="text" name="u_name" id="u_name" value="${userVO.u_name}" readonly><br> 
				
				<label>전화번호</label>
				<input type="text" name="u_phone" id="u_phone" value="${userVO.u_phone}" title="- 를 제외한 11자리를 입력해 주세요."><br> 
				
				<label>이메일</label>
				<input type="text" name="u_email" id="u_email" value="${userVO.u_email}" 
				pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식" ><br> 
				
				<label>주소</label>
				<input type="text" id="u_postcode" name="u_postcode" placeholder="우편번호" value="${userVO.u_postcode}" readonly /> 
				<input type="button" class="join_btn" onclick="execDaumPostcode()" value="우편번호 찾기" /> <br> 
				<input type="text" id="u_addr" name="u_addr" placeholder="도로명주소" value="${userVO.u_addr}"  /><br> 
				<input type="text" id="u_detail_addr" name="u_detail_addr" placeholder="상세주소1" value="${userVO.u_detail_addr}"   /><br>
				<input type="text" id="u_detail_addr2" name="u_detail_addr2" placeholder="상세주소2" value="${userVO.u_detail_addr2}"  /><br> 
			
				<label>비밀번호 확인</label>
				<input type="password" name="u_pwd" id="u_pwd" ><br> 
				
			</div>
			<input type="hidden" value="${userVO.u_idx}" name="u_idx">
			<input type="button" id="update_ok" value="저장" onclick="user_update_ok(this.form)">
			<button id="u_pwd" onclick="repwd_go()">비밀번호변경</button>
		</form>
	</div>

<%@include file="../common/footer.jsp"%>
</body>
</html>