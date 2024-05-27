<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>UPDATE_PW | Jeju_travel</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/repwd_page.css"/>" rel='stylesheet' />
<link href="<c:url value="resources/common-css/footer.css"/>" rel='stylesheet' />
<script type="text/javascript">
	// 비밀번호 일치 여부
 	function pwd_chk() {
		let re_pwd = document.getElementById('re_pwd');
		let re_pwd2 = document.getElementById('re_pwd2');
		let msg = document.getElementById('msg');
		
		let trueColor = "green";	
		let falseColor = "red";
		
		if (re_pwd.value == re_pwd2.value) {
			msg.style.color = trueColor;
			msg.innerHTML = "비밀번호 일치"
		} else {
			msg.style.color = falseColor;
			msg.innerHTML = "비밀번호 불일치"
		}
	} 
	
	// 비밀번호 유효성 검사
 	function repwd_go(f) {
 		if (!/(?=.*\d)(?=.*[a-zA-Z])(?=.*\W).{6,}/.test(f.re_pwd.value)) {
			alert("비밀번호는 최소 6자 이상이어야 하며, 영문자, 숫자, 특수문자를 모두 포함해야 합니다.");
			f.re_pwd.focus();
			return false;
 		}
 		f.action = "repwd_go.do";
		f.submit();
	}
		
	// 비밀번호 변경 후 결과 alert창
    let msg = "${msg}";
    if (msg !== "") {
        alert(msg);
    }
    
 	
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<div id="repwd_wrap">
		<form method="post">
			<h1>비밀번호 변경</h1>
			<div id="repwd_box">
				<p>현재 비밀번호<br>
				<input type="password" name="u_pwd" id="u_pwd" required></p>
				<p>새 비밀번호<br>
				<input type="password" name="re_pwd" id="re_pwd" required></p>
				<p>새 비밀번호 확인<br>
				<input type="password" name="re_pwd2" id="re_pwd2" required oninput="pwd_chk()"></p> 
				<p id="msg"></p>
			</div>
			<input type="hidden" value="${userVO.u_idx}" name="u_idx">
			<input type="button" id="repwd_ok" value="확인" onclick="repwd_go(this.form)">
			<input type="button" id="repwd_no" value="취소" onclick="history.go(-1)">
		</form>
	</div>

<%@include file="../common/footer.jsp"%>
</body>
</html>