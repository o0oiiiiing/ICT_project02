<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>비밀번호 변경</title>
<link href="<c:url value="/resources/ygh-css/repwd_page.css"/>" rel='stylesheet' />
<link href="<c:url value="resources/common-css/footer.css"/>" rel='stylesheet' />
</head>
<body>

	<div id="repwd_wrap">
		<form action="repwd_go.do" method="post">
			<h1>비밀번호 변경</h1>
			<div id="repwd_box">
				현재 비밀번호<input type="password" name="u_pwd" id="u_pwd" required>
				새 비밀번호<input type="password" name="re_pwd" id="re_pwd" required>
				새 비밀번호 확인<input type="password" name="re_pwd2" id="re_pwd2" required oninput="pwd_chk()"> <p id="msg"></p>
			</div>
			<input type="submit" id="repwd_ok" value="확인" onclick="repwd_go(this.form)">
			<input type="submit" id="repwd_no" value="취소" onclick="">
		</form>
	</div>


</body>
</html>