<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
<!-- 파비콘 -->
<link rel="shortcut icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link rel="icon" href="resources/common-image/favicon.ico" type="image/x-icon">
<link href="<c:url value="/resources/ygh-css/repwd_page.css"/>" rel='stylesheet' />
<link href="<c:url value="resources/common-css/footer.css"/>" rel='stylesheet' />
<script type="text/javascript">
	// 비밀번호 확인 
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
	
	// 비밀번호 변경 후 결과 alert창
    let msg = "${msg}";
    if (msg !== "") {
        alert(msg);
    }
    
    function repwd_go(f) {
		f.action = "repwd_go.do";
		f.submit();
	}
		
</script>
</head>
<body>
<%@include file="../common/header.jsp"%>
	<div id="repwd_wrap">
		<form method="post">
			<h1>비밀번호 변경</h1>
			<div id="repwd_box">
				현재 비밀번호<input type="password" name="u_pwd" id="u_pwd" required>
				새 비밀번호<input type="password" name="re_pwd" id="re_pwd" required>
				새 비밀번호 확인<input type="password" name="re_pwd2" id="re_pwd2" required oninput="pwd_chk()"> 
				<p id="msg"></p>
			</div>
			<input type="hidden" value="${userVO.u_idx}" name="u_idx">
			<input type="submit" id="repwd_ok" value="확인" onclick="repwd_go(this.form)">
			<input type="submit" id="repwd_no" value="취소" onclick="">
		</form>
	</div>

<%@include file="../common/footer.jsp"%>
</body>
</html>