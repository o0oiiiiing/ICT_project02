<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>관리자 로그인</title>
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/admin_login.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			function admin_login_ok(f) {
				if (f.a_id.value === '' || f.a_pwd.value === '') {
					alert("다시 입력하세요");
					return;
				}
				f.action="admin_login_ok.do";
				f.submit();
			}
			// 경고창
			let msg = "${msg}";
			if (msg !== "") {
			    alert(msg);
			}
		</script>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="admin_login_page">
			<div class="admin_login_box">
				<form method="post" class="login_form">
					<h3 class="admin_login_text">관리자 로그인</h3>
					<div>
						<ul>
							<li>
								<input type="text"  id="a_id" name="a_id" placeholder="아이디" required>
							</li>
							<li>
								<input type="password" id="a_pwd" name="a_pwd" placeholder="비밀번호" required>
							</li>
							<li>
								<input type="button" class="admin_login_btn" value="로그인" onclick="admin_login_ok(this.form)">
							</li>
						</ul>
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>