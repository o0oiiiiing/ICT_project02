<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>FIND_PW | Jeju_travel</title>
		<link href="resources/common-css/reset.css" rel="stylesheet" />
		<link href="resources/lsh_css/find_pwd.css" rel="stylesheet" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
		<script type="text/javascript">
			let msg = "${msg}";
			if (msg !== "") {
				alert(msg);
			}
			function back() {
				window.history.back();
			}
		</script>
		<style type="text/css">
			.find_pwd_page {
				padding: 8% 0 0;
			  	margin: auto;
			  	width: 100%;
			  	height: 600px;
			  	background-image: url('resources/lsh_images/jeju_island.jpg');
			  	background-position: center;
			  	background-size: cover;
			}
		</style>
	</head>
	<body>
		<%@include file="../common/header.jsp" %>
		<section class="find_pwd_page">
			<div class="find_pwd_container" style="opacity: 0.9; height: 400px;">
				<form method="post" action="email_send_ok.do">
				<h3 class="find_pwd_text">비밀번호 찾기</h3>
					<div class="find_pwd_box">
						<ul>
							<li>
								<input type="text" name="u_id" placeholder="아이디를 입력하세요" />
							</li>
							<li>
								<input type="email" name="u_email" placeholder="이메일을 입력하세요" pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" />
							</li>
							<li>
								<input type="submit" class="find_pwd_btn" value="임시 비밀번호 발급 받기" />
							</li>
							<li>
								<input type="button" class="find_pwd_btn" onclick="back()" value="Cancel">
							</li>
						</ul>
					</div>
					<div class="find_pwd_link_box">
						<a href="login_go.do" >로그인 &nbsp; &nbsp;</a> 
					</div>
				</form>
			</div>
		</section>
		<%@include file="../common/footer.jsp" %>
	</body>
</html>